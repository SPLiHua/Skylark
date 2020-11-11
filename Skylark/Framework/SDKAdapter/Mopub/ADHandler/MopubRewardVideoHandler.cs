using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

public class MopubRewardVideoHandler : ADRewardHandler
{
    //服务器端设定的奖励参数
    List<MoPub.Reward> rewardList;

    protected override void DoInitAD()
    {
        base.DoInitAD();
        MoPub.LoadRewardedVideoPluginsForAdUnits(new string[] { m_ADParams.adUnitId });
        DoPreLoadAD();
        MoPubManager.OnRewardedVideoLoadedEvent += OnAdLoadedEvent;
        MoPubManager.OnRewardedVideoFailedEvent += OnVideoFailedEvent;
        MoPubManager.OnRewardedVideoShownEvent += OnVideoShownEvent;
        MoPubManager.OnRewardedVideoExpiredEvent += OnAdExpiredEvent;
        MoPubManager.OnRewardedVideoReceivedRewardEvent += OnVideoReceivedRewardEvent;
        MoPubManager.OnRewardedVideoClickedEvent += OnAdClickedEvent;
        MoPubManager.OnRewardedVideoClosedEvent += OnAdClosedEvent;
        MoPubManager.OnRewardedVideoLeavingApplicationEvent += OnAdVideoLeavingApplicationEvent;
        MoPubManager.OnRewardedVideoFailedToPlayEvent += OnRewardedVideoFailedToPlayEvent;
    }

    #region  //回调方法
    private void OnRewardedVideoFailedToPlayEvent(string adUnitId, string errorMsg)
    {
        Log.I("RewardRewardFailedToPlay:" + errorMsg);
    }

    //仅ios，当奖励视频时间导致另一个应用程序打开时触发
    private void OnAdVideoLeavingApplicationEvent(string obj)
    {
        Log.I("OnRewardAdVideoLeavingApplicationEvent");
    }

    private void OnAdClosedEvent(string adUnitId)
    {
        HandleOnAdClosed(adUnitId);
        DoPreLoadAD();
    }

    //奖励视频播放完后触发。包括有关奖励的所有可用数据。    奖励名称    奖励金额
    private void OnVideoReceivedRewardEvent(string adUnitId, string label, float amount)
    {
        //todo
        HandleOnADReward(adUnitId, label, amount);
    }

    //显示奖励视频时触发
    private void OnVideoShownEvent(string adUnitId)
    {
        //选择奖励类型
        if (rewardList != null && rewardList.Count > 0)
            MoPub.SelectReward(m_ADParams.adUnitId, rewardList[0]);
        HandleOnAdShown(adUnitId);
    }

    //插屏广告到期时触发
    private void OnAdExpiredEvent(string adUnitId)
    {
        Log.I("OnRewardAdExpiredEvent");
    }

    private void OnAdClickedEvent(string adUnitId)
    {
        HandleOnAdClick(adUnitId);
    }

    private void OnVideoFailedEvent(string adUnitId, string error)
    {
        HandleOnADLoadFailed(adUnitId, error);
    }

    private void OnAdLoadedEvent(string adUnitId)
    {
        //检索服务器端设定的奖励   暂时不启用该功能
        //rewardList = MoPub.GetAvailableRewards(m_ADParams.adUnitId);
        HandleOnADLoaded(adUnitId, 0);
    }
    #endregion

    protected override bool DoShowAD()
    {
        if (string.IsNullOrEmpty(m_ADParams.adUnitId))
            return false;

        if (m_ADParams.ExtraParams != null && m_ADParams.ExtraParams.Length > 0)
        {
            string str = m_ADParams.ExtraParams[0] as string;
            MoPub.ShowRewardedVideo(m_ADParams.adUnitId, str);
        }
        //参数：string adUnitId,string customData
        MoPub.ShowRewardedVideo(m_ADParams.adUnitId);
        m_ADState = ADState.Showing;
        return true;
    }

    private void DoPreLoadAD()
    {
        //https://developers.mopub.com/publishers/reference/unity/RewardedVideos/
        //有可选参数
        MoPub.RequestRewardedVideo(m_ADParams.adUnitId);
    }

    public override bool isADReady
    {
        get
        {
            if (MoPub.HasRewardedVideo(m_ADParams.adUnitId))
                return true;
            else
                return false;
        }
    }
}
