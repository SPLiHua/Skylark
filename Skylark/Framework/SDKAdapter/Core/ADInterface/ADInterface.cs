using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IAdInterfaceEventListener
    {
        void OnAdLoadedEvent();
        void OnAdLoadFailedEvent();
        void OnAdRewardEvent();
        void OnAdCloseEvent();
        void OnAdClickEvent();
        void OnAdShownEvent();
    }

    public class ADInterface
    {
        private ADGroup m_ADGroup;
        public List<ADHandler> m_ADHandlerList;

        public IAdInterfaceEventListener EventListener
        {
            get
            {
                return AdDisPlayer.m_GlobalAdDisPlayer;
            }
        }

        public void Init(ADGroup adGroup)
        {
            m_ADGroup = adGroup;
            m_ADHandlerList = new List<ADHandler>();
        }

        public void RegisterHandler(ADHandler handler)
        {
            if (!m_ADHandlerList.Contains(handler))
            {
                handler.RegisterADInterface(this);
                m_ADHandlerList.Add(handler);
            }
        }

        public virtual bool ShowAD()
        {
            foreach (var item in m_ADHandlerList)
            {
                if (item.isADReady)
                {
                    if (item.ShowAD())
                    {
                        return true;
                    }
                }
            }
            Log.I("{0} no handler prepare.", m_ADGroup);
            return false;
        }

        public virtual void HideAD()
        {
            foreach (var item in m_ADHandlerList)
            {
                item.HideAD();
            }
        }

        public virtual void RefreshAD()
        {
            foreach (var item in m_ADHandlerList)
            {
                item.RefreshAD();
            }
        }

        public virtual void DestoryAD()
        {
            foreach (var item in m_ADHandlerList)
            {
                item.DestoryAD();
            }
        }
    }
}