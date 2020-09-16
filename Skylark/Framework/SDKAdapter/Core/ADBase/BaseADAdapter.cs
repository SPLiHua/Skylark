using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class BaseADAdapter : BaseSDKAdapter, IAdAdapter
    {
        public void CreateAll()
        {
            SDKADAdapterConfig adapterConfig = m_AdapterConfig as SDKADAdapterConfig;
            for (int i = 0; i < adapterConfig.adParamsList.Count; i++)
            {
                ADHandler handler = null;
                switch (adapterConfig.adParamsList[i].adType)
                {
                    case ADType.Banner:
                        handler = CreateBannerAD();
                        break;
                    case ADType.Interstitial:
                        handler = CreateInterstitialAD();
                        break;
                    case ADType.Reward:
                        handler = CreateRewardVideoAD();
                        break;
                    case ADType.FullScreen:
                        handler = CreateFullScreenAD();
                        break;
                    case ADType.Native:
                        handler = CreateNativeAD();
                        break;
                }
                if (handler != null)
                {
                    handler.Init(adapterConfig.adParamsList[i]);
                    ADMgr.S.RegisterADHandler2Interface(adapterConfig.adParamsList[i].adInterfaceGroup, handler);
                }
            }
        }

        public virtual ADHandler CreateBannerAD()
        {
            return null;
        }

        public virtual ADHandler CreateInterstitialAD()
        {
            return null;
        }

        public virtual ADHandler CreateNativeAD()
        {
            return null;
        }

        public virtual ADHandler CreateRewardVideoAD()
        {
            return null;
        }

        public virtual ADHandler CreateFullScreenAD()
        {
            return null;
        }
    }
}