using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

public class MopubInterstitialHandler : ADInterstitialHandler
{
    protected override void DoInitAD()
    {
        base.DoInitAD();
        MoPub.LoadInterstitialPluginsForAdUnits(new string[] { m_ADParams.adUnitId });
        CreateInterstitial();

        MoPubManager.OnInterstitialLoadedEvent += OnAdLoadedEvent;
        MoPubManager.OnInterstitialFailedEvent += OnAdFailedEvent;
        MoPubManager.OnInterstitialDismissedEvent += OnAdDismissedEvent;
        MoPubManager.OnInterstitialShownEvent += OnShownEvent;
        MoPubManager.OnInterstitialClickedEvent += OnAdClickedEvent;
        MoPubManager.OnInterstitialExpiredEvent += OnAdExpiredEvent;
    }

    #region  //回调方法
    //显示时触发
    private void OnShownEvent(string adUnitId)
    {
        HandleOnAdShown(adUnitId);
    }

    //插屏广告到期时触发
    private void OnAdExpiredEvent(string adUnitId)
    {
        Log.I("InterstitialOnAdExpired:" + adUnitId);
    }

    //插屏广告关闭时触发
    private void OnAdDismissedEvent(string adUnitId)
    {
        HandleOnAdClosed(adUnitId);
        CreateInterstitial();
    }

    private void OnAdClickedEvent(string adUnitId)
    {
        HandleOnAdClick(adUnitId);
    }

    //加载失败时触发
    private void OnAdFailedEvent(string adUnitId, string error)
    {
        HandleOnADLoadFailed(adUnitId, error);
    }

    //准备好时触发
    private void OnAdLoadedEvent(string adUnitId)
    {
        HandleOnADLoaded(adUnitId, 0);
    }
    #endregion

    protected override bool DoShowAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId))
            return false;
        MoPub.ShowInterstitialAd(m_ADParams.adUnitId);
        m_ADState = ADState.Showing;
        return true;
    }

    protected override bool DoHideAD()
    {
        //todo 不清楚该类广告支不支持隐藏
        return true;
    }

    protected override bool DoDestoryAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId))
            return false;
        MoPub.DestroyInterstitialAd(m_ADParams.adUnitId);
        m_ADState = ADState.Destory;
        return true;
    }

    private void CreateInterstitial()
    {
        // Requests an interstitial ad with the given (optional) keywords to be loaded.
        //  The two possible resulting events are MoPubManager.OnInterstitialLoadedEvent and MoPubManager.OnInterstitialFailedEvent.
        //   If a user is in a GDPR region and MoPub doesn’t obtain consent from the user, keywords will be sent to the server,
        //    but userDataKeywords will be excluded. Refer to CanCollectPersonalInfo.

        MoPub.RequestInterstitialAd(m_ADParams.adUnitId);
    }

    public override bool isADReady
    {
        get
        {
            if (MoPub.IsInterstitialReady(m_ADParams.adUnitId))
                return true;
            else
                return false;
        }
    }
}
