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
            I18NMgr.S.Init();
            ResMgr.S.Init();
            UIDataModule.S.Init();
            UIMgr.S.OpenPanel(UIID.LoadingPanel);
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
            Screen.orientation = ScreenOrientation.Portrait;
            AppConfig.S.Init();
        }

        protected override void StartGame()
        {
            GameDataMgr.S.Init();
            Log.I("Init[{0}]", AudioMgr.S.GetType().Name);
            //需轮询module
            Log.I("Init[{0}]", ModuleMgr.S.GetType().Name);
            onApplicationUpdate += () => { ModuleMgr.S.Update(Time.deltaTime, Time.unscaledDeltaTime); };
            //不需轮询module
            SequenceNode sequenceNode = new SequenceNode();
            sequenceNode.Append(EventAction.Allocate(() => { NetworkModule.S.Init(); }));
            sequenceNode.Append(TableAction.Allocate());
            sequenceNode.OnEndedCallback += TryStartGame;
            this.ExecuteNode(sequenceNode);
        }

        private void TryStartGame()
        {
            GamePlayMgr.S.Init();
        }
    }
}