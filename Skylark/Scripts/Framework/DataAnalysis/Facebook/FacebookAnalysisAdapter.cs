using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Facebook.Unity;
using System;
using Skylark;

public class FacebookAnalysisAdapter : DataAnalysisAdapter
{
    protected override bool AdapterInit(SDKAdapterConfig adapterConfig)
    {
        m_AdapterConfig = adapterConfig as FacebookConfig;
        if (!FB.IsInitialized)
        {
            // Initialize the Facebook SDK
            FB.Init(InitCallback, OnHideUnity);
        }
        else
        {
            // Already initialized, signal an app activation App Event
            FB.ActivateApp();
            Log.I("FacebookAnalysisAdapter init success");
            InitSuccess = true;
        }

        return true;
    }

    private void InitCallback()
    {
        if (FB.IsInitialized)
        {
            // Signal an app activation App Event
            FB.ActivateApp();
            InitSuccess = true;
            Log.I("FacebookAnalysisAdapter init success");
            // Continue with Facebook SDK
            // ...
        }
        else
        {
            InitSuccess = false;
            Log.I("Failed to Initialize the Facebook SDK");
        }
    }

    private void OnHideUnity(bool isUnityShown)
    {
        //todo   不一定暂停游戏
        return;
        if (!isUnityShown)
        {
            // Pause the game - we will need to hide
            Time.timeScale = 0;
        }
        else
        {
            // Resume the game - we're getting focus again
            Time.timeScale = 1;
        }
    }

    //发送消息案例
    //     var tutParams = new Dictionary<string, object>();
    //     tutParams[AppEventParameterName.ContentID] = "tutorial_step_1";
    // tutParams[AppEventParameterName.Description] = "First step in the tutorial, clicking the first button!";
    // tutParams[AppEventParameterName.Success] = "1";

    // FB.LogAppEvent(
    //    AppEventName.CompletedTutorial,
    //    parameters: tutParams
    // );

    public override void CustomEvent(string eventID)
    {
        Log.I("Facebook Send Data：" + eventID);
        FB.LogAppEvent(eventID);
    }

    public override void CustomValueEvent(string eventID, float value, string label)
    {
        Log.I("Facebook Send Data：" + eventID);
        FB.LogAppEvent(eventID, value);
    }

    public override void CustomEventDuration(string eventID, long duration)
    {

    }

    public override void CustomEventDic(string eventID, Dictionary<string, string> dic)
    {
        Log.I("Facebook Send Data：" + eventID);

        try
        {
            List<string> paramKey = new List<string>(dic.Keys);
            Dictionary<string, object> param = new Dictionary<string, object>();
            foreach (KeyValuePair<string, string> kvp in dic)
            {
                param.Add(kvp.Key, kvp.Value);
            }
            FB.LogAppEvent(eventID, 0, param);
        }
        catch (Exception e)
        {
            if (m_AdapterConfig.isDebugMode)
                Log.I("Facebook error:" + e);
        }

    }
}
