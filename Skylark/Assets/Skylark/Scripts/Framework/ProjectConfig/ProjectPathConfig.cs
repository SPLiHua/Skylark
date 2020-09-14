using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ProjectPathConfig : ScriptableObject
    {
        private const string m_ABRelativePath = "AssetBundles/";
        private const string m_ExportABConfigFile = "asset_bindle_config.bin";

        /// <summary>
        /// AB包导出目录
        /// </summary>
        public static string exportRootFolder
        {
            get { return "StreamingAssets/" + m_ABRelativePath; }
        }

        public static string absExportRootFolder
        {
            get { return Application.streamingAssetsPath + "/" + m_ABRelativePath; }
        }

        /// <summary>
        /// AB配置导出路径
        /// </summary>
        public static string abConfigfileName
        {
            get { return m_ExportABConfigFile; }
        }
    }
}