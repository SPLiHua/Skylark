using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Skylark
{
    public class AssetDataPackage
    {
        /// <summary>
        /// 代表依赖关系的类
        /// </summary>
        [Serializable]
        public class ABUnit
        {
            public string abName;
            public string[] abDepends;

            public ABUnit(string name, string[] depends)
            {
                abName = name;
                if (depends == null || depends.Length == 0)
                {

                }
                else
                {
                    abDepends = depends;
                }
            }

            public override string ToString()
            {
                //todo
                return null;
            }
        }

        [Serializable]
        public class SerializeData
        {
            private string mKey;
            private ABUnit[] mAbUnitArray;
            private AssetData[] mAssetDataArray;

            public string key
            {
                get { return mKey; }
                set { mKey = value; }
            }

            public ABUnit[] abUnitArray
            {
                get { return mAbUnitArray; }
                set { mAbUnitArray = value; }
            }

            public AssetData[] assetDataArray
            {
                get { return mAssetDataArray; }
                set { mAssetDataArray = value; }
            }
        }

        private string m_Key;
        private List<ABUnit> m_ABUnitList;
        private Dictionary<string, AssetData> m_AssetDataMap;

        public string key
        {
            get { return m_Key; }
        }

        #region //生命周期
        public AssetDataPackage(string key)
        {
            m_Key = key;
        }

        string m_FolderPath;
        public AssetDataPackage(SerializeData data, string path)
        {
            m_FolderPath = path;
            SetSerizlizeData(data);
        }

        public void Reset()
        {
            if (m_ABUnitList != null)
            {
                m_ABUnitList.Clear();
            }

            if (m_AssetDataMap != null)
            {
                m_AssetDataMap.Clear();
            }
        }
        #endregion

        #region //获取清单数据逻辑
        public bool GetAssetBundleDepends(string abName, out string[] result)
        {
            result = null;

            ABUnit unit = GetABUnit(abName);

            if (unit == null)
            {
                return false;
            }

            result = unit.abDepends;

            return true;
        }

        public bool GetAssetBundleName(string assetName, int index, out string result)
        {
            result = null;

            if (m_ABUnitList == null)
            {
                return false;
            }

            if (index >= m_ABUnitList.Count)
            {
                return false;
            }

            if (m_AssetDataMap.ContainsKey(assetName))
            {
                result = m_ABUnitList[index].abName;
                return true;
            }

            return false;
        }
        #endregion

        #region //存储清单逻辑
        public bool AddAssetData(AssetData data)
        {
            if (m_AssetDataMap == null)
            {
                m_AssetDataMap = new Dictionary<string, AssetData>();
            }

            string assetName = data.AssetName.ToLower();

            if (m_AssetDataMap.ContainsKey(assetName))
            {
                AssetData old = CheckAssetData(data.AssetName);
                if (data.AssetName.EndsWith("spritesdata"))
                {
                    //Debug.Log(msg);
                }
                else if (m_ABUnitList[old.AssetBundleIndex].abName.Contains("anim"))
                {
                    //Debug.Log(msg);
                }
                else
                {
                    //Debug.Log(msg);
                }
                return false;
            }

            m_AssetDataMap.Add(assetName, data);
            return true;
        }

        public int AddAssetBundleMsg(string name, string[] depends)
        {
            if (string.IsNullOrEmpty(name))
            {
                return -1;
            }

            if (m_ABUnitList == null)
            {
                m_ABUnitList = new List<ABUnit>();
            }

            AssetData config = CheckAssetData(name);


            if (config != null)
            {
                return config.AssetBundleIndex;
            }

            m_ABUnitList.Add(new ABUnit(name, depends));

            int index = m_ABUnitList.Count - 1;
            AddAssetData(new AssetData(name, ResLoadType.AssetBundle, index, null));

            return index;
        }

        public void Save(string outFolder)
        {
            SerializeData sd = GetSerializeData();

            string outPath = string.Format("{0}{1}/{2}", outFolder, m_Key, ProjectPathConfig.abConfigfileName);
            if (SerializeHelper.SerializeBinary(outPath, sd))
            {
                Debug.Log("Success Save AssetDataTable:" + outPath);
            }
            else
            {
                Debug.Log("Failed Save AssetDataTable:" + outPath);
            }
        }

        public ABUnit GetABUnit(string assetName)
        {
            AssetData data = GetAssetData(assetName);

            if (data == null)
            {
                return null;
            }

            if (m_ABUnitList == null)
            {
                return null;
            }

            return m_ABUnitList[data.AssetBundleIndex];
        }

        public AssetData GetAssetData(string name)
        {
            if (m_AssetDataMap == null)
            {
                return null;
            }

            string key = name.ToLower();

            AssetData result = null;
            if (m_AssetDataMap.TryGetValue(key, out result))
            {
                return result;
            }

            return null;
        }

        private AssetData CheckAssetData(string name)
        {
            if (m_AssetDataMap == null)
            {
                return null;
            }

            string key = name.ToLower();

            AssetData result = null;
            if (m_AssetDataMap.TryGetValue(key, out result))
            {
                return result;
            }

            return null;
        }

        private SerializeData GetSerializeData()
        {
            SerializeData sd = new SerializeData();
            sd.key = m_Key;
            sd.abUnitArray = m_ABUnitList.ToArray();
            if (m_AssetDataMap != null)
            {
                AssetData[] acArray = new AssetData[m_AssetDataMap.Count];

                int index = 0;
                foreach (var item in m_AssetDataMap)
                {
                    acArray[index++] = item.Value;
                }

                sd.assetDataArray = acArray;
            }

            return sd;
        }

        private void SetSerizlizeData(SerializeData data)
        {
            if (data == null)
            {
                return;
            }

            m_Key = data.key;
            m_ABUnitList = new List<ABUnit>(data.abUnitArray);

            if (data.assetDataArray != null)
            {
                m_AssetDataMap = new Dictionary<string, AssetData>();

                for (int i = 0; i < data.assetDataArray.Length; ++i)
                {
                    AssetData config = data.assetDataArray[i];
                    AddAssetData(config);
                }
            }
        }
        #endregion
    }
}