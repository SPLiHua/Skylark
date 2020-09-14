using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    [System.Serializable]
    public class ADParams
    {
        public string name;
        public string adUnitId_Android;
        public string adUnitId_ios;
        public string adUnitId
        {
            get
            {
#if UNITY_ANDROID
            return adUnitId_Android;
#elif UNITY_IPHONE
            return adUnitId_ios;
#else
                return "";
#endif
            }
        }

        public ADType adType;
        public ADPosition adPosition;

        [Header("避免不同ADType的广告分到同一组")]
        public ADGroup adInterfaceGroup;

        private object[] extraParams;
        public object[] ExtraParams
        {
            get { return extraParams; }
            set { extraParams = value; }
        }

    }

    public enum ADType
    {
        Banner, Interstitial, Reward, FullScreen, Native,
    }

    public enum ADPosition
    {
        Top = 0,
        Bottom = 1,
        TopLeft = 2,
        TopRight = 3,
        BottomLeft = 4,
        BottomRight = 5,
        Center = 6,
        CustomDefine = 100,
    }

    public enum ADGroup
    {
        Banner0,
        Interstitial0,
        Reward0,
    }
}