using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Skylark
{
    public interface IGuideTrigger
    {
        bool isReady { get; }
        void SetParam(object[] param);
        void Start(Action finishAction);
        void Finish();
    }
}