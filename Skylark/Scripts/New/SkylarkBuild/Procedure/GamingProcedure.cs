using ParFsm = Skylark.IFsm<Skylark.IProcedureManager>;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Skylark
{
    public class GamingProcedure : ProcedureBase
    {
        protected internal override void OnInit(ParFsm parFsm)
        {
            base.OnInit(parFsm);
        }

        private void GameBaseConfig()
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
            if (scene.name == "Game")
            {
                AppConfig.S.projectMode = ProjectMode.Game;
            }

            if (AppConfig.S.projectMode == ProjectMode.Game)
                UIMgr.S.OpenPanel(UIID.GamingPanel);

            UIMgr.S.ClosePanel(UIID.LoadingPanel);
        }

        protected internal override void OnEnter(params object[] param)
        {
            base.OnEnter(param);
            //GameBaseConfig();
            Log.I("Init[{0}]", GamePlayMgr.S.GetType().Name);
            UIMgr.S.OpenPanel(UIID.HomePanel);
            UIMgr.S.OpenPanel(UIID.MainPanel);
        }

        protected internal override void OnUpdate(float elapseSeconds, float realElapseSeconds)
        {
            base.OnUpdate(elapseSeconds, realElapseSeconds);
        }

        protected internal override void OnLeave(bool isShutdown)
        {
            base.OnLeave(isShutdown);
        }

        protected internal override void OnDestroy()
        {
            base.OnDestroy();
        }
    }
}

