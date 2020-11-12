using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Skylark.Editor
{
    public class AssetBundleExporter
    {
        [MenuItem("Assets/Skylark/AssetBundle/构建AB[全局]")]
        public static void BuildAllAssetBundle()
        {
            string exportPath = ProjectPathConfig.absExportRootFolder;

            if (Directory.Exists(exportPath) == false)
            {
                Directory.CreateDirectory(exportPath);
            }

            BuildTarget buildTarget = BuildTarget.StandaloneWindows;
#if UNITY_IPHONE
            buildTarget = BuildTarget.iOS;
#elif UNITY_ANDROID
            buildTarget = BuildTarget.Android;
#elif UNITY_STANDALONE_OSX
            buildTarget = BuildTarget.StandaloneOSX;
#elif UNITY_STANDALONE_WIN
            buildTarget = BuildTarget.StandaloneWindows;
#endif

            AssetDatabase.RemoveUnusedAssetBundleNames();
            AssetDatabase.Refresh();
            //采用LZ4压缩，压缩率没有LZMA高，可以加载指定资源而不用解压全部
            BuildPipeline.BuildAssetBundles("Assets/" + ProjectPathConfig.exportRootFolder, BuildAssetBundleOptions.ChunkBasedCompression, buildTarget);

            BuildDataTable();
        }

        [MenuItem("Assets/Skylark/AssetBundle/生成Asset清单")]
        public static void BuildDataTable()
        {
            AssetDataTable table = new AssetDataTable();

            ProcessAssetBundleRes(table);

            table.Save(ProjectPathConfig.absExportRootFolder);
            AssetDatabase.Refresh();
        }

        /// <summary>
        /// 不会加入AssetDataTable清单
        /// </summary>
        [MenuItem("Assets/Skylark/AssetBundle/构建AB[当前文件夹]")]
        public static void BuildAssetBundlesInSelectFolder()
        {
            string selectPath = EditorUtils.GetSelectedDirAssetsPath();//.CurrentSelectFolder;
            if (selectPath == null)
            {
                Log.I("Not Select Any Folder!");
                return;
            }

            BuildAssetBundlesInSelectFolder(selectPath);
        }

        /// <summary>
        /// 会重新构建清单
        /// </summary>
        [MenuItem("Assets/Skylark/AssetBundle/清理无效AB")]
        public static void RemoveInvalidAssetBundle()
        {
            AssetDataTable table = new AssetDataTable();

            ProcessAssetBundleRes(table);

            Log.I("#Start Remove Invalid AssetBundle");

            RemoveInvalidAssetBundleInner(ProjectPathConfig.absExportRootFolder, table);

            Log.I("#Success Remove Invalid AssetBundle.");
        }


        #region //构建当前文件夹AB逻辑
        public static void BuildAssetBundlesInSelectFolder(string selectPath)
        {
            string exportPath = ProjectPathConfig.absExportRootFolder;

            if (Directory.Exists(exportPath) == false)
            {
                Directory.CreateDirectory(exportPath);
            }

            Dictionary<string, int> builderData = new Dictionary<string, int>();
            CollectABInFolder(selectPath, builderData);

            List<AssetBundleBuild> builderList = new List<AssetBundleBuild>();
            foreach (var cell in builderData)
            {
                string abName = cell.Key;
                AssetBundleBuild build = new AssetBundleBuild();
                build.assetBundleName = abName;
                build.assetNames = AssetDatabase.GetAssetPathsFromAssetBundle(abName);
                builderList.Add(build);
            }

            if (builderList.Count == 0)
            {
                Log.I("No AssetBundles Found InSelectFolder:" + selectPath);
                return;
            }

            BuildTarget buildTarget = BuildTarget.StandaloneWindows;
#if UNITY_IPHONE
            buildTarget = BuildTarget.iOS;
#elif UNITY_ANDROID
            buildTarget = BuildTarget.Android;
#elif UNITY_STANDALONE_OSX
            buildTarget = BuildTarget.StandaloneOSX;
#elif UNITY_STANDALONE_WIN
            buildTarget = BuildTarget.StandaloneWindows;
#endif

            BuildPipeline.BuildAssetBundles("Assets/" + ProjectPathConfig.exportRootFolder,
                builderList.ToArray(),
                BuildAssetBundleOptions.ChunkBasedCompression,
                buildTarget);

            Log.I("Finish Build AssetBundles InSelectFolder:" + selectPath);
        }

        private static void CollectABInFolder(string folderPath, Dictionary<string, int> builderData)
        {
            if (folderPath == null)
            {
                Log.I("Folder Path Is Null.");
                return;
            }

            string workPath = EditorUtils.AssetsPath2ABSPath(folderPath);

            var filePaths = Directory.GetFiles(workPath);

            for (int i = 0; i < filePaths.Length; ++i)
            {
                if (!AssetFileFilter.IsAsset(filePaths[i]))
                {
                    continue;
                }

                string fileName = Path.GetFileName(filePaths[i]);

                string fullFileName = string.Format("{0}/{1}", folderPath, fileName);

                AssetImporter ai = AssetImporter.GetAtPath(fullFileName);
                if (ai == null)
                {
                    Log.I("Not Find Asset:" + fullFileName);
                    continue;
                }
                else if (!string.IsNullOrEmpty(ai.assetBundleName))
                {
                    RecordNewAB(ai.assetBundleName, builderData);
                }
            }

            //递归处理文件夹
            var dirs = Directory.GetDirectories(workPath);
            for (int i = 0; i < dirs.Length; ++i)
            {
                string fileName = Path.GetFileName(dirs[i]);

                fileName = string.Format("{0}/{1}", folderPath, fileName);
                CollectABInFolder(fileName, builderData);
            }
        }

        private static void RecordNewAB(string abName, Dictionary<string, int> builderData)
        {
            if (builderData.ContainsKey(abName))
            {
                return;
            }

            builderData.Add(abName, 0);

            string[] depends = AssetDatabase.GetAssetBundleDependencies(abName, true);

            if (depends != null)
            {
                for (int i = 0; i < depends.Length; ++i)
                {
                    if (builderData.ContainsKey(depends[i]))
                    {
                        continue;
                    }

                    builderData.Add(depends[i], 0);
                }
            }
        }
        #endregion

        #region //生成Asset清单
        public static void ProcessAssetBundleRes(AssetDataTable table)
        {
            var abNameArr = AssetDatabase.GetAllAssetBundleNames();
            if (abNameArr != null && abNameArr.Length > 0)
            {
                foreach (var abName in abNameArr)
                {
                    var dependArr = AssetDatabase.GetAssetBundleDependencies(abName, false);
                    AssetDataPackage group;
                    var abIndex = table.AddAssetBundleMsg(abName, dependArr, out group);
                    if (abIndex < 0)
                    {
                        continue;
                    }
                    var assets = AssetDatabase.GetAssetPathsFromAssetBundle(abName);
                    foreach (var cell in assets)
                    {
                        //var type = AssetDatabase.GetMainAssetTypeAtPath(cell);
                        //var code = type.ToCode();

                        group.AddAssetData(cell.EndsWith(".unity")
                            ? new AssetData(AssetPath2Name(cell), ResLoadType.ABScene, abIndex, abName)
                            : new AssetData(AssetPath2Name(cell), ResLoadType.ABAsset, abIndex, abName));
                    }
                }
            }
        }

        private static string AssetPath2Name(string assetPath)
        {
            int startIndex = assetPath.LastIndexOf("/") + 1;
            int endIndex = assetPath.LastIndexOf(".");

            if (endIndex > 0)
            {
                int length = endIndex - startIndex;
                return assetPath.Substring(startIndex, length).ToLower();
            }

            return assetPath.Substring(startIndex).ToLower();
        }
        #endregion

        #region //清除无效AB
        private static void RemoveInvalidAssetBundleInner(string absPath, AssetDataTable table)
        {
            string[] dirs = Directory.GetDirectories(absPath);

            if (dirs != null && dirs.Length > 0)
            {
                for (int i = 0; i < dirs.Length; ++i)
                {
                    RemoveInvalidAssetBundleInner(dirs[i], table);
                }
            }

            string[] files = Directory.GetFiles(absPath);
            if (files != null && files.Length > 0)
            {
                for (int i = 0; i < files.Length; ++i)
                {
                    string p = PathHelper.AssetBundlePath2ABName(files[i]);
                    if (!AssetFileFilter.IsAssetBundle(p))
                    {
                        continue;
                    }
                    //Log.I("清除name：" + p);
                    if (table.GetABUnit(p) == null)
                    {
                        File.Delete(files[i]);
                        File.Delete(files[i] + ".meta");
                        File.Delete(files[i] + ".manifest");
                        File.Delete(files[i] + ".manifest.meta");

                        Log.I("Delete Invalid AB:" + p);
                    }
                }

                files = Directory.GetFiles(absPath);
                if (files == null || files.Length == 0)
                {
                    Directory.Delete(absPath);
                }
            }
            else
            {
                Directory.Delete(absPath);
            }
        }
        #endregion
    }

    public class AssetFileFilter
    {
        public static bool IsAsset(string fileName)
        {
            if (fileName.EndsWith(".meta") || fileName.EndsWith(".gaf") || fileName.EndsWith(".DS_Store"))
            {
                return false;
            }
            return true;
        }

        public static bool IsAssetBundle(string fileName)
        {
            if (fileName.EndsWith(".bundle"))
            {
                return true;
            }
            return false;
        }

        public static bool IsConfigTable(string fileName)
        {
            if (fileName.EndsWith(".txt"))
            {
                return true;
            }
            return false;
        }
    }
}