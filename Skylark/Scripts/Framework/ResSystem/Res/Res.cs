using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class Res : RefCounter, IRes, ICacheAble
    {
        protected string m_AssetName;
        private ResState m_ResState = ResState.Waiting;
        private bool m_CacheFlag = false;
        protected UnityEngine.Object m_Asset;
        private event Action<bool, IRes> m_OnResLoadDoneEvent;

        public string AssetName
        {
            get { return m_AssetName; }
            set { m_AssetName = value; }
        }

        public ResState State
        {
            get { return m_ResState; }
            set
            {
                m_ResState = value;
                if (m_ResState == ResState.Ready)
                {
                    NotifyResLoadDoneEvent(true);
                }
            }
        }

        public float Progress
        {
            get
            {
                if (m_ResState == ResState.Loading)
                {
                    return CalculateProgress();
                }
                if (m_ResState == ResState.Ready)
                    return 1;

                return 0;
            }
        }

        protected virtual float CalculateProgress()
        {
            return 0;
        }

        public UnityEngine.Object Asset
        {
            get { return m_Asset; }
        }

        public object rawAsset
        {
            get { return null; }
        }


        public bool cacheFlag
        {
            get { return m_CacheFlag; }
            set { m_CacheFlag = value; }
        }

        public void RegisteOnResLoadDoneEvent(Action<bool, IRes> listener)
        {
            if (listener == null)
                return;

            if (m_ResState == ResState.Ready)
            {
                listener(true, this);
                return;
            }
            m_OnResLoadDoneEvent += listener;
        }

        public void UnRegisteOnResLoadDoneEvent(Action<bool, IRes> listener)
        {
            if (listener == null)
            {
                return;
            }

            if (m_OnResLoadDoneEvent == null)
            {
                return;
            }

            m_OnResLoadDoneEvent -= listener;
        }

        protected void OnResLoadFailed()
        {
            m_ResState = ResState.Waiting;
            NotifyResLoadDoneEvent(false);
        }

        private void NotifyResLoadDoneEvent(bool result)
        {
            if (m_OnResLoadDoneEvent != null)
            {
                m_OnResLoadDoneEvent(result, this);
                m_OnResLoadDoneEvent = null;
            }
        }

        protected Res(string assetName)
        {
            m_AssetName = assetName;
        }

        public Res()
        {

        }

        protected bool CheckLoadAble()
        {
            return m_ResState == ResState.Waiting;
        }

        protected void HoldDependRes()
        {
            string[] depends = GetDependResList();
            if (depends == null || depends.Length == 0)
            {
                return;
            }

            for (int i = depends.Length - 1; i >= 0; --i)
            {
                var res = ResMgr.S.GetRes(depends[i], false);
                if (res != null)
                {
                    res.AddRef();
                }
            }
        }

        protected void UnHoldDependRes()
        {
            string[] depends = GetDependResList();
            if (depends == null || depends.Length == 0)
            {
                return;
            }

            for (int i = depends.Length - 1; i >= 0; --i)
            {
                var res = ResMgr.S.GetRes(depends[i], false);
                if (res != null)
                {
                    res.SubRef();
                }
            }
        }

        #region  //子类实现
        public virtual bool LoadSync()
        {
            return false;
        }

        public virtual void LoadAsync()
        {

        }

        public virtual string[] GetDependResList()
        {
            return null;
        }

        public virtual bool UnloadImage(bool flag)
        {
            return false;
        }

        public virtual void Recycle2Cache()
        {

        }

        protected virtual void OnReleaseRes()
        {
            //如果Image 直接释放了，这里会直接变成NULL
            if (m_Asset != null)
            {
                if (m_Asset is GameObject)
                {

                }
                else
                {
                    Resources.UnloadAsset(m_Asset);
                }

                m_Asset = null;
            }
        }
        #endregion

        public bool IsDependResLoadFinish()
        {
            string[] depends = GetDependResList();
            if (depends == null || depends.Length == 0)
            {
                return true;
            }

            for (int i = depends.Length - 1; i >= 0; --i)
            {
                var res = ResMgr.S.GetRes(depends[i], false);
                if (res == null || res.State != ResState.Ready)
                {
                    return false;
                }
            }
            return true;
        }

        protected override void OnZeroRef()
        {
            if (m_ResState == ResState.Loading)
                return;

            ReleaseRes();
        }

        public bool ReleaseRes()
        {
            if (m_ResState == ResState.Loading)
            {
                return false;
            }

            if (m_ResState != ResState.Ready)
            {
                return true;
            }

            OnReleaseRes();
            m_ResState = ResState.Waiting;
            m_OnResLoadDoneEvent = null;
            return true;
        }

        public virtual IEnumerator StartIEnumeratorTask(Action finishCallback)
        {
            finishCallback();
            yield break;
        }

        public virtual void OnCacheReset()
        {
            m_AssetName = null;
            m_OnResLoadDoneEvent = null;
        }
    }
}