using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class UIMgr : MonoSingleton<UIMgr>
    {
        private Dictionary<UIID, AbstractPanel> m_AllPanelMap = new Dictionary<UIID, AbstractPanel>();
        private Dictionary<UIID, AbstractPanel> m_CurrentShowMap = new Dictionary<UIID, AbstractPanel>();
        private List<AbstractPanel> m_CurrentShowList = new List<AbstractPanel>();
        private Stack<AbstractPanel> m_PopStack = new Stack<AbstractPanel>();
        public UIRoot m_UIRoot;
        ResLoader m_UILoader;

        public override void OnSingletonInit()
        {
            m_UILoader = ResLoader.Allocate();
            m_UIRoot = GameObject.FindObjectOfType<UIRoot>();
        }

        #region //公共方法
        public void OpenPanel(UIID uiID, params object[] args)
        {
            AbstractPanel panel = null;

            if (!m_AllPanelMap.TryGetValue(uiID, out panel))
            {
                panel = GetPanel(uiID);
                panel.OnPanelInit();
                if (panel == null)
                {
                    Log.I("No find panel:{0}", uiID.ToString());
                    return;
                }
            }
            panel.SortIndex = m_UIRoot.RequireNextPanelSortingOrder(panel.ShowMode);
            AdjustSiblingIndex(panel);
            if (!m_CurrentShowMap.ContainsValue(panel))
            {
                m_CurrentShowMap.Add(uiID, panel);
            }
            m_CurrentShowList.Add(panel);
            panel.PanelOpen(args);
        }

        public void ClosePanel(UIID uiID)
        {
            PanelData panelData = null;
            var data = UIDataTable.Get(uiID);
            if (data != null)
                panelData = data as PanelData;
            AbstractPanel panel = null;
            if (m_CurrentShowMap.TryGetValue(uiID, out panel))
            {
                if (panel != null && panelData != null)
                {
                    m_CurrentShowMap.Remove(uiID);
                    m_CurrentShowList.Remove(panel);
                    panel.PanelClose();
                    switch (panelData.m_PanelShowMode)
                    {
                        case PanelShowMode.Pop:
                            if (m_PopStack != null && m_PopStack.Count > 0)
                            {
                                m_PopStack.Pop();
                                if (m_PopStack.Count > 0)
                                {
                                    AbstractPanel topPanel = m_PopStack.Peek();
                                    topPanel.PanelOpen();
                                }
                            }
                            break;
                        case PanelShowMode.HideOther:
                            m_UIRoot.NormalRoot.gameObject.SetActive(true);
                            m_UIRoot.PopRoot.gameObject.SetActive(true);
                            break;
                    }
                }
                else
                {
                    Log.I("Close Panel failed:" + uiID);
                }
            }
        }

        public AbstractPanel GetPanelLoaded(UIID uiID)
        {
            AbstractPanel panel = null;
            if (m_AllPanelMap.TryGetValue(uiID, out panel))
            {
                return panel;
            }
            return null;
        }
        #endregion

        public AbstractPanel GetPanel(UIID uiID)
        {
            PanelData panelData = null;
            var data = UIDataTable.Get(uiID);
            if (data != null)
            {
                panelData = data as PanelData;
            }
            AbstractPanel panel = null;
            if (m_AllPanelMap.TryGetValue(uiID, out panel))
            {
                return panel;
            }
            GameObject panelGo = null;
            GameObject uiGo = m_UILoader.LoadSync(data.fullPath) as GameObject;
            if (uiGo != null)
            {
                panelGo = GameObject.Instantiate(uiGo);
                panel = panelGo.GetComponent<AbstractPanel>();
                panel.ShowMode = panelData.m_PanelShowMode;
                switch (panel.ShowMode)
                {
                    case PanelShowMode.Normal:
                        panelGo.transform.SetParent(m_UIRoot.NormalRoot);
                        break;
                    case PanelShowMode.Pop:
                        panelGo.transform.SetParent(m_UIRoot.PopRoot);
                        break;
                    case PanelShowMode.HideOther:
                        panelGo.transform.SetParent(m_UIRoot.NormalRoot);
                        break;
                }

                panelGo.GetComponent<RectTransform>().offsetMax = new Vector2(0, 0);
                panelGo.GetComponent<RectTransform>().offsetMin = new Vector2(0, 0);
                //panelGo.transform.localRotation = Quaternion.Euler(Vector3.zero);
                panelGo.transform.localScale = Vector3.one;
                panelGo.transform.localPosition = Vector3.zero;
                m_AllPanelMap.Add(uiID, panel);
                panel.uiID = uiID;
                return panel;
            }
            return null;
        }

        #region //OpenPanel逻辑
        private void AdjustSiblingIndex(AbstractPanel panel)
        {
            switch (panel.ShowMode)
            {
                case PanelShowMode.Normal:
                    //处理panel层级关系
                    UpdatePanelSibling();
                    break;
                case PanelShowMode.Pop:
                    PushPanel2Stack(panel);
                    break;
                case PanelShowMode.HideOther:
                    HideOtherPanels(panel);
                    break;
            }
        }

        private void PushPanel2Stack(AbstractPanel panel)
        {
            if (m_PopStack != null && m_PopStack.Count > 0)
            {
                AbstractPanel topPanel = m_PopStack.Peek();
                topPanel.PanelClose();
            }
            m_PopStack.Push(panel);
        }

        private void HideOtherPanels(AbstractPanel curPanel)
        {
            m_UIRoot.NormalRoot.gameObject.SetActive(false);
            m_UIRoot.PopRoot.gameObject.SetActive(false);
        }

        public void UpdatePanelSibling()
        {
            m_CurrentShowList.Sort(PanelCompare);
            for (int i = 0; i < m_CurrentShowList.Count; i++)
            {
                m_CurrentShowList[i].SetSiblingIndexAndSortingOrder(i);
            }
        }

        private int PanelCompare(AbstractPanel a, AbstractPanel b)
        {
            return a.SortIndex - b.SortIndex;
        }
        #endregion
    }
}