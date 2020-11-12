using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Skylark.Editor
{
    public class AssetAutoProcessor : AssetPostprocessor
    {

        //所有的资源的导入，删除，移动，都会调用此方法
        public static void OnPostprocessAllAssets(string[] importedAsset, string[] deletedAssets, string[] movedAssets, string[] movedFromAssetPaths)
        {
            ProcessImportedAssets(importedAsset);
            ProcessMovedAsset(movedAssets, movedFromAssetPaths);
        }

        private static void ProcessMovedAsset(string[] movedAssets, string[] movedFromAssets)
        {
            if (movedAssets != null && movedAssets.Length > 0)
            {
                for (int i = 0; i < movedAssets.Length; ++i)
                {
                    if (movedAssets[i].StartsWith("Assets/Res/"))
                    {
                        ProcessAssetBundleTag(movedAssets[i], true);
                    }
                    else if (movedAssets[i].StartsWith("Assets/Resources/"))
                    {
                        ProcessAssetBundleTag(movedAssets[i], false);
                    }
                }
            }
        }

        private static void ProcessImportedAssets(string[] assetPath)
        {
            if (assetPath == null || assetPath.Length == 0)
            {
                return;
            }

            for (int i = 0; i < assetPath.Length; ++i)
            {
                if (assetPath[i].StartsWith("Assets/Res/"))
                {
                    ProcessAssetBundleTag(assetPath[i], true);
                }
            }
        }

        private static void ProcessAssetBundleTag(string assetPath, bool tag)
        {
            AssetImporter ai = AssetImporter.GetAtPath(assetPath);
            if (ai == null)
            {
                return;
            }

            string fullPath = EditorUtils.AssetsPath2ABSPath(assetPath);
            if (Directory.Exists(fullPath))
            {
                return;
            }

            if (tag)
            {
                string dirName = Path.GetDirectoryName(assetPath);
                dirName = dirName.Replace("\\", "/");
                string assetBundleName = EditorUtils.AssetPath2ReltivePath(dirName).ToLower();
                assetBundleName = assetBundleName.Replace("resources/", "");

                if (assetPath.Contains("FolderMode"))
                {
                    ai.assetBundleName = assetBundleName + ".bundle";
                }
                else
                {
                    ai.assetBundleName = string.Format("{0}/{1}.bundle", assetBundleName, PathHelper.FileNameWithoutSuffix(Path.GetFileName(assetPath)));
                }
            }
            else
            {
                ai.assetBundleName = string.Empty;
            }
        }

        #region //其他
        // public void OnPreprocessModel()
        // {
        //     Log.I("OnPreprocessModel=" + this.assetPath);
        // }
        // public void OnPostprocessModel(GameObject go)
        // {
        //     Log.I("OnPostprocessModel=" + go.name);
        // }
        // //纹理导入之前调用，针对入到的纹理进行设置
        // public void OnPreprocessTexture()
        // {
        //     Log.I("OnPreProcessTexture=" + this.assetPath);

        // }
        // public void OnPostprocessTexture(Texture2D tex)
        // {
        //     Log.I("OnPostProcessTexture=" + this.assetPath);
        // }


        // public void OnPostprocessAudio(AudioClip clip)
        // {

        // }
        // public void OnPreprocessAudio()
        // {
        //     AudioImporter audio = this.assetImporter as AudioImporter;
        //     //audio. = AudioCompressionFormat.MP3;
        // }
        #endregion
    }
}