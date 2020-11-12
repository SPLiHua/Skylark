using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{

    //主动提供缓存管理的类型
    public interface ICacheType
    {
        void Recycle2Cache();
    }

    public interface ICacheAble
    {
        //缓存前处理，例如可处理脏数据
        void OnCacheReset();
        //是否已缓存表示
        bool cacheFlag
        {
            get;
            set;
        }
    }

    public class ObjectPool<T> : Singleton<ObjectPool<T>> where T : ICacheAble, new()
    {
        private int m_MaxCount = 0;
        private Stack<T> m_CacheStack;

        public void Init(int maxCount, int initCount)
        {
            if (maxCount > 0)
                initCount = Mathf.Min(maxCount, initCount);
            m_MaxCount = maxCount;
            if (CurrentCount < initCount)
            {
                for (int i = 0; i < m_CacheStack.Count; i++)
                {
                    Recycle(new T());
                }
            }
        }

        public int CurrentCount
        {
            get
            {
                if (m_CacheStack == null)
                {
                    m_CacheStack = new Stack<T>();
                    return 0;
                }
                return m_CacheStack.Count;
            }
        }

        public int maxCacheCount
        {
            get { return m_MaxCount; }
            set
            {
                m_MaxCount = value;
                if (m_CacheStack != null)
                {
                    if (m_MaxCount < m_CacheStack.Count)
                    {
                        for (int i = m_MaxCount; i < m_CacheStack.Count; i++)
                        {
                            T t = m_CacheStack.Pop();
                            //是否需要对数据进行还原
                        }
                    }
                }
            }
        }

        public T Allocate()
        {
            T result = default(T);
            if (m_CacheStack == null)
            {
                m_CacheStack = new Stack<T>();
            }
            if (m_CacheStack.Count == 0)
            {
                result = new T();
            }
            else
            {
                result = m_CacheStack.Pop();
            }
            result.cacheFlag = false;
            return result;
        }

        public bool Recycle(T t)
        {
            if (t == null || t.cacheFlag)
                return false;
            if (m_CacheStack == null)
                m_CacheStack = new Stack<T>();
            else if (m_MaxCount > 0)
            {
                if (m_CacheStack.Count >= m_MaxCount)
                {
                    t.cacheFlag = true;
                    t.OnCacheReset();
                    return false;
                }
            }
            t.cacheFlag = true;
            t.OnCacheReset();
            m_CacheStack.Push(t);
            return true;
        }
    }
}