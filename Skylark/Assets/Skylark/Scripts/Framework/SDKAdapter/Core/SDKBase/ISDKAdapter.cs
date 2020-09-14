using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface ISDKAdapter
    {
        int GetPriorityScore();
        bool InitWithConfig(SDKAdapterConfig adapterConfig);
    }
}