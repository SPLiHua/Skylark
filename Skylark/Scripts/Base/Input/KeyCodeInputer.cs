using UnityEngine;
using System.Collections.Generic;
using System;

namespace Skylark
{
    public class KeyboardInputer : IInputer
    {
        #region //按键监控单元类
        private class KeyCodeMonitor
        {
            private Action m_BeginAction;
            private Action m_EndAction;
            private Action m_ProcessingAction;
            private bool m_IsPressing;
            private KeyCode m_KeyCode;

            public KeyCodeMonitor(KeyCode keyCode, Action begin, Action end, Action precessing)
            {
                m_KeyCode = keyCode;
                m_BeginAction = begin;
                m_EndAction = end;
                m_ProcessingAction = precessing;
            }

            public void LateUpdate()
            {
                if (Input.GetKey(m_KeyCode))
                {
                    if (m_IsPressing)
                    {
                        if (m_ProcessingAction != null)
                        {
                            m_ProcessingAction();
                        }
                    }
                    else
                    {
                        m_IsPressing = true;
                        if (m_BeginAction != null)
                        {
                            m_BeginAction();
                        }
                    }
                }
                else
                {
                    if (m_IsPressing)
                    {
                        m_IsPressing = false;
                        if (m_EndAction != null)
                        {
                            m_EndAction();
                        }
                    }
                }
            }

        }
        #endregion

        private List<KeyCodeMonitor> m_MonitorList;
        private bool m_IsEnable = true;
        public bool isEnabled
        {
            get => m_IsEnable;
            set => m_IsEnable = value;
        }

        public void RegisterKeyCodeMonitor(KeyCode keyCode, Action begin, Action end, Action pressing)
        {
            KeyCodeMonitor monitor = new KeyCodeMonitor(keyCode, begin, end, pressing);
            if (m_MonitorList == null)
            {
                m_MonitorList = new List<KeyCodeMonitor>();
            }
            m_MonitorList.Add(monitor);
        }

        public void Release()
        {
            m_MonitorList = null;
        }

        public void LateUpdate()
        {
            if (!m_IsEnable)
            {
                return;
            }

            if (m_MonitorList == null || m_MonitorList.Count == 0)
            {
                return;
            }

            for (int i = m_MonitorList.Count - 1; i >= 0; --i)
            {
                m_MonitorList[i].LateUpdate();
            }
        }
    }
}