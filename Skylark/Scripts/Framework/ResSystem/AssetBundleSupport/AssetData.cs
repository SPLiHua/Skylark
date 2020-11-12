using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    [System.Serializable]
    public class AssetData
    {
        private string m_AssetName;
        private string m_OwnerBundleName;
        private int m_ABIndex;
        private short m_AssetType;

        public string AssetName
        {
            get { return m_AssetName; }
            set { m_AssetName = value; }
        }

        public int AssetBundleIndex
        {
            get { return m_ABIndex; }
            set { m_ABIndex = value; }
        }

        public string OwnerBundleName
        {
            get { return m_OwnerBundleName; }
            set { m_OwnerBundleName = value; }
        }

        public short AssetType
        {
            get { return m_AssetType; }
            set { m_AssetType = value; }
        }


        public string UUID
        {
            get
            {
                return string.IsNullOrEmpty(m_OwnerBundleName)
                    ? AssetName
                    : OwnerBundleName + AssetName;
            }
        }

        public AssetData(string assetName, short assetType, int abIndex, string ownerBundleName)
        {
            m_AssetName = assetName;
            m_AssetType = assetType;
            m_ABIndex = abIndex;
            m_OwnerBundleName = ownerBundleName;
        }

        public AssetData()
        {
        }
    }
}