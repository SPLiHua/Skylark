﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GamePlayMgr : Singleton<GamePlayMgr>
    {
        public void Init()
        {
            //test
            TestModule testModule = new TestModule();
            testModule.TestTimer();
        }
    }
}