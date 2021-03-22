using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideHandCommand : AbstractGuideCommand
    {
        private object[] m_Params;

        public override void SetParam(object[] pv)
        {
            if (pv.Length == 0)
            {
                Log.W("GuideHandCommand Init With Invalid Param.");
                return;
            }

            try
            {
                m_Params = pv;
            }
            catch (Exception e)
            {
                Log.E(e);
            }
        }

        protected override void OnStart()
        {
            UIMgr.S.OpenPanelTop(UIID.GuideHandPanel, m_Params);
        }

        protected override void OnFinish(bool forceClean)
        {
            if (forceClean)
            {
                UIMgr.S.ClosePanel(UIID.GuideHandPanel);
            }
        }
    }
}