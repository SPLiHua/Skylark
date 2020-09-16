using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ResFactory
    {
        public delegate IRes ResCreator(string name);

        interface IResCreatorWrap
        {
            bool CheckResType(string name);
            IRes CreateRes(string name);
        }

        class ResCreatorWrap : IResCreatorWrap
        {
            private string m_Key;
            private ResCreator m_Creator;

            public ResCreatorWrap(string key, ResCreator creator)
            {
                m_Key = key;
                m_Creator = creator;
            }

            public bool CheckResType(string name)
            {
                return name.StartsWith(m_Key);
            }

            public IRes CreateRes(string name)
            {
                return m_Creator(name);
            }
        }

        class AssetResCreatorWrap : IResCreatorWrap
        {
            public bool CheckResType(string name)
            {
                AssetData data = AssetDataTable.S.GetAssetData(name);

                return data != null;
            }

            public IRes CreateRes(string name)
            {
                AssetData data = AssetDataTable.S.GetAssetData(name);

                switch (data.AssetType)
                {
                    case ResLoadType.AssetBundle:
                        return AssetBundleRes.Allocate(name);
                    case ResLoadType.ABAsset:
                        return AssetRes.Allocate(name);
                    case ResLoadType.ABScene:
                        return SceneRes.Allocate(name);
                    default:
                        return null;
                }
            }
        }

        private List<IResCreatorWrap> m_CreatorList;
        private static IResCreatorWrap s_AssetResCreatorWrap;

        public ResFactory()
        {
            ObjectPool<AssetBundleRes>.S.maxCacheCount = 20;
            ObjectPool<AssetRes>.S.maxCacheCount = 40;
            ObjectPool<ResourcesRes>.S.maxCacheCount = 40;
            // ObjectPool<NetImageRes>.S.maxCacheCount = 20;
            // ObjectPool<LocalAudioRes>.S.maxCacheCount = 5;

            m_CreatorList = new List<IResCreatorWrap>();
            s_AssetResCreatorWrap = new AssetResCreatorWrap();

            RegisterResCreate(ResourcesRes.PREFIX_KEY, ResourcesRes.Allocate);
        }

        private void RegisterResCreate(string key, ResCreator creator)
        {
            if (string.IsNullOrEmpty(key) || creator == null)
                return;

            m_CreatorList.Add(new ResCreatorWrap(key, creator));
        }

        public IRes Create(string name)
        {
            if (s_AssetResCreatorWrap.CheckResType(name))
            {
                return s_AssetResCreatorWrap.CreateRes(name);
            }
            else
            {
                for (int i = 0; i < m_CreatorList.Count; i++)
                {
                    if (m_CreatorList[i].CheckResType(name))
                    {
                        return m_CreatorList[i].CreateRes(name);
                    }
                }
            }
            return null;
        }

        public IRes Create(string name, short assetType)
        {
            //todo
            return null;
        }
    }
}