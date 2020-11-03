﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Skylark
{
    public class GamePlayMgr : Singleton<GamePlayMgr>
    {
        public void Init()
        {
            AdDisPlayer.ShowAD(ADGroup.Banner0, null, false);

            //判断当前场景
            Scene scene = SceneManager.GetActiveScene();
            if (scene.name == "Editor")
            {
                AppConfig.S.projectMode = ProjectMode.Editor;
            }
            else if (scene.name == "Test")
            {
                AppConfig.S.projectMode = ProjectMode.Test;
            }
            if (scene.name == "Main")
            {
                AppConfig.S.projectMode = ProjectMode.Game;
            }

            if (AppConfig.S.projectMode == ProjectMode.Game)
                UIMgr.S.OpenPanel(UIID.GamingPanel);

            UIMgr.S.ClosePanel(UIID.LoadingPanel);
            StageResFactory.S.Init();
            GameStageMgr.S.Init();
            GameStageMgr.S.CreateStage(PlayerDataHandler.Data.m_CurrentStageIndex);
        }
    }
}