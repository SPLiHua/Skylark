using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class NodeAction : IAction, ICacheAble, ICacheType
    {
        public Action OnBeganCallback = null;
        public Action OnEndedCallback = null;
        public Action OnDisposedCallback = null;

        public bool Finished { get; protected set; }
        protected bool m_OnBeganCalled = false;

        protected bool m_Disposed = false;
        public bool Disposed
        {
            get { return m_Disposed; }
        }

        protected bool m_CacheFlag = false;
        public bool cacheFlag { get => m_CacheFlag; set => m_CacheFlag = value; }

        public bool Execute(float delta)
        {
            // 有可能被别的地方调用
            if (Finished)
            {
                return Finished;
            }

            if (!m_OnBeganCalled)
            {
                m_OnBeganCalled = false;
                OnBegin();

                if (OnBeganCallback != null)
                {
                    OnBeganCallback.Invoke();
                }
            }

            if (!Finished)
            {
                OnExecute(delta);
            }

            if (Finished)
            {
                Finish();
            }

            return Finished || m_Disposed;
        }

        public virtual void Finish()
        {
            Debug.Log("Finish");
            Finished = true;
            if (OnEndedCallback != null)
            {
                OnEndedCallback.Invoke();
            }
            OnEnd();
        }

        public void Reset()
        {
            Finished = false;
            m_OnBeganCalled = false;
            m_Disposed = false;
            OnReset();
        }

        public void Dispose()
        {
            if (m_Disposed) return;
            m_Disposed = true;

            OnBeganCallback = null;
            OnEndedCallback = null;
            if (OnDisposedCallback != null)
            {
                OnDisposedCallback.Invoke();
            }

            OnDisposedCallback = null;
            Recycle2Cache();
            OnDispose();
        }

        #region //override
        protected virtual void OnBegin()
        {
        }

        protected virtual void OnExecute(float dt)
        {
        }

        protected virtual void OnEnd()
        {
        }

        protected virtual void OnReset()
        {
        }

        protected virtual void OnDispose()
        {
        }
        #endregion

        public virtual void OnCacheReset()
        {

        }

        public virtual void Recycle2Cache()
        {
        }
    }
}