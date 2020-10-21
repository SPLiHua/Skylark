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
            if (m_CurrentShowMap.TryGetValue(uiID, out panel))
            {
                return;
            }
            if (!m_AllPanelMap.TryGetValue(uiID, out panel))
            {
                panel = GetPanel(uiID);
                if (panel == null)
                {
                    Log.I("No find panel:{0}", uiID.ToString());
                    return;
                }
            }
            AdjustSiblingIndex(panel);
            m_CurrentShowMap.Add(uiID, panel);
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
                    panel.OnPanelClose();
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

        private AbstractPanel GetPanel(UIID uiID)
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
                    //处理panel层级关系(目前方案暂时不需要这一步)
                    break;
                case PanelShowMode.Pop:
                    PushPanel2Stack(panel);
                    break;
                case PanelShowMode.HideOther:
                    HideOtherPanels(panel);
                    //也处理一下层级关系(目前也不需要)
                    break;
            }
        }

        private void PushPanel2Stack(AbstractPanel panel)
        {
            if (m_PopStack != null && m_PopStack.Count > 0)
            {
                AbstractPanel topPanel = m_PopStack.Peek();
                topPanel.OnPanelClose();
            }
            m_PopStack.Push(panel);
        }

        private void HideOtherPanels(AbstractPanel curPanel)
        {
            // foreach (AbstractPanel panel in m_CurrentShowMap.Values)
            // {
            //     panel.OnPanelClose();
            // }

            //todo 层级最高
            m_UIRoot.NormalRoot.gameObject.SetActive(false);
        }

        public void UpdatePanelSibling(int index)
        {

        }
        #endregion
    }
}