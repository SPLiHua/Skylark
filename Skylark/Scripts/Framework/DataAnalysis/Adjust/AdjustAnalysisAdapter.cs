using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using com.adjust.sdk;
using Skylark;
using System;

public class AdjustAnalysisAdapter : DataAnalysisAdapter
{
    protected override bool AdapterInit(SDKAdapterConfig adapterConfig)
    {
        AdjustAdapterConfig config = (AdjustAdapterConfig)adapterConfig;

        AdjustConfig adjustConfig = new AdjustConfig(config.m_AppToken, config.m_AdjustEnvironment);
        adjustConfig.setLogLevel(config.m_AdjustLogLevel);
        adjustConfig.setLogDelegate(msg => Log.I(msg));
        adjustConfig.setEventBufferingEnabled(config.m_EventBuffering);
        adjustConfig.setSendInBackground(config.m_SendInBackground);

        // adjustConfig.setDeferredDeeplinkDelegate(DeferredDeeplinkCallback);  //深度链接
        // adjustConfig.setEventSuccessDelegate(EventSuccessCallback);
        // adjustConfig.setEventFailureDelegate(EventFailureCallback);
        // adjustConfig.setSessionSuccessDelegate(SessionSuccessCallback);
        // adjustConfig.setSessionFailureDelegate(SessionFailureCallback);
        // adjustConfig.setAttributionChangedDelegate(AttributionChangedCallback);
        Adjust.start(adjustConfig);
        InitSuccess = true;

        Log.I("AdjustAnalysisAdapter init success");
        return true;
    }

    public override void CustomEvent(string eventID)
    {
        Log.I("Adjust Send Data：" + eventID);
        AdjustEvent adjustEvent = new AdjustEvent(eventID);
        Adjust.trackEvent(adjustEvent);
    }

    public override void CustomValueEvent(string eventID, float value, string label)
    {
        Log.I("Adjust Send Data：" + eventID);
        AdjustEvent adjustEvent = new AdjustEvent(eventID);
        adjustEvent.setRevenue(value, label);
        Adjust.trackEvent(adjustEvent);
    }

    public override void CustomEventDuration(string eventID, long duration)
    {

    }

    public override void CustomEventDic(string eventID, Dictionary<string, string> dic)
    {
        Log.I("Adjust Send Data：" + eventID);

        try
        {
            AdjustEvent adjustEvent = new AdjustEvent(eventID);

            List<string> paramKey = new List<string>(dic.Keys);
            for (int i = 0; i < paramKey.Count; i++)
            {
                adjustEvent.addPartnerParameter(paramKey[i], dic[paramKey[i]]);
            }
            Adjust.trackEvent(adjustEvent);
            paramKey.Clear();
        }
        catch (Exception e)
        {
            if (m_AdapterConfig.isDebugMode)
                Log.I("Firebase error:" + e);
        }
    }

    public void CustomEventCallback(string eventId, Dictionary<string, string> dic)
    {
        AdjustEvent adjustEvent = new AdjustEvent(eventId);

        List<string> paramKey = new List<string>(dic.Keys);
        for (int i = 0; i < paramKey.Count; i++)
        {
            adjustEvent.addCallbackParameter(paramKey[i], dic[paramKey[i]]);
        }
        Adjust.trackEvent(adjustEvent);
        paramKey.Clear();
    }

    public void AttributionChangedCallback(AdjustAttribution attributionData)
    {
        Log.I("Attribution changed!");

        if (attributionData.trackerName != null)
        {
            Log.I("Tracker name: " + attributionData.trackerName);
        }
        if (attributionData.trackerToken != null)
        {
            Log.I("Tracker token: " + attributionData.trackerToken);
        }
        if (attributionData.network != null)
        {
            Log.I("Network: " + attributionData.network);
        }
        if (attributionData.campaign != null)
        {
            Log.I("Campaign: " + attributionData.campaign);
        }
        if (attributionData.adgroup != null)
        {
            Log.I("Adgroup: " + attributionData.adgroup);
        }
        if (attributionData.creative != null)
        {
            Log.I("Creative: " + attributionData.creative);
        }
        if (attributionData.clickLabel != null)
        {
            Log.I("Click label: " + attributionData.clickLabel);
        }
        if (attributionData.adid != null)
        {
            Log.I("ADID: " + attributionData.adid);
        }
    }

    public void EventSuccessCallback(AdjustEventSuccess eventSuccessData)
    {
        Log.I("Event tracked successfully!");

        if (eventSuccessData.Message != null)
        {
            Log.I("Message: " + eventSuccessData.Message);
        }
        if (eventSuccessData.Timestamp != null)
        {
            Log.I("Timestamp: " + eventSuccessData.Timestamp);
        }
        if (eventSuccessData.Adid != null)
        {
            Log.I("Adid: " + eventSuccessData.Adid);
        }
        if (eventSuccessData.EventToken != null)
        {
            Log.I("EventToken: " + eventSuccessData.EventToken);
        }
        if (eventSuccessData.CallbackId != null)
        {
            Log.I("CallbackId: " + eventSuccessData.CallbackId);
        }
        if (eventSuccessData.JsonResponse != null)
        {
            Log.I("JsonResponse: " + eventSuccessData.GetJsonResponse());
        }
    }

    public void EventFailureCallback(AdjustEventFailure eventFailureData)
    {
        Log.I("Event tracking failed!");

        if (eventFailureData.Message != null)
        {
            Log.I("Message: " + eventFailureData.Message);
        }
        if (eventFailureData.Timestamp != null)
        {
            Log.I("Timestamp: " + eventFailureData.Timestamp);
        }
        if (eventFailureData.Adid != null)
        {
            Log.I("Adid: " + eventFailureData.Adid);
        }
        if (eventFailureData.EventToken != null)
        {
            Log.I("EventToken: " + eventFailureData.EventToken);
        }
        if (eventFailureData.CallbackId != null)
        {
            Log.I("CallbackId: " + eventFailureData.CallbackId);
        }
        if (eventFailureData.JsonResponse != null)
        {
            Log.I("JsonResponse: " + eventFailureData.GetJsonResponse());
        }

        Log.I("WillRetry: " + eventFailureData.WillRetry.ToString());
    }

    public void SessionSuccessCallback(AdjustSessionSuccess sessionSuccessData)
    {
        Log.I("Session tracked successfully!");

        if (sessionSuccessData.Message != null)
        {
            Log.I("Message: " + sessionSuccessData.Message);
        }
        if (sessionSuccessData.Timestamp != null)
        {
            Log.I("Timestamp: " + sessionSuccessData.Timestamp);
        }
        if (sessionSuccessData.Adid != null)
        {
            Log.I("Adid: " + sessionSuccessData.Adid);
        }
        if (sessionSuccessData.JsonResponse != null)
        {
            Log.I("JsonResponse: " + sessionSuccessData.GetJsonResponse());
        }
    }

    public void SessionFailureCallback(AdjustSessionFailure sessionFailureData)
    {
        Log.I("Session tracking failed!");

        if (sessionFailureData.Message != null)
        {
            Log.I("Message: " + sessionFailureData.Message);
        }
        if (sessionFailureData.Timestamp != null)
        {
            Log.I("Timestamp: " + sessionFailureData.Timestamp);
        }
        if (sessionFailureData.Adid != null)
        {
            Log.I("Adid: " + sessionFailureData.Adid);
        }
        if (sessionFailureData.JsonResponse != null)
        {
            Log.I("JsonResponse: " + sessionFailureData.GetJsonResponse());
        }

        Log.I("WillRetry: " + sessionFailureData.WillRetry.ToString());
    }
}