using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

public class MopubBannerHandler : ADBannerHandler
{
    protected override void DoInitAD()
    {
        base.DoInitAD();
        CreateBanner();
        MoPubManager.OnAdLoadedEvent += OnAdLoadedEvent;
        MoPubManager.OnAdFailedEvent += OnAdFailedEvent;
        MoPubManager.OnAdClickedEvent += OnAdClickedEvent;
        MoPubManager.OnAdCollapsedEvent += OnAdCollapsedEvent;
    }

    #region  //回调方法
    //横幅广告恢复到其初始大小时触发
    private void OnAdCollapsedEvent(string adUnitId)
    {

    }

    private void OnAdClickedEvent(string adUnitId)
    {
        HandleOnAdClick(adUnitId);
    }

    private void OnAdFailedEvent(string adUnitId, string error)
    {
        DoDestoryAD();
        HandleOnADLoadFailed(adUnitId, error);
    }

    private void OnAdLoadedEvent(string adUnitId, float height)
    {
        HandleOnADLoaded(adUnitId, height);
    }
    #endregion

    private void CreateBanner()
    {
        MoPub.LoadBannerPluginsForAdUnits(new string[] { m_ADParams.adUnitId });

        switch (m_ADParams.adPosition)
        {
            case ADPosition.Top:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.TopCenter);
                break;
            case ADPosition.Bottom:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.BottomCenter);
                break;
            case ADPosition.TopLeft:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.TopLeft);
                break;
            case ADPosition.TopRight:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.TopRight);
                break;
            case ADPosition.BottomLeft:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.BottomLeft);
                break;
            case ADPosition.BottomRight:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.BottomRight);
                break;
            case ADPosition.Center:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.Centered);
                break;
            case ADPosition.CustomDefine:
                MoPub.RequestBanner(m_ADParams.adUnitId, MoPub.AdPosition.TopCenter);
                break;
        }
    }

    protected override bool DoShowAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId))
            return false;

        MoPub.ShowBanner(m_ADParams.adUnitId, true);
        m_ADState = ADState.Showing;
        return true;
    }

    protected override bool DoHideAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId) || m_ADState != ADState.Showing)
            return false;

        MoPub.ShowBanner(m_ADParams.adUnitId, false);
        m_ADState = ADState.Hide;
        return true;
    }

    protected override bool DoDestoryAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId))
            return false;
        MoPub.DestroyBanner(m_ADParams.adUnitId);
        m_ADState = ADState.Destory;
        return true;
    }

    protected override bool DoRefreshAD()
    {
        if (m_ADState != ADState.Showing)
            return false;

        m_ADState = ADState.Loading;
        CreateBanner();
        return true;
    }

    public override bool isADReady
    {
        get
        {
            return true;
        }
    }
}
