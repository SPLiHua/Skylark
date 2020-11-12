using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public delegate void OnEvent(int key, params object[] param);

    public class EventSystem : Singleton<EventSystem>, ICacheAble
    {
        private class ListenerWrap
        {
            private LinkedList<OnEvent> m_EventList;
            public bool Fire(int key, params object[] param)
            {
                if (m_EventList == null)
                    return false;

                var next = m_EventList.First;
                OnEvent call = null;
                LinkedListNode<OnEvent> nextCache = null;
                while (next != null)
                {
                    call = next.Value;
                    nextCache = next.Next;
                    call(key, param);
                    next = next.Next ?? nextCache;
                }
                return true;
            }

            public bool Add(OnEvent listener)
            {
                if (m_EventList == null)
                    m_EventList = new LinkedList<OnEvent>();

                if (m_EventList.Contains(listener))
                    return false;

                m_EventList.AddLast(listener);
                return true;
            }

            public void Remove(OnEvent listener)
            {
                if (m_EventList == null)
                    return;

                m_EventList.Remove(listener);
            }

            public void RemoveAll()
            {
                if (m_EventList == null)
                    return;

                m_EventList.Clear();
            }
        }

        private readonly Dictionary<int, ListenerWrap> m_ListenerWrapDict = new Dictionary<int, ListenerWrap>();

        private bool m_CacheFlag = false;

        public bool cacheFlag
        {
            get
            {
                return m_CacheFlag;
            }

            set
            {
                m_CacheFlag = value;
            }
        }

        public bool Register<T>(T key, OnEvent fun) where T : IConvertible
        {
            var k = key.ToInt32(null);
            ListenerWrap wrap;
            if (!m_ListenerWrapDict.TryGetValue(k, out wrap))
            {
                wrap = new ListenerWrap();
                m_ListenerWrapDict.Add(k, wrap);
            }

            if (wrap.Add(fun))
                return true;

            return false;
        }

        public void UnRegister<T>(T key, OnEvent fun) where T : IConvertible
        {
            ListenerWrap wrap;
            if (m_ListenerWrapDict.TryGetValue(key.ToInt32(null), out wrap))
            {
                wrap.Remove(fun);
            }
        }

        public void UnRegister<T>(T key) where T : IConvertible
        {
            ListenerWrap wrap;
            if (m_ListenerWrapDict.TryGetValue(key.ToInt32(null), out wrap))
            {
                wrap.RemoveAll();
                wrap = null;
                m_ListenerWrapDict.Remove(key.ToInt32(null));
            }
        }

        public bool Send<T>(T key, params object[] param) where T : IConvertible
        {
            int k = key.ToInt32(null);
            ListenerWrap wrap = null;
            if (m_ListenerWrapDict.TryGetValue(k, out wrap))
            {
                return wrap.Fire(k, param);
            }
            return false;
        }

        public void OnCacheReset()
        {
            m_ListenerWrapDict.Clear();
        }

        private static readonly EventSystem m_GlobalEventSystem = new EventSystem();

        #region 高频率使用的API
        public static bool SendEvent<T>(T key, params object[] param) where T : IConvertible
        {
            return m_GlobalEventSystem.Send(key, param);
        }

        public static bool RegisterEvent<T>(T key, OnEvent fun) where T : IConvertible
        {
            return m_GlobalEventSystem.Register(key, fun);
        }

        public static void UnRegisterEvent<T>(T key, OnEvent fun) where T : IConvertible
        {
            m_GlobalEventSystem.UnRegister(key, fun);
        }
        #endregion
    }
}