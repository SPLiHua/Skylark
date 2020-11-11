﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Firebase.Analytics;
using System;
using Skylark;

public class FirebaseAnalysisAdapter : DataAnalysisAdapter
{
    protected override bool AdapterInit(SDKAdapterConfig adapterConfig)
    {
        //Android 版 Firebase Unity SDK 需要使用 Google Play 服务。您必须先将 Google Play 服务更新为最新版本，然后才能使用该 SDK。
        Firebase.FirebaseApp.CheckAndFixDependenciesAsync().ContinueWith(task =>
        {
            var dependencyStatus = task.Result;
            if (dependencyStatus == Firebase.DependencyStatus.Available)
            {
                // Create and hold a reference to your FirebaseApp,
                // where app is a Firebase.FirebaseApp property of your application class.
                //   app = Firebase.FirebaseApp.DefaultInstance;

                // Set a flag here to indicate whether Firebase is ready to use by your app.

                FirebaseAnalytics.SetAnalyticsCollectionEnabled(true);
                //firebase初始化成功后调用FirebaseRemote
                //FirebaseRemoteMgr.Instance.Init();

                //FirebaseAnalytics.SetUserId("my_user");
                // Set default session duration values.
                //FirebaseAnalytics.SetMinimumSessionDuration(new TimeSpan(0, 0, 10));
                //FirebaseAnalytics.SetSessionTimeoutDuration(new TimeSpan(0, 30, 0));
                //FirebaseAnalytics.SetUserId(userid_af);
                // FirebaseAnalytics.SetUserProperty("userID", "");
                if (m_AdapterConfig.isDebugMode)
                    Log.I("FirebaseAnalysisAdapter初始化成功");

                InitSuccess = true;
            }
            else
            {
                Log.E(System.String.Format(
                  "Could not resolve all Firebase dependencies: {0}", dependencyStatus));
                // Firebase Unity SDK is not safe to use here.
                InitSuccess = false;
            }
        });

        return true;
    }

    public override void CustomEvent(string eventID, string label = null, Dictionary<string, string> dic = null)
    {
        if (dic == null)
        {
            Log.I("firebase发送数据：" + eventID);
            FirebaseAnalytics.LogEvent(eventID, "description", label == null ? "" : label);
            return;
        }
        try
        {
            List<string> paramKey = new List<string>(dic.Keys);
            Parameter[] param = new Parameter[paramKey.Count + 1];
            for (int i = 0; i < paramKey.Count; i++)
            {
                param[i] = new Parameter(paramKey[i], dic[paramKey[i]]);
            }
            param[paramKey.Count] = new Parameter("description", label == null ? "" : label);
            FirebaseAnalytics.LogEvent(eventID, param);
            paramKey.Clear();
        }
        catch (Exception e)
        {
            if (m_AdapterConfig.isDebugMode)
                Log.I("Firebase error:" + e);
        }
    }

    public override void CustomValueEvent(string eventID, float value, string label = null, Dictionary<string, string> dic = null)
    {
        if (dic != null)
        {
            CustomEventDic(eventID, dic);
        }
    }

    public override void CustomEventDuration(string eventID, long duration)
    {

    }

    public override void CustomEventDic(string eventId, Dictionary<string, string> dic)
    {
        try
        {
            List<string> paramKey = new List<string>(dic.Keys);
            Parameter[] param = new Parameter[paramKey.Count];
            for (int i = 0; i < paramKey.Count; i++)
            {
                param[i] = new Parameter(paramKey[i], dic[paramKey[i]]);
            }
            FirebaseAnalytics.LogEvent(eventId, param);
            paramKey.Clear();
        }
        catch (Exception e)
        {
            if (m_AdapterConfig.isDebugMode)
                Log.I("Firebase error:" + e);
        }

    }
}
