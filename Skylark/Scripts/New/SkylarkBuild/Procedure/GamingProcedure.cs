using ProcedureOwner = Skylark.IFsm<Skylark.IProcedureManager>;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Skylark
{
    public class GamingProcedure : ProcedureBase
    {
        protected internal override void OnInit(ProcedureOwner procedureOwner)
        {
            base.OnInit(procedureOwner);
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

        protected internal override void OnEnter(ProcedureOwner procedureOwner)
        {
            base.OnEnter(procedureOwner);
        }

        protected internal override void OnUpdate(ProcedureOwner procedureOwner, float elapseSeconds, float realElapseSeconds)
        {
            base.OnUpdate(procedureOwner, elapseSeconds, realElapseSeconds);
        }

        protected internal override void OnLeave(ProcedureOwner procedureOwner, bool isShutdown)
        {
            base.OnLeave(procedureOwner, isShutdown);
        }

        protected internal override void OnDestroy(ProcedureOwner procedureOwner)
        {
            base.OnDestroy(procedureOwner);
        }
    }
}

