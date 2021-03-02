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
            // GuideMgr.S.RegisterGuideTrigger(typeof(TaskStartTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(BossMissTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(BossCatchTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(FirstUpgradeTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(HasFishTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(UINodeInvisibleTrigger));
            // GuideMgr.S.RegisterGuideTrigger(typeof(MoneyTrigger));
        }

        protected void InitCustomCommand()
        {
            // GuideMgr.S.RegisterGuideCommand(typeof(CharaWordsCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(FasterBoxCommand));
            // GuideMgr.S.RegisterGuideCommand(typeof(ScreenTouchCommand));
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