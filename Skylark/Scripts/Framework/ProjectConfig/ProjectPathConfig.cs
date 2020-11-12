using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ProjectPathConfig : ScriptableObject
    {
        private const string m_ABRelativePath = "AssetBundles/";
        private const string m_ExportABConfigFile = "asset_bindle_config.bin";

        #region 配置工具相关
        [SerializeField]
        private string m_BuildCSharpWinShell = "table/output_code_csharp.bat";
        [SerializeField]
        public string m_BuildTxtDataWinShell = "table/output_txt.bat";
        [SerializeField]
        public string m_BuildLrgDataWinShell = "table/output_xc.bat";
        [SerializeField]
        public string m_BuildCSharpLinuxShell = "table/output_code_csharp.sh";
        [SerializeField]
        public string m_BuildTxtDataLinuxShell = "table/output_txt.sh";
        [SerializeField]
        public string m_BuildLrgDataLinuxShell = "table/output_xc.sh";

        [SerializeField]
        private string m_ProjectToolsFolder = "/../../../Tools/";
        #endregion

        private static ProjectPathConfig s_Instance;

        private static ProjectPathConfig LoadInstance()
        {
            UnityEngine.Object obj = Resources.Load("Config/ProjectPathConfig");

            if (obj == null)
            {
                return null;
            }

            s_Instance = obj as ProjectPathConfig;

            return s_Instance;
        }

        public static ProjectPathConfig S
        {
            get
            {
                if (s_Instance == null)
                {
                    s_Instance = LoadInstance();
                }

                return s_Instance;
            }
        }

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

        #region 配置工具相关
        public static string buildCSharpWinShell
        {
            get { return S.m_BuildCSharpWinShell; }
        }

        public static string buildTxtDataWinShell
        {
            get { return S.m_BuildTxtDataWinShell; }
        }
        public static string buildLrgDataWinShell
        {
            get { return S.m_BuildLrgDataWinShell; }
        }

        public static string buildCSharpLinuxShell
        {
            get { return S.m_BuildCSharpLinuxShell; }
        }
        public static string buildTxtDataLinuxShell
        {
            get { return S.m_BuildTxtDataLinuxShell; }
        }

        public static string buildLrgDataLinuxShell
        {
            get { return S.m_BuildLrgDataLinuxShell; }
        }

        public static string projectToolsFolder
        {
            get { return Application.dataPath + S.m_ProjectToolsFolder; }
        }
        #endregion
    }
}