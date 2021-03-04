using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class DelayTrigger : IGuideTrigger
    {
        private bool m_IsReady = false;
        private float m_DuringTime;
        private Action m_Listener;

        public bool isReady
        {
            get
            {
                return m_IsReady;
            }
        }

        public void SetParam(object[] param)
        {
            m_DuringTime = float.Parse(param[0].ToString());
        }

        public void Start(Action l)
        {
            m_Listener = l;

            Timer.S.Post2Really((i) =>
            {
                Finish();
            }, m_DuringTime, 1);
        }

        public void Finish()
        {
            m_IsReady = true;
            if (m_Listener == null)
            {
                return;
            }

            m_Listener();
        }
    }
}