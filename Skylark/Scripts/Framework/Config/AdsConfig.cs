using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    [System.Serializable]
    public class AdsConfig
    {
        public bool isEnable = true;
        public MopubAdsConfig mopubAdsConfig;
    }
}