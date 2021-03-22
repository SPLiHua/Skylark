using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideModule : AbstractModule
    {
        internal override void OnInit()
        {
            InitCustomTrigger();
            InitCustomCommand();
        }

        protected void InitCustomTrigger()
        {
            GuideMgr.S.RegisterGuideTrigger(typeof(CanDropTrigger));
            GuideMgr.S.RegisterGuideTrigger(typeof(CheckPropTrigger));
            GuideMgr.S.RegisterGuideTrigger(typeof(ChestTrigger));
            GuideMgr.S.RegisterGuideTrigger(typeof(ChestOpenTrigger));
        }

        protected void InitCustomCommand()
        {
            GuideMgr.S.RegisterGuideCommand(typeof(FirePauseCommand));
            GuideMgr.S.RegisterGuideCommand(typeof(AwardCoinCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(ScrollMoveCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(HighlightCircleCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(SpineHandCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(UIClipCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(MergeCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(StageCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(MyButtonHackCommand));

        }

        internal override void Update(float elapseSeconds, float realElapseSeconds)
        {
        }

        internal override void Shutdown()
        {
        }
    }
}