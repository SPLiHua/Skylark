using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public enum EngineEventID
    {
        EngineEventIDMin = 1000000,
        OnApplicationFocusChange,
        OnApplicationPauseChange,
        OnAfterApplicationPauseChange,
        OnAfterApplicationFocusChange,

        OnApplicationQuit,
    }
}