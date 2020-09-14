using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IAdAdapter : ISDKAdapter
    {
        ADHandler CreateBannerAD();
        ADHandler CreateInterstitialAD();
        ADHandler CreateRewardVideoAD();
        ADHandler CreateNativeAD();
        ADHandler CreateFullScreenAD();
    }

    public enum ADState
    {
        NONE,
        Loading,
        Loaded,
        Showing,
        Click,
        Hide,
        Destory,
        Failed,
        Close,
    }
}