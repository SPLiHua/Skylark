using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class Guide : IGuideStep
    {
        private int m_GuideID;
        private List<GuideStep> m_GuideStepList;
        private bool m_IsTracking = false;
        private int m_LastFinishStepID = 0;
        private int m_CurrentGuideIndex = 0;

        public int guideID
        {
            get { return m_GuideID; }
        }

        public Guide(int guideID)
        {
            m_GuideID = guideID;
        }

        public void RegisterTrack()
        {
            m_LastFinishStepID = GuideMgr.S.GetGuideLastStep(m_GuideID);
            RegisterStep();
        }

        public bool StartTrack()
        {
            if (m_IsTracking)
            {
                return true;
            }

            if (m_GuideStepList.Count == 0)
            {
                return false;
            }

            m_GuideStepList[m_CurrentGuideIndex].StartTrack();
            m_IsTracking = true;
            Log.I("#Guide Start:" + m_GuideID);

            return true;
        }

        public void FinishTrack()
        {
            if (!m_IsTracking)
            {
                return;
            }

            m_IsTracking = false;

            if (m_GuideStepList.Count > 0)
            {
                for (int i = 0; i < m_GuideStepList.Count; ++i)
                {
                    m_GuideStepList[i].FinishTrack();
                }

                m_GuideStepList = null;
            }
        }

        private void RegisterStep()
        {
            m_GuideStepList = new List<GuideStep>();

            var dataList = TDGuideStepTable.GetDataAsGuideID(m_GuideID);
            for (int i = 0; i < dataList.Count; ++i)
            {
                if (dataList[i].id <= m_LastFinishStepID)
                {
                    continue;
                }
                GuideStep step = new GuideStep(dataList[i].id);
                step.guide = this;
                step.RegisterTrack();
                m_GuideStepList.Add(step);
            }
        }

        public void OnStepFinish(GuideStep step, bool forceFinishAllSteps = false)
        {
            if (step.stepID > m_LastFinishStepID)
            {
                m_LastFinishStepID = step.stepID;
                GuideMgr.S.FinishStep(step);
            }

            TDGuideStep lastStep = TDGuideStepTable.GetGuideLastStep(m_GuideID);

            if (lastStep == null || lastStep.id == m_LastFinishStepID || forceFinishAllSteps)
            {
                GuideMgr.S.FinishGuide();
                Log.I("#Guide Finish:" + m_GuideID);
            }
            else
            {
                m_GuideStepList[m_CurrentGuideIndex].FinishTrack();
                m_CurrentGuideIndex++;
                m_GuideStepList[m_CurrentGuideIndex].StartTrack();
            }
        }
    }
}