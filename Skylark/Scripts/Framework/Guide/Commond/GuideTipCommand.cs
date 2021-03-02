
using System;

namespace Skylark
{
    public class GuideTipCommand : AbstractGuideCommand
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
            Log.I("执行");
            UIMgr.S.OpenPanel(UIID.GuideTipPanel, null, m_Params);
        }

        protected override void OnFinish(bool forceClean)
        {
            if (forceClean)
            {
                UIMgr.S.ClosePanel(UIID.GuideTipPanel);
            }
        }
    }
}
