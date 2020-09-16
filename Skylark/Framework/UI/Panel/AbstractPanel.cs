﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AbstractPanel : MonoBehaviour
    {
        [SerializeField]
        private SpritesData[] m_SpritesData;
        private SpritesHandler m_SpritesHandler;

        protected int m_SiblingIndex;
        public int SiblingIndex
        {
            get { return m_SiblingIndex; }
            set { m_SiblingIndex = value; }
        }

        protected UIID m_UIID;
        public UIID uiID
        {
            get { return m_UIID; }
            set { m_UIID = value; }
        }
        protected PanelShowMode m_ShowMode;
        public PanelShowMode ShowMode
        {
            get { return m_ShowMode; }
            set { m_ShowMode = value; }
        }

        public void PanelOpen(params object[] args)
        {
            gameObject.SetActive(true);
            OnPanelOpen(args);
        }

        public void OnPanelClose()
        {
            DataReset();
            gameObject.SetActive(false);
        }

        #region //子类可调用
        public Sprite FindSprite(string spriteName)
        {
            Sprite result = null;
            if (m_SpritesData == null || m_SpritesData.Length == 0)
            {

            }
            else
            {
                if (m_SpritesHandler == null)
                {
                    m_SpritesHandler = new SpritesHandler();
                    m_SpritesHandler.SetData(m_SpritesData);
                }

                result = m_SpritesHandler.FindSprite(spriteName);
            }

            return result;
        }
        protected void CloseSelfPanel()
        {
            UIMgr.S.ClosePanel(m_UIID);
        }

        /// <summary>
        /// 设置透明和穿透
        /// </summary>
        /// <param name="bPentrate">是否可穿透</param>
        /// <param name="color">颜色（对应透明度）</param>
        protected void SetLucenyAndPenetrate(bool bPentrate, Color color)
        {
            if (m_ShowMode == PanelShowMode.Pop)
            {
                UIMgr.S.OpenPanel(UIID.MaskPanel, bPentrate, color);
            }
            else
            {
                Debug.Log("类型不符合使用maskpanel");
            }
        }
        #endregion

        #region //子类重写
        public virtual void OnPanelOpen(params object[] args)
        {

        }

        //需要数据清理的时候调用
        public virtual void DataReset()
        {

        }
        #endregion
    }
}