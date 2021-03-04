using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class PauseCommand : AbstractGuideCommand
    {
        public override void SetParam(object[] pv)
        {
        }

        protected override void OnStart()
        {
            Time.timeScale = 0;
        }

        protected override void OnFinish(bool forceClean)
        {
            Time.timeScale = 1;
        }
    }
}