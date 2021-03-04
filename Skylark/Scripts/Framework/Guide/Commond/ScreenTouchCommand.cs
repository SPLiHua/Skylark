using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class ScreenTouchCommand : AbstractGuideCommand
    {
        private bool m_ExcuteGameClick = false;

        public override void SetParam(object[] pv)
        {
            if (pv != null && pv.Length > 0)
            {
                int i = int.Parse(pv[0].ToString());
                if (i == 0)
                {
                    m_ExcuteGameClick = false;
                }
                else
                {
                    m_ExcuteGameClick = true;
                }
            }
        }

        protected override void OnStart()
        {
            AppLoopMgr.S.onUpdate += Update;
        }

        protected override void OnFinish(bool forceClean)
        {
            AppLoopMgr.S.onUpdate -= Update;
        }

        private void Update()
        {
            if (m_ExcuteGameClick)
            {
                if (Input.GetMouseButtonDown(0))
                {
                    FinishStep();
                }
            }
            else
            {
                if (Input.GetMouseButtonUp(0))
                {
                    FinishStep();
                }
            }
        }
    }
}
