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
                    instance = LoadInstance();
                }
                return instance;
            }
        }

        private static SDKConfig LoadInstance()
        {
            ResLoader loader = ResLoader.Allocate();

            UnityEngine.Object obj = loader.LoadSync("Resources/Config/SDKConfig");
            if (obj == null)
            {
                loader.Recycle2Cache();
                return null;
            }

            instance = obj as SDKConfig;

            SDKConfig newAB = GameObject.Instantiate(instance);

            instance = newAB;

            loader.Recycle2Cache();

            return instance;
        }

        public int signatures;
        public AdsConfig adsConfig;
        public DataAnalysisConfig dataAnalysisConfig;
    }
}