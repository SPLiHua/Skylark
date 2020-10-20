using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ADMgr : Singleton<ADMgr>
    {
        private Dictionary<string, IAdAdapter> m_AdAdapterDict;
        private Dictionary<ADGroup, ADInterface> m_ADInterfaceGroupDict;
        private List<ADHandler> m_ADHandlerList;

        public void Init()
        {
            if (!SDKConfig.S.adsConfig.isEnable)
                return;

            m_AdAdapterDict = new Dictionary<string, IAdAdapter>();
            m_ADInterfaceGroupDict = new Dictionary<ADGroup, ADInterface>();
            m_ADHandlerList = new List<ADHandler>();
            InitSupportedAdapter(SDKConfig.S);
        }

        private void InitSupportedAdapter(SDKConfig sdkConfig)
        {
            //添加adapter
            RegisterAdapter(sdkConfig.adsConfig.mopubAdsConfig);
        }

        private bool RegisterAdapter(SDKAdapterConfig adapterConfig)
        {
            if (!adapterConfig.isEnable)
                return false;

            Type type = Type.GetType(adapterConfig.adapterClassName);
            if (type == null)
            {
                if (adapterConfig.isDebugMode)
                    Debug.Log("No Support ADAdapter:" + adapterConfig.adapterClassName);
                return false;
            }

            BaseADAdapter adsAdapter = type.Assembly.CreateInstance(adapterConfig.adapterClassName) as BaseADAdapter;
            if (adsAdapter == null)
            {
                if (adapterConfig.isDebugMode)
                    Debug.Log("AdAdapter Create Failed:" + adapterConfig.adapterClassName);
                return false;
            }
            if (adsAdapter.InitWithConfig(adapterConfig))
            {
                m_AdAdapterDict.Add(adapterConfig.adapterClassName, adsAdapter);
                RegisterADInterface(adapterConfig as SDKADAdapterConfig);
            }

            return true;
        }

        private void RegisterADInterface(SDKADAdapterConfig config)
        {
            for (int i = 0; i < config.adParamsList.Count; i++)
            {
                ADInterface adInterface = null;
                if (m_ADInterfaceGroupDict.TryGetValue(config.adParamsList[i].adInterfaceGroup, out adInterface))
                    continue;
                switch (config.adParamsList[i].adType)
                {
                    case ADType.Banner:
                        adInterface = new ADBannerInterface();
                        break;
                    case ADType.Interstitial:
                        adInterface = new ADInterstitialInterface();
                        break;
                    case ADType.Reward:
                        adInterface = new ADInterstitialInterface();
                        break;
                    default:
                        break;
                }
                if (adInterface != null)
                {
                    adInterface.Init(config.adParamsList[i].adInterfaceGroup);
                    m_ADInterfaceGroupDict.Add(config.adParamsList[i].adInterfaceGroup, adInterface);
                }
            }
        }

        public void RegisterADHandler2Interface(ADGroup groupName, ADHandler handler, ADType adType)
        {
            if (!m_ADHandlerList.Contains(handler))
                m_ADHandlerList.Add(handler);

            ADInterface adInterface = null;
            if (m_ADInterfaceGroupDict.TryGetValue(groupName, out adInterface))
            {
                adInterface.RegisterHandler(handler);
            }
            else
            {
                switch (adType)
                {
                    case ADType.Banner:
                        adInterface = new ADBannerInterface();
                        break;
                    case ADType.Interstitial:
                        adInterface = new ADInterstitialInterface();
                        break;
                    case ADType.Reward:
                        adInterface = new ADInterstitialInterface();
                        break;
                    default:
                        break;
                }
                if (adInterface != null)
                {
                    adInterface.Init(groupName);
                    m_ADInterfaceGroupDict.Add(groupName, adInterface);
                    adInterface.RegisterHandler(handler);
                }
                else
                {
                    Debug.Log("No suit ADInterface.");
                }
            }

            //test
            // foreach (var item in m_ADInterfaceGroupDict.Values)
            // {
            //     foreach (var v in item.m_ADHandlerList)
            //         Debug.Log("////////////////" + v.m_ADParams.name);
            // }
        }

        public ADInterface GetInterface(ADGroup adInterfaceGroup)
        {
            ADInterface adInterface = null;
            if (m_ADInterfaceGroupDict.TryGetValue(adInterfaceGroup, out adInterface))
            {
                return adInterface;
            }
            else
            {
                Debug.Log("No suit ADInterface.");
                return null;
            }
        }

        //带有额外传参的调用方法
        // public void PlayADWithCustom(string name, params object[] obj)
        // {
        //     if (m_ADHandlerDict.ContainsKey(name))
        //     {
        //         m_ADHandlerDict[name].m_ADParams.ExtraParams = obj;
        //         m_ADHandlerDict[name].ShowAD();
        //     }
        //     else
        //     {
        //         Debug.Log("No suit Handler.");
        //     }
        // }
    }
}
