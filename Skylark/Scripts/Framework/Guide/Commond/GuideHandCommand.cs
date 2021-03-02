using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideHandCommand : AbstractGuideCommand
    {
        private IUINodeFinder m_Finder;
        private bool m_NeedClose = true;
        private Vector3 m_Offset;

        public override void SetParam(object[] pv)
        {
            if (pv.Length == 0)
            {
                Log.W("GuideHandCommand Init With Invalid Param.");
                return;
            }

            try
            {
                m_Finder = pv[0] as IUINodeFinder;

                if (pv.Length > 1)
                {
                    m_NeedClose = Utility.UtilityTable.String2Bool((string)pv[1]);
                }

                if (pv.Length > 2)
                {
                    m_Offset = Utility.UtilityTable.String2Vector3((string)pv[2], '|');
                }

            }
            catch (Exception e)
            {
                Log.E(e);
            }
        }

        protected override void OnStart()
        {
            RectTransform targetNode = m_Finder.FindNode(false) as RectTransform;

            if (targetNode == null)
            {
                return;
            }

            UIMgr.S.OpenPanel(UIID.GuideHandPanel, null, targetNode, m_Offset);
        }

        protected override void OnFinish(bool forceClean)
        {
            if (m_NeedClose || forceClean)
            {
                UIMgr.S.ClosePanel(UIID.GuideHandPanel);
            }
        }
    }
}