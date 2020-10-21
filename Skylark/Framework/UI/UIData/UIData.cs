using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public enum PanelShowMode
    {
        Normal,
        Pop,
        HideOther,
    }

    public class UIData
    {
        protected string m_Name;
        protected int m_UIID;
        //默认都是单例
        protected bool m_IsSingleton = true;
        protected bool m_IsABMode = false;

        public string name
        {
            get { return m_Name; }
        }

        public int uiID
        {
            get { return m_UIID; }
        }
        public bool isSingleton
        {
            get { return m_IsSingleton; }
        }

        public string shortName
        {
            get { return GenerateShortName(m_Name); }
        }

        public virtual string fullPath
        {
            get
            {
                if (m_IsABMode)
                {
                    return m_Name;
                }

                return string.Format(prefixPath, m_Name);
            }
        }
        protected virtual string prefixPath
        {
            get
            {
                return "Resources/";
            }
        }

        public UIData(int id, string name, bool abMode)
        {
            m_UIID = id;
            m_Name = name;
            m_IsABMode = abMode;
            ProcessNameAsABMode();
        }

        protected void ProcessNameAsABMode()
        {
            if (m_IsABMode)
            {
                m_Name = PathHelper.FullAssetPath2Name(m_Name);
            }
        }

        private string GenerateShortName(string name)
        {
            int folderIndex = name.LastIndexOf('/');
            if (folderIndex >= 0)
            {
                return name.Substring(folderIndex + 1);
            }

            return name;
        }
    }

    public class PanelData : UIData
    {
        public static string PREFIX_PATH = "";
        public PanelShowMode m_PanelShowMode;

        public PanelData(int id, string name, bool abMode, PanelShowMode showMode = PanelShowMode.Normal)
        : base(id, name, abMode)
        {
            m_PanelShowMode = showMode;
        }

        protected override string prefixPath
        {
            get
            {
                return PREFIX_PATH;
            }
        }
    }

    public class UIDataTable
    {
        private static Dictionary<int, UIData> m_UIDataMap = new Dictionary<int, UIData>();
        private static Dictionary<string, UIData> m_UINameDataMap = new Dictionary<string, UIData>();
        private static bool s_IsABMode = false;
        public static void SetABMode(bool abMode)
        {
            s_IsABMode = abMode;
        }

        //目前只开放一个增加数据的函数，不同的T类型转换为int类型需注意大小
        public static void AddPanelData<T>(T uiID, string name, PanelShowMode showMode = PanelShowMode.Normal) where T : IConvertible
        {
            Add(new PanelData(uiID.ToInt32(null), name, s_IsABMode, showMode));
        }

        private static void Add(UIData data)
        {
            if (data == null)
            {
                return;
            }

            if (m_UIDataMap.ContainsKey(data.uiID))
            {
                return;
            }

            m_UIDataMap.Add(data.uiID, data);

            m_UINameDataMap.Add(data.shortName, data);
        }

        public static UIData Get<T>(T uiID) where T : IConvertible
        {
            UIData result = null;

            if (m_UIDataMap.TryGetValue(uiID.ToInt32(null), out result))
            {
                return result;
            }

            return null;
        }

        public static UIData Get(string name)
        {
            UIData result = null;

            if (m_UINameDataMap.TryGetValue(name, out result))
            {
                return result;
            }

            return null;
        }

        public static int PanelName2UIID(string name)
        {
            UIData data = Get(name);
            if (data != null)
            {
                return data.uiID;
            }

            return -1;
        }
    }
}