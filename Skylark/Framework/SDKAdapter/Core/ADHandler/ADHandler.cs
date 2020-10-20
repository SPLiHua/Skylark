using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ADHandler
    {
        protected ADState m_ADState = ADState.NONE;
        protected ADInterface m_ADInterface;
        public ADParams m_ADParams;

        public bool isADHandlerEnable
        {
            get
            {
                return true;
            }
        }

        public virtual bool isADReady
        {
            get
            {
                return false;
            }
        }

        public void Init(ADParams adParams)
        {
            m_ADParams = adParams;
            DoInitAD();
        }

        public void RegisterADInterface(ADInterface adInterface)
        {
            m_ADInterface = adInterface;
        }

        public bool ShowAD()
        {
            if (m_ADState == ADState.Failed || m_ADState == ADState.Showing)
                return false;
            if (DoShowAD())
            {
                //todo  数据分析
                m_ADState = ADState.Showing;
                return true;
            }
            return false;
        }

        public bool HideAD()
        {
            if (m_ADState == ADState.Failed || m_ADState == ADState.NONE)
                return false;
            return DoHideAD();
        }

        //Banner Only?
        public bool RefreshAD()
        {
            return DoRefreshAD();
        }

        public bool DestoryAD()
        {
            return DoDestoryAD();
        }

        #region  //回调事件
        protected void HandleOnADLoaded(string adUnitId, float height)
        {
            m_ADInterface.EventListener.OnAdLoadedEvent();
        }

        protected void HandleOnADLoadFailed(string adUnitId, string error)
        {
            Debug.Log("ADLoadFailed:" + adUnitId + "/////" + error);
            m_ADState = ADState.Failed;
            m_ADInterface.EventListener.OnAdLoadFailedEvent();
        }

        protected void HandleOnAdShown(string adUnitId)
        {
            m_ADState = ADState.Showing;
            m_ADInterface.EventListener.OnAdShownEvent();
        }

        protected void HandleOnAdClick(string adUnitId)
        {
            //todo  行为相应
            //todo  数据分析
            m_ADState = ADState.Click;
            m_ADInterface.EventListener.OnAdClickEvent();
        }

        protected void HandleOnAdClosed(string adUnitId)
        {
            Debug.Log("AdClosed:" + adUnitId);
            m_ADState = ADState.Close;
            m_ADInterface.EventListener.OnAdCloseEvent();
        }
        #endregion

        #region //供子类重写的方法
        protected virtual void DoInitAD()
        {

        }

        protected virtual bool DoShowAD()
        {
            return false;
        }

        protected virtual bool DoHideAD()
        {
            return false;
        }

        protected virtual bool DoRefreshAD()
        {
            return false;
        }

        protected virtual bool DoDestoryAD()
        {
            return false;
        }
        #endregion
    }
}