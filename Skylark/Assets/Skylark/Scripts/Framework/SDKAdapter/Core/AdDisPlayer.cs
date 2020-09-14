using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public delegate void ADShowResultDelegate(bool isShowSuccess, bool isRewardSuccess, bool isClick);

    public class AdDisPlayer : IAdInterfaceEventListener
    {
        public static readonly AdDisPlayer m_GlobalAdDisPlayer = new AdDisPlayer();

        private ADShowResultDelegate m_ADShowCallback;
        private bool m_IsRewardSuccess = false;
        private bool m_IsShowSuccess = false;
        private bool m_IsClickAd = false;
        private bool m_IsFinish = false;
        private ADInterface m_ADInterface;

        public static void ShowAD(ADGroup adInterfaceGroup, ADShowResultDelegate callback = null)
        {
            m_GlobalAdDisPlayer.ShowAd(adInterfaceGroup, callback);
        }

        private void ShowAd(ADGroup adInterfaceGroup, ADShowResultDelegate callback = null)
        {
            ResetParams();
            m_ADInterface = ADMgr.S.GetInterface(adInterfaceGroup);
            m_ADShowCallback = callback;
            m_ADInterface.ShowAD();
        }

        private void ResetParams()
        {
            m_IsRewardSuccess = false;
            m_IsShowSuccess = false;
            m_IsClickAd = false;
            m_IsFinish = false;
        }

        public void OnAdClickEvent()
        {
            m_IsClickAd = true;
        }

        public void OnAdRewardEvent()
        {
            m_IsRewardSuccess = true;
        }

        public void OnAdShownEvent()
        {
            m_IsShowSuccess = true;
        }

        public void OnAdCloseEvent()
        {
            if (m_ADShowCallback != null)
                m_ADShowCallback(m_IsShowSuccess, m_IsRewardSuccess, m_IsClickAd);
            ResetParams();
        }

        public void OnAdLoadedEvent()
        {

        }

        public void OnAdLoadFailedEvent()
        {

        }
    }
}