using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

public class MopubAdsAdapter : BaseADAdapter
{
    private MopubAdsConfig m_Config;

    protected override bool AdapterInit(SDKAdapterConfig adapterConfig)
    {
        m_Config = adapterConfig as MopubAdsConfig;
        //mopubSDK初始化
#if UNITY_ANDROID
        string appId = m_Config.androidAppID;
#elif UNITY_IPHONE
        string appId = m_Config.iosAppID;
#else
        string appId = "unexpected_platform";
#endif
        // MoPub.ReportApplicationOpen(appId);

        //绑定日记等级
        MoPub.LogLevel logLevel = MoPub.LogLevel.None;
        if (m_Config.isDebugMode)
            logLevel = MoPub.LogLevel.Debug;

        //绑定初始化回调
        MoPubManager.OnSdkInitializedEvent += OnSdkInitializedEvent;
        MoPub.InitializeSdk(new MoPub.SdkConfiguration
        {
            //设置任意一个有效的广告id
            AdUnitId = m_Config.anyAdUnit,
            LogLevel = logLevel,

            //启动数据收集标记
            //AllowLegitimateInterest = true,

            //初始化广告网络示例
            //Note that keys must be strings, and values must be JSON-serializable (strings only, for MoPubRequestOptions).
            MediatedNetworks = new MoPubBase.MediatedNetwork[]
            {
new MoPub.SupportedNetwork.Facebook{},
new MoPub.SupportedNetwork.Unity{},

                  new MoPub.SupportedNetwork.AdMob
                  {
                    // Network adapter configuration settings (initialization).
                    // NetworkConfiguration = new Dictionary<string,string> {
                    //     { "app_id", "ca-app-pub-9726677720163576~9749987692" },
                    // },
                    // Global mediation settings (per ad request).
                    MediationSettings = new Dictionary<string,object> {
                        { "npa", 1 },
                    },
                    // Additional options to pass to the MoPub servers (per ad request).
                    // MoPubRequestOptions = new Dictionary<string,string> {
                    //     { "key1", "1" },
                    //     { "key2", "1" },
                    // }
                 }
            }
        });


        return true;
    }

    private void OnSdkInitializedEvent(string adUnitId)
    {
        // The SDK is initialized here. Ready to make ad requests.
        Log.I("MopubSDK初始化成功");
        // //参数为你的广告单元Id   临时写法
        // foreach (var item in m_Config.adParamsList)
        // {
        //     switch (item.adType)
        //     {
        //         case ADType.Banner:
        //             MoPub.LoadBannerPluginsForAdUnits(new string[] { item.adUnitId });
        //             break;
        //         case ADType.Interstitial:
        //             MoPub.LoadInterstitialPluginsForAdUnits(new string[] { item.adUnitId });
        //             break;
        //         case ADType.Reward:
        //             MoPub.LoadRewardedVideoPluginsForAdUnits(new string[] { item.adUnitId });
        //             break;
        //         case ADType.FullScreen:
        //             break;
        //         case ADType.Native:
        //             break;
        //     }
        // }
        CreateAll();
    }

    public override ADHandler CreateBannerAD()
    {
        ADHandler handler = new MopubBannerHandler();
        return handler;
    }

    public override ADHandler CreateInterstitialAD()
    {
        ADHandler handler = new MopubInterstitialHandler();
        return handler;
    }

    public override ADHandler CreateNativeAD()
    {
        return null;
    }

    public override ADHandler CreateRewardVideoAD()
    {
        ADHandler handler = new MopubRewardVideoHandler();
        return handler;
    }
}
