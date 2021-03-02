using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IGuideStep
    {
        void RegisterTrack();
        bool StartTrack();
        void FinishTrack();
    }
}