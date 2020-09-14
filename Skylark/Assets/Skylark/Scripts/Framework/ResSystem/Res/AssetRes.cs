using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AssetRes : Res
    {
        protected string[] m_AssetBundleArray;
        protected AssetBundleRequest m_AssetBundleRequest;

        public static AssetRes Allocate(string name)
        {
            AssetRes res = ObjectPool<AssetRes>.S.Allocate();
            if (res != null)
            {
                res.AssetName = name;
                res.InitAssetBundleName();
            }
            return res;
        }

        protected string assetBundleName
        {
            get
            {
                if (m_AssetBundleArray == null)
                {
                    return null;
                }
                return m_AssetBundleArray[0];
            }
        }

        public AssetRes(string name) : base(name)
        {

        }

        public AssetRes()
        {

        }


        public override bool LoadSync()
        {
            if (!CheckLoadAble())
            {
                return false;
            }

            if (string.IsNullOrEmpty(assetBundleName))
            {
                return false;
            }

            AssetBundleRes abR = ResMgr.S.GetRes<AssetBundleRes>(assetBundleName);
            if (abR == null || abR.assetBundle == null)
            {
                return false;
            }

            State = ResState.Loading;

            HoldDependRes();

            UnityEngine.Object obj = abR.assetBundle.LoadAsset(AssetName);
            UnHoldDependRes();

            if (obj == null)
            {
                OnResLoadFailed();
                return false;
            }

            m_Asset = obj;

            State = ResState.Ready;
            return true;
        }

        public override void LoadAsync()
        {
            if (!CheckLoadAble())
            {
                return;
            }

            if (string.IsNullOrEmpty(assetBundleName))
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

            AssetBundleRes abR = ResMgr.S.GetRes<AssetBundleRes>(assetBundleName);

            if (abR == null || abR.assetBundle == null)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            //确保加载过程中依赖资源不被释放:目前只有AssetRes需要处理该情况
            HoldDependRes();

            AssetBundleRequest abQ = abR.assetBundle.LoadAssetAsync(AssetName);
            m_AssetBundleRequest = abQ;

            yield return abQ;

            m_AssetBundleRequest = null;

            UnHoldDependRes();

            if (refCount <= 0)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            if (!abQ.isDone)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            m_Asset = abQ.asset;

            if (m_Asset == null)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            State = ResState.Ready;

            finishCallback();
        }

        public override string[] GetDependResList()
        {
            return m_AssetBundleArray;
        }

        public override void OnCacheReset()
        {
            m_AssetBundleArray = null;
        }

        public override void Recycle2Cache()
        {
            ObjectPool<AssetRes>.S.Recycle(this);
        }

        protected override float CalculateProgress()
        {
            if (m_AssetBundleRequest == null)
            {
                return 0;
            }

            return m_AssetBundleRequest.progress;
        }

        protected void InitAssetBundleName()
        {
            m_AssetBundleArray = null;

            AssetData config = AssetDataTable.S.GetAssetData(AssetName);

            if (config == null)
            {
                return;
            }

            string assetBundleName = AssetDataTable.S.GetAssetBundleName(config.AssetName, config.AssetBundleIndex);

            if (string.IsNullOrEmpty(assetBundleName))
            {
                return;
            }
            m_AssetBundleArray = new string[1];
            m_AssetBundleArray[0] = assetBundleName;
        }
    }
}