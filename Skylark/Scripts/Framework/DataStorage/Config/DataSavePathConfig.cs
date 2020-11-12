using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class DataSavePathConfig : ScriptableObject
    {
        [SerializeField]
        public List<SaveSetting> saveSettingList;

        private static DataSavePathConfig instance;
        public static DataSavePathConfig S
        {
            get
            {
                if (instance == null)
                {
                    UnityEngine.Object obj = Resources.Load("Config/DataSavePathConfig");
                    if (obj != null)
                    {
                        instance = obj as DataSavePathConfig;
                    }
                }
                return instance;
            }
        }

        public SaveSetting GetSaveSettingPath(string DataName, out int index)
        {
            index = -1;
            for (int i = 0; i < saveSettingList.Count; i++)
            {
                if (saveSettingList[i].DataName == DataName)
                {
                    index = i;
                    return saveSettingList[i];
                }
            }
            return null;
        }
    }
}