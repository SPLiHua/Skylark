using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark;

namespace Skylark
{
    public class DataAnalysisMgr : Singleton<DataAnalysisMgr>, IAnalysisAdapter
    {
        private Dictionary<string, DataAnalysisAdapter> analysisAdapterDict;
        public bool m_IsLoadFinish
        {
            get
            {
                if (analysisAdapterDict != null)
                {
                    foreach (var item in analysisAdapterDict.Values)
                    {
                        if (!item.InitSuccess)
                        {
                            return false;
                        }
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public void Init()
        {
            InitSupportAdapter(SDKConfig.S);
        }

        public void InitSupportAdapter(SDKConfig config)
        {
            analysisAdapterDict = new Dictionary<string, DataAnalysisAdapter>();
            RegisterAdapter(config.dataAnalysisConfig.firebaseDataConfig);
            RegisterAdapter(config.dataAnalysisConfig.facebookConfig);
        }

        private void RegisterAdapter(SDKAdapterConfig adapterConfig)
        {
            if (!adapterConfig.isEnable)
                return;

            Type type = Type.GetType(adapterConfig.adapterClassName);
            if (type == null)
            {
                if (adapterConfig.isDebugMode)
                    Log.I("Not Support DataAnalysis:" + adapterConfig.adapterClassName);
                return;
            }
            DataAnalysisAdapter adapter = type.Assembly.CreateInstance(adapterConfig.adapterClassName) as DataAnalysisAdapter;
            if (adapter == null)
            {
                if (adapterConfig.isDebugMode)
                    Log.I("No Support Adapter:" + adapterConfig.adapterClassName);
                return;
            }
            if (adapter.InitWithConfig(adapterConfig))
            {
                analysisAdapterDict.Add(adapterConfig.adapterClassName, adapter);
            }
        }

        public void CustomEvent(string eventID, string label = null, Dictionary<string, string> dic = null)
        {
            foreach (var item in analysisAdapterDict.Values)
            {
                item.CustomEvent(eventID, label, dic);
            }
        }

        public void CustomEventDic(string eventID, Dictionary<string, string> dic)
        {
            foreach (var item in analysisAdapterDict.Values)
            {
                item.CustomEventDic(eventID, dic);
            }
        }

        public void CustomEventDuration(string eventID, long duration)
        {
            foreach (var item in analysisAdapterDict.Values)
            {
                item.CustomEventDuration(eventID, duration);
            }
        }

        public void CustomValueEvent(string eventID, float value, string label = null, Dictionary<string, string> dic = null)
        {
            foreach (var item in analysisAdapterDict.Values)
            {
                item.CustomValueEvent(eventID, value, label, dic);
            }
        }
    }
}