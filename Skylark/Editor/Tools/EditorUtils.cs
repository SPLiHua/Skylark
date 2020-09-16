using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

namespace Skylark.Editor
{
    public class EditorUtils
    {
        public static string AssetsPath2ABSPath(string assetsPath)
        {
            string assetRootPath = System.IO.Path.GetFullPath(Application.dataPath);
            assetRootPath = assetRootPath.Substring(0, assetRootPath.Length - 6) + assetsPath;
            return assetRootPath.Replace("\\", "/");
        }

        public static string AssetPath2ReltivePath(string path)
        {
            if (path == null)
            {
                return null;
            }
            string s = path.Replace("Assets/", "");
            return s;
        }

        public static string GetSelectedDirAssetsPath()
        {
            string path = string.Empty;

            foreach (UnityEngine.Object obj in Selection.GetFiltered(typeof(UnityEngine.Object), SelectionMode.Assets))
            {
                path = AssetDatabase.GetAssetPath(obj);
                if (!string.IsNullOrEmpty(path) && File.Exists(path))
                {
                    path = Path.GetDirectoryName(path);
                    break;
                }
            }

            return path;
        }
    }
}