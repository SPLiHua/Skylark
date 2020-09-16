using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace Skylark
{
    public class DataDirtyRecorder
    {
        private bool m_BDirty;
        public void SetDirty(bool dirty)
        {
            m_BDirty = dirty;
        }
        public bool GetDirty()
        {
            return m_BDirty;
        }
    }

    public class DataDirtyHandler
    {
        protected DataDirtyRecorder m_Recorder;

        public void SetRecorder(DataDirtyRecorder recorder)
        {
            m_Recorder = recorder;
        }

        public void SetDirty()
        {
            if (m_Recorder == null)
            {
                return;
            }
            m_Recorder.SetDirty(true);
        }

        public bool GetDirty()
        {
            if (m_Recorder == null)
            {
                return false;
            }
            return m_Recorder.GetDirty();
        }

        public void ResetDataDirty()
        {
            if (m_Recorder == null)
            {
                return;
            }
            m_Recorder.SetDirty(false);
        }
    }
}