using UnityEngine;

namespace Skylark
{
    public class UINodeFinder : IUINodeFinder
    {
        private string m_TargetPanel;
        private string m_TargetUINode;
        private Transform m_Result;

        public void SetParam(object[] pv)
        {
            if (pv.Length == 0)
            {
                Log.W("UINodeFinder Init With Invalid Param.");
                return;
            }

            m_TargetPanel = pv[0] as string;
            if (pv.Length > 1)
            {
                m_TargetUINode = pv[1] as string;
            }
        }

        public Transform FindNode(bool search)
        {
            //if (search)
            {
                m_Result = FindTransformInPanel(m_TargetPanel, m_TargetUINode);
            }

            return m_Result;
        }

        public static RectTransform FindTransformInPanel(string targetPanelName, string targetUINodePath)
        {
            UIData data = UIDataTable.Get(targetPanelName);
            if (data == null)
            {
                return null;
            }
            AbstractPanel panel = UIMgr.S.GetPanel((UIID)data.uiID);//UIMgr.S.uiRoot.panelRoot.Find(targetPanelName);
            if (panel == null)
            {
                return null;
            }

            Transform targetPanel = panel.transform;
            if (targetPanel == null)
            {
                return null;
            }

            if (string.IsNullOrEmpty(targetUINodePath))
            {
                return targetPanel as RectTransform;
            }

            RectTransform result = targetPanel.Find(targetUINodePath) as RectTransform;

            if (result == null || !result.gameObject.activeSelf)
            {
                return null;
            }

            return result;
        }
    }
}