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
}