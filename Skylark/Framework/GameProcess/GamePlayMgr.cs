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
            UIMgr.S.OpenPanel(UIID.GamingPanel);
            AppConfig.S.projectMode = ProjectMode.Game;
            StageResFactory.S.Init();
            GameStageMgr.S.Init();
            GameStageMgr.S.CreateStage(PlayerDataHandler.Data.m_CurrentStageIndex);
        }
    }
}