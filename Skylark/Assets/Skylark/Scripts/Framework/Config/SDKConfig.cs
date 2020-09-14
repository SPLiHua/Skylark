using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class SDKConfig : ScriptableObject
    {
        private static SDKConfig instance;
        public static SDKConfig S
        {
            get
            {
                if (instance == null)
                {
                    instance = Resources.Load<SDKConfig>("Config/SDKConfig");
                }
                return instance;
            }
        }
        public int signatures;
        public AdsConfig adsConfig;
        public DataAnalysisConfig dataAnalysisConfig;
    }
}