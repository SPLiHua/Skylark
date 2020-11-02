using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Skylark
{
    public class DelayAction : NodeAction
    {
        public float m_DelayTime;
        private Action m_OnDelayFinish;
        private float m_CurrentSeconds = 0.0f;

        public DelayAction()
        {
        }

        public DelayAction(float delayTime)
        {
            m_DelayTime = delayTime;
        }

        public static DelayAction Allocate(float delayTime, Action onDelayFinish = null)
        {
            DelayAction node = ObjectPool<DelayAction>.S.Allocate();
            node.m_DelayTime = delayTime;
            node.m_OnDelayFinish = onDelayFinish;
            return node;
        }

        protected override void OnExecute(float dt)
        {
            m_CurrentSeconds += dt;
            if (m_CurrentSeconds >= m_DelayTime && m_OnDelayFinish != null)
            {
                m_OnDelayFinish.Invoke();
            }
            Finished = m_CurrentSeconds >= m_DelayTime;
        }

        protected override void OnReset()
        {
            m_CurrentSeconds = 0;
            m_OnDelayFinish = null;
        }

        public override void Recycle2Cache()
        {
            ObjectPool<DelayAction>.S.Recycle(this);
        }
    }
}