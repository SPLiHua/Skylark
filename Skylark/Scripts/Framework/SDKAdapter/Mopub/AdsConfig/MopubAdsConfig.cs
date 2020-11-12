using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

[System.Serializable]
public class MopubAdsConfig : SDKADAdapterConfig
{
    public override string adapterClassName
    {
        get
        {
            return "MopubAdsAdapter";
        }
    }

    public float bannerRefreshDuration = 30;
    public string anyAdUnit;
    public string androidAppID;
    public string iosAppID;
}
