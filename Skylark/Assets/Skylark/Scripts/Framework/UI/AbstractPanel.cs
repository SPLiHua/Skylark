using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AbstractPanel : MonoBehaviour
    {
        [SerializeField]
        protected AbstractPanel m_ParentPage;
        [SerializeField]
        private SpritesData[] m_SpritesData;
        private SpritesHandler m_SpritesHandler;

        private int m_PanelID = -1;
        public int panelID
        {
            get
            {
                return GetParentPanelID();
            }
            set { m_PanelID = value; }
        }

        protected int m_UIID;
        public int uiID
        {
            get { return m_UIID; }
            set { m_UIID = value; }
        }

        public string uiName
        {
            get
            {
                if (m_UIID < 0)
                {
                    return "";
                }

                var data = UIDataTable.Get(m_UIID);
                if (data == null)
                {
                    return "";
                }

                return data.shortName;
            }
        }
        #region //通用功能接口
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

        public int GetParentPanelID()
        {
            if (m_ParentPage == null)
            {
                return m_PanelID;
            }
            return m_ParentPage.GetParentPanelID();
        }
        #endregion

        public void OnPanelClose()
        {
            DataClear();
            gameObject.SetActive(false);
        }

        #region //子类重写
        public virtual void OnPanelOpen(params object[] args)
        {
            gameObject.SetActive(true);
        }

        public virtual void CloseSelfPanel()
        {
            UIMgr.S.ClosePanel(m_UIID);
        }

        //需要数据清理的时候调用
        public virtual void DataClear()
        {

        }
        #endregion
    }
}