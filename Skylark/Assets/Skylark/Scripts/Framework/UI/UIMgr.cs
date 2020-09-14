using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class UIMgr : MonoSingleton<UIMgr>
    {
        ResLoader m_UILoader;

        public override void OnSingletonInit()
        {
            m_UILoader = ResLoader.Allocate();
        }

        private Dictionary<uint, AbstractPanel> m_PanelMap = new Dictionary<uint, AbstractPanel>();

        public void OpenPanel<T>(T uiID, params object[] args) where T : IConvertible
        {
            AbstractPanel panel = null;
            if (m_PanelMap.TryGetValue(uiID.ToUInt32(null), out panel))
            {
                panel.OnPanelOpen(args);
                return;
            }
            panel = GetPanel(uiID);
            if (panel == null)
            {
                Debug.LogFormat("No find panel:{0}", uiID.ToString());
                return;
            }
            m_PanelMap.Add(uiID.ToUInt32(null), panel);
            panel.OnPanelOpen(args);
        }

        public void ClosePanel<T>(T uiID) where T : IConvertible
        {
            AbstractPanel panel = null;
            if (m_PanelMap.TryGetValue(uiID.ToUInt32(null), out panel))
            {
                panel.OnPanelClose();
            }
        }

        private AbstractPanel GetPanel<T>(T uiID) where T : IConvertible
        {
            GameObject panelGo = null;
            var data = UIDataTable.Get(uiID);
            GameObject uiGo = m_UILoader.LoadSync(data.fullPath) as GameObject;
            if (uiGo != null)
            {
                panelGo = GameObject.Instantiate(uiGo);
                panelGo.transform.SetParent(transform);
                // panelGo.transform.localPosition = Vector2.zero;
                // panelGo.transform.localScale = Vector2.one;
            }
            AbstractPanel panel = panelGo.GetComponent<AbstractPanel>();
            panel.uiID = uiID.ToInt32(null);
            return panel;
        }
    }
}