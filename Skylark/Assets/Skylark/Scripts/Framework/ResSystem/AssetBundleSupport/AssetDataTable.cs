using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AssetDataTable : Singleton<AssetDataTable>
    {
        private List<AssetDataPackage> m_ActiveAssetDataPackageList = new List<AssetDataPackage>();
        private List<AssetDataPackage> m_AssetDataPackageList = new List<AssetDataPackage>();

        #region //生命周期
        public void LoadPackageFromFile(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                return;
            }

            object data = SerializeHelper.DeserializeBinary(FileMgr.S.OpenReadStream(path));

            if (data == null)
            {
                return;
            }

            AssetDataPackage.SerializeData sd = data as AssetDataPackage.SerializeData;

            if (sd == null)
            {
                return;
            }

            AssetDataPackage package = new AssetDataPackage(sd, path);

            string key = package.key;


            for (int i = m_ActiveAssetDataPackageList.Count - 1; i >= 0; --i)
            {
                if (m_ActiveAssetDataPackageList[i].key.Equals(key))
                {
                    return;
                }
            }

            m_ActiveAssetDataPackageList.Add(package);
        }

        public void Reset()
        {
            for (int i = m_AssetDataPackageList.Count - 1; i >= 0; --i)
            {
                m_AssetDataPackageList[i].Reset();
            }

            m_ActiveAssetDataPackageList.Clear();
            m_AssetDataPackageList.Clear();
        }
        #endregion

        #region //获取清单数据逻辑
        public string[] GetAllDependenciesByUrl(string url)
        {
            string abName = PathHelper.AssetBundlePath2ABName(url);
            string[] depends = null;
            for (int i = m_ActiveAssetDataPackageList.Count - 1; i >= 0; --i)
            {
                if (!m_ActiveAssetDataPackageList[i].GetAssetBundleDepends(abName, out depends))
                {
                    continue;
                }

                return depends;
            }
            return null;
        }

        public AssetData GetAssetData(string assetName)
        {
            for (int i = m_ActiveAssetDataPackageList.Count - 1; i >= 0; --i)
            {
                AssetData result = m_ActiveAssetDataPackageList[i].GetAssetData(assetName);
                if (result == null)
                {
                    continue;
                }
                return result;
            }
            return null;
        }

        public string GetAssetBundleName(string assetName, int index)
        {
            string result = null;
            for (int i = m_ActiveAssetDataPackageList.Count - 1; i >= 0; --i)
            {
                if (!m_ActiveAssetDataPackageList[i].GetAssetBundleName(assetName, index, out result))
                {
                    continue;
                }

                return result;
            }
            return null;
        }
        #endregion

        #region //存储清单逻辑
        public int AddAssetBundleMsg(string name, string[] depends, out AssetDataPackage package)
        {
            package = null;

            if (string.IsNullOrEmpty(name))
            {
                return -1;
            }

            string key = null;
            key = GetPackageKeyByABName(name);

            if (string.IsNullOrEmpty(key))
            {
                return -1;
            }

            package = CheckAssetDataPackage(key);


            if (package == null)
            {
                package = new AssetDataPackage(key);
                m_AssetDataPackageList.Add(package);
            }

            return package.AddAssetBundleMsg(name, depends);
        }

        public void Save(string outPath)
        {
            for (int i = 0; i < m_AssetDataPackageList.Count; ++i)
            {
                m_AssetDataPackageList[i].Save(outPath);
            }
        }

        public AssetDataPackage.ABUnit GetABUnit(string name)
        {
            AssetDataPackage.ABUnit result = null;

            for (int i = m_AssetDataPackageList.Count - 1; i >= 0; --i)
            {
                result = m_AssetDataPackageList[i].GetABUnit(name);
                if (result != null)
                {
                    break;
                }
            }

            return result;
        }

        private AssetDataPackage CheckAssetDataPackage(string key)
        {
            for (int i = m_AssetDataPackageList.Count - 1; i >= 0; --i)
            {
                if (m_AssetDataPackageList[i].key.Equals(key))
                {
                    return m_AssetDataPackageList[i];
                }
            }

            return null;
        }

        private string GetPackageKeyByABName(string name)
        {
            int pIndex = name.IndexOf('/');

            if (pIndex < 0)
            {
                return name;
            }

            string key = name.Substring(0, pIndex);
            if (name.Contains("i18res"))
            {
                int i18Start = name.IndexOf("i18res") + 7;
                name = name.Substring(i18Start);
                pIndex = name.IndexOf('/');
                if (pIndex < 0)
                {
                    return null;
                }

                string language = string.Format("[{0}]", name.Substring(0, pIndex));
                key = string.Format("{0}-i18res-{1}", key, language);
            }

            return key;
        }
        #endregion
    }
}