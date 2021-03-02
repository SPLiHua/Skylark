using System;

namespace Skylark
{
    public class EventTrigger : IGuideTrigger
    {
        private bool m_IsReady = false;
        private GEID m_EventID;
        private Action m_Listener;

        public void SetParam(object[] param)
        {
            try
            {
                string str = param[0].ToString();
                m_EventID = (GEID)Enum.Parse(typeof(GEID), str);
            }
            catch (Exception e)
            {
                Log.E(e);
            }

        }

        public void Start(Action l)
        {
            m_Listener = l;
            EventSystem.S.Register<GEID>(m_EventID, OnEventListener);
        }

        public void Finish()
        {
            m_Listener = null;
            EventSystem.S.UnRegister<GEID>(m_EventID, OnEventListener);
        }

        public bool isReady
        {
            get
            {
                return m_IsReady;
            }
        }

        private void OnEventListener(int key, params object[] args)
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