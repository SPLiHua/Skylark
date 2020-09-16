using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AssetBundleRes : Res
    {
        private bool m_UnloadFlag = true;
        private string[] m_DependResList;
        private AssetBundleCreateRequest m_AssetBundleCreateRequest;

        public static AssetBundleRes Allocate(string name)
        {
            AssetBundleRes res = ObjectPool<AssetBundleRes>.S.Allocate();
            if (res != null)
            {
                res.AssetName = name;
                res.InitAssetBundleName();
            }
            return res;
        }

        public AssetBundle assetBundle
        {
            get
            {
                return (AssetBundle)m_Asset;
            }

            set
            {
                m_Asset = value;
            }
        }

        public AssetBundleRes(string name) : base(name)
        {

        }

        public AssetBundleRes()
        {

        }

        public override bool LoadSync()
        {
            if (!CheckLoadAble())
            {
                return false;
            }

            State = ResState.Loading;

            string url = ProjectPathConfig.absExportRootFolder + AssetName;
            AssetBundle bundle = AssetBundle.LoadFromFile(url);
            m_UnloadFlag = true;

            if (bundle == null)
            {
                OnResLoadFailed();
                return false;
            }
            assetBundle = bundle;
            State = ResState.Ready;

            return true;
        }

        public override void LoadAsync()
        {
            if (!CheckLoadAble())
            {
                return;
            }

            State = ResState.Loading;

            ResMgr.S.PostIEnumeratorTask(this);
        }

        public override IEnumerator StartIEnumeratorTask(Action finishCallback)
        {
            if (refCount <= 0)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            string url = ProjectPathConfig.absExportRootFolder + AssetName;
            AssetBundleCreateRequest abcR = AssetBundle.LoadFromFileAsync(url);
            m_AssetBundleCreateRequest = abcR;
            yield return abcR;
            m_AssetBundleCreateRequest = null;

            if (!abcR.isDone)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            assetBundle = abcR.assetBundle;
            State = ResState.Ready;

            finishCallback();
        }
        public override void OnCacheReset()
        {
            base.OnCacheReset();
            m_UnloadFlag = true;
            m_DependResList = null;
        }

        public override string[] GetDependResList()
        {
            return m_DependResList;
        }

        public override bool UnloadImage(bool flag)
        {
            if (assetBundle != null)
            {
                m_UnloadFlag = flag;
            }

            return true;
        }

        public override void Recycle2Cache()
        {
            ObjectPool<AssetBundleRes>.S.Recycle(this);
        }

        protected override float CalculateProgress()
        {
            if (m_AssetBundleCreateRequest == null)
            {
                return 0;
            }

            return m_AssetBundleCreateRequest.progress;
        }

        protected override void OnReleaseRes()
        {
            if (assetBundle != null)
            {
                assetBundle.Unload(m_UnloadFlag);
                assetBundle = null;
            }
        }

        private void InitAssetBundleName()
        {
            m_DependResList = AssetDataTable.S.GetAllDependenciesByUrl(AssetName);
        }
    }
}