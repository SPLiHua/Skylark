﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class InputModule : AbstractModule
    {
        internal override int Priority
        {
            get
            {
                return 11;
            }
        }

        private IInputer m_KeyboardInputer;


        internal override void OnInit()
        {
            m_KeyboardInputer = new KeyboardInputer();
            m_KeyboardInputer.RegisterKeyCodeMonitor(KeyCode.F1, null, OnClickF1, null);
            m_KeyboardInputer.RegisterKeyCodeMonitor(KeyCode.F2, null, OnClickF2, null);
            m_KeyboardInputer.RegisterKeyCodeMonitor(KeyCode.F3, null, OnClickF3, null);
        }

        private void OnClickF1()
        {
            GameHelper.S.LoadData();
        }

        private void OnClickF2()
        {
            EventSystem.S.Send<GEID>(GEID.PlayerRoleTwinkle);
        }

        private void OnClickF3()
        {
            EventSystem.S.Send<GEID>(GEID.Speed2Power, 2);
        }

        internal override void Shutdown()
        {
            m_KeyboardInputer = null;
        }

        internal override void Update(float elapseSeconds, float realElapseSeconds)
        {
            m_KeyboardInputer.LateUpdate();
        }
    }
}