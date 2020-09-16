using System;
using UnityEngine;

using System.Collections;
using System.Collections.Generic;
using System.IO;

namespace Skylark
{
    public class PathHelper
    {

        public static string FileNameWithoutSuffix(string name)
        {
            if (name == null)
            {
                return null;
            }

            int endIndex = name.LastIndexOf('.');
            if (endIndex > 0)
            {
                return name.Substring(0, endIndex);
            }
            return name;
        }

        public static string FullAssetPath2Name(string fullPath)
        {
            string name = FileNameWithoutSuffix(fullPath);
            if (name == null)
            {
                return null;
            }

            int endIndex = name.LastIndexOf('/');
            if (endIndex > 0)
            {
                return name.Substring(endIndex + 1);
            }
            return name;
        }

        public static string GetFolderPath(string filePath)
        {
            FileInfo info = new FileInfo(filePath);
            return info.Directory.FullName + "/";
        }

        public static string AssetBundlePath2ABName(string absPath)
        {
            absPath = absPath.Replace("\\", "/");
            string parren = ProjectPathConfig.absExportRootFolder;
            absPath = absPath.Replace(parren, "");
            return absPath;
        }
    }
}
