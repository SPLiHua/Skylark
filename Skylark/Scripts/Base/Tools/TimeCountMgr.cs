using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace Skylark
{
    public class TimeCountMgr : MonoSingleton<TimeCountMgr>
    {
        class TimeWrap
        {
            public int m_Key;

            private LinkedList<UnityAction> m_ActionList;
            private float m_SpanTime;
            private float m_CurrentTime;

            public TimeWrap(int key, float spanTime)
            {
                m_Key = key;
                m_ActionList = new LinkedList<UnityAction>();
                m_SpanTime = spanTime;
            }

            public void Update(float deltaTime)
            {
                m_CurrentTime += deltaTime;
                if (m_CurrentTime >= m_SpanTime)
                {
                    Fire();
                    m_CurrentTime = 0;
                }
            }

            public void Fire()
            {
                var next = m_ActionList.First;
                UnityAction call = null;
                LinkedListNode<UnityAction> nextCache = null;
                while (next != null)
                {
                    call = next.Value;
                    nextCache = next.Next;
                    call();
                    next = next.Next ?? nextCache;
                }
            }

            public bool Add(UnityAction listener)
            {
                if (m_ActionList.Contains(listener))
                    return false;

                m_ActionList.AddLast(listener);
                return true;
            }

            public void Remove(UnityAction listener)
            {
                m_ActionList.Remove(listener);
            }

            public void RemoveAll()
            {
                m_ActionList.Clear();
            }
        }

        private LinkedList<TimeWrap> m_TimeWrapList;

        public override void OnSingletonInit()
        {
            m_TimeWrapList = new LinkedList<TimeWrap>();
        }

        public bool Register<T>(T key, UnityAction fun, float spanTime = 1) where T : IConvertible
        {
            var k = key.ToInt32(null);
            TimeWrap wrap = QueryWrap(k);
            if (wrap == null)
            {
                wrap = new TimeWrap(k, spanTime);
                m_TimeWrapList.AddLast(wrap);
            }

            if (wrap.Add(fun))
                return true;

            return false;
        }


        public void UnRegister<T>(T key, UnityAction fun) where T : IConvertible
        {
            var k = key.ToInt32(null);
            TimeWrap wrap = QueryWrap(k);
            if (wrap != null)
            {
                wrap.Remove(fun);
            }
        }

        public void Cancel<T>(T key) where T : IConvertible
        {
            var k = key.ToInt32(null);
            TimeWrap wrap = QueryWrap(k);
            if (wrap != null)
            {
                wrap.RemoveAll();
                m_TimeWrapList.Remove(wrap);
            }
        }

        private TimeWrap QueryWrap(int key)
        {
            var next = m_TimeWrapList.First;
            LinkedListNode<TimeWrap> nextCache = null;
            while (next != null)
            {
                if (next.Value.m_Key == key)
                {
                    return next.Value;
                }
                else
                {
                    nextCache = next.Next;
                    next = nextCache;
                }
            }

            return null;
        }

        LinkedListNode<TimeWrap> next = null;
        LinkedListNode<TimeWrap> nextCache = null;

        private void Update()
        {
            next = m_TimeWrapList.First;
            while (next != null)
            {
                next.Value.Update(Time.deltaTime);
                nextCache = next.Next;
                next = nextCache;
            }
        }
    }
}