using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ApplicationMgr : AbstractApplicationMgr<ApplicationMgr>
    {
        protected override void InitThirdLibConfig()
        {
            //DOTween.Init(false, true, LogBehaviour.ErrorsOnly);
            //DOTween.defaultEaseType = Ease.Linear;
            ResMgr.S.Init();
            InitSDK();
        }

        private void InitSDK()
        {
            DataAnalysisMgr.S.Init();
            ADMgr.S.Init();
        }

        protected override void InitAppEnvironment()
        {
            Application.targetFrameRate = 60;
            QualitySettings.vSyncCount = 0;
            Screen.sleepTimeout = SleepTimeout.NeverSleep;
        }

        protected override void StartGame()
        {
            NetworkModule.S.Init();
            GameDataMgr.S.Init();
            GamePlayMgr.S.Init();
        }
    }
}