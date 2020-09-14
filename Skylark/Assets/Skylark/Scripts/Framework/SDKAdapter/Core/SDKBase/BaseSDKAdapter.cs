using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class BaseSDKAdapter : ISDKAdapter
    {
        protected SDKAdapterConfig m_AdapterConfig;

        public int GetPriorityScore()
        {
            if (m_AdapterConfig == null)
                return 0;
            return m_AdapterConfig.Priority;
        }

        public bool InitWithConfig(SDKAdapterConfig adapterConfig)
        {
            m_AdapterConfig = adapterConfig;
            return AdapterInit(adapterConfig);
        }

        protected virtual bool AdapterInit(SDKAdapterConfig adapterConfig)
        {
            return true;
        }
    }
}