using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ResourcesRes : Res
    {
        public const string PREFIX_KEY = "Resources/";
        private ResourceRequest m_ResourceRequest;

        public static ResourcesRes Allocate(string name)
        {
            ResourcesRes res = ObjectPool<ResourcesRes>.S.Allocate();
            if (res != null)
            {
                res.AssetName = name;
            }
            return res;
        }

        public static string Name2Path(string name)
        {
            return name.Substring(10);
        }

        public ResourcesRes(string name) : base(name)
        {

        }

        public ResourcesRes()
        {

        }

        public override bool LoadSync()
        {
            if (!CheckLoadAble())
                return false;

            if (string.IsNullOrEmpty(m_AssetName))
                return false;

            State = ResState.Loading;
            m_Asset = Resources.Load(Name2Path(m_AssetName));

            if (m_Asset == null)
            {
                OnResLoadFailed();
                return false;
            }

            State = ResState.Ready;
            return true;
        }

        public override void LoadAsync()
        {
            if (!CheckLoadAble())
                return;

            if (string.IsNullOrEmpty(m_AssetName))
                return;

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

            ResourceRequest rQ = Resources.LoadAsync(Name2Path(m_AssetName));

            m_ResourceRequest = rQ;
            yield return rQ;
            m_ResourceRequest = null;

            if (!rQ.isDone)
            {
                OnResLoadFailed();
                finishCallback();
                yield break;
            }

            m_Asset = rQ.asset;

            State = ResState.Ready;

            finishCallback();
        }

        public override void Recycle2Cache()
        {
            ObjectPool<ResourcesRes>.S.Recycle(this);
        }

        protected override float CalculateProgress()
        {
            if (m_ResourceRequest == null)
                return 0;

            return m_ResourceRequest.progress;
        }
    }
}