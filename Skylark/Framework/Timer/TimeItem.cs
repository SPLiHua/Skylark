using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public partial class Timer
    {
        public class TimeItem : IBinaryHeapElement, ICacheAble, ICacheType
        {
            private static int s_NextID;
            private static Dictionary<int, TimeItem> s_TimeItemMap = new Dictionary<int, TimeItem>();
            private bool m_IsEnable = true;
            private float m_DelayTime;
            private int m_RepeatCount;
            private Action<int> m_Callback;
            //已执行次数
            private int m_CallbackTick;
            private int m_ID = -1;
            private bool m_IsCache;

            //IBinaryHeapElement数据
            private float m_SortScore;
            private int m_HeapIndex;

            #region //数据结构
            public int id
            {
                get { return m_ID; }
                private set { m_ID = value; }
            }

            public float DelayTime()
            {
                return m_DelayTime;
            }

            public Action<int> callback
            {
                get { return m_Callback; }
            }

            public float sortScore
            {
                get { return m_SortScore; }
                set { m_SortScore = value; }
            }

            public int heapIndex
            {
                get { return m_HeapIndex; }
                set { m_HeapIndex = value; }
            }

            public bool isEnable
            {
                get
                {
                    if (m_RepeatCount == 0)
                    {
                        m_IsEnable = false;
                    }
                    return m_IsEnable;
                }
            }

            public bool cacheFlag
            {
                get
                {
                    return m_IsCache;
                }

                set
                {
                    m_IsCache = value;
                }
            }
            #endregion

            public static TimeItem Allocate(Action<int> callback, float delayTime, int repeatCount = 1)
            {
                TimeItem item = ObjectPool<TimeItem>.S.Allocate();
                item.Set(callback, delayTime, repeatCount);
                return item;
            }

            public void Set(Action<int> callback, float delayTime, int repeatCount)
            {
                m_CallbackTick = 0;
                m_Callback = callback;
                m_DelayTime = delayTime;
                m_RepeatCount = repeatCount;
                RegisterActiveTimeItem(this);
            }

            public void OnTimeTick()
            {
                if (m_Callback != null)
                {
                    m_Callback(++m_CallbackTick);
                }

                if (m_RepeatCount > 0)
                {
                    --m_RepeatCount;
                }
            }

            public void Cancel()
            {
                if (m_IsEnable)
                {
                    m_IsEnable = false;
                    m_Callback = null;
                }
            }

            public void RebuildHeap<T>(BinaryHeap<T> heap) where T : IBinaryHeapElement
            {
                heap.RebuildAtIndex(m_HeapIndex);
            }

            public void OnCacheReset()
            {
                m_CallbackTick = 0;
                m_Callback = null;
                m_IsEnable = true;
                m_HeapIndex = 0;
                UnRegisterActiveTimeItem(this);
                m_ID = -1;
            }

            public void Recycle2Cache()
            {
                ObjectPool<TimeItem>.S.Recycle(this);
            }

            public static TimeItem GetTimeItemByID(int id)
            {
                TimeItem unit;
                if (s_TimeItemMap.TryGetValue(id, out unit))
                {
                    return unit;
                }
                return null;
            }

            private static void RegisterActiveTimeItem(TimeItem unit)
            {
                unit.id = ++s_NextID;
                s_TimeItemMap.Add(unit.id, unit);
            }

            private static void UnRegisterActiveTimeItem(TimeItem unit)
            {
                if (s_TimeItemMap.ContainsKey(unit.id))
                {
                    s_TimeItemMap.Remove(unit.id);
                }
                unit.id = -1;
            }
        }
    }
}