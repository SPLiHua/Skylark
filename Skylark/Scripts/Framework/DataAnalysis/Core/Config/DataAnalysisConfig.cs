using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    [System.Serializable]
    public class DataAnalysisConfig
    {
        public FirebaseDataConfig firebaseDataConfig;
        public FacebookConfig facebookConfig;
        public AdjustAdapterConfig adjustAdapterConfig;
    }



    [System.Serializable]
    public class FirebaseDataConfig : SDKAdapterConfig
    {
        public override string adapterClassName
        {
            get
            {
                return "FirebaseAnalysisAdapter";
            }
        }
    }

    [System.Serializable]
    public class FacebookConfig : SDKAdapterConfig
    {
        public override string adapterClassName
        {
            get
            {
                return "FacebookAnalysisAdapter";
            }
        }
    }

    [System.Serializable]
    public class AdjustAdapterConfig : SDKAdapterConfig
    {
        public override string adapterClassName
        {
            get
            {
                return "AdjustAnalysisAdapter";
            }
        }

        public string m_AppToken;
        public com.adjust.sdk.AdjustEnvironment m_AdjustEnvironment;
        public com.adjust.sdk.AdjustLogLevel m_AdjustLogLevel;
        public bool m_EventBuffering;
        public bool m_SendInBackground;
    }
}