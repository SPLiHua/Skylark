using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class EmptyTrigger : IGuideTrigger
    {
        public bool isReady
        {
            get => true;
        }

        public void SetParam(object[] param)
        {
        }

        public void Start(Action finishAction)
        {
            if (finishAction != null)
            {
                finishAction();
            }
        }

        public void Finish()
        {
        }
    }
}