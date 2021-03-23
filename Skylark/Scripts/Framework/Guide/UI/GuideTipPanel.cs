using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

namespace Skylark
{
    public class GuideTipPanel : AbstractPanel
    {
        [SerializeField]
        Text m_TipText;

        private IUINodeFinder m_Finder;

        protected override void OnPanelOpen(params object[] args)
        {
            transform.localPosition = new Vector3(0, 0, -1000);

            if (args != null)
            {
                m_TipText.text = (string)args[0];

                Vector3 pos = Vector3.zero;
                if (args.Length > 1)
                {
                    pos = Utility.UtilityTable.String2Vector2((string)args[1], '|');
                    m_TipText.transform.parent.parent.localPosition = pos;

                    if (args.Length > 2)
                    {
                        m_Finder = args[2] as IUINodeFinder;
                        Transform targetTrans = m_Finder.FindNode(false);
                        Vector2 ui1ScreenPos = UIMgr.S.m_UIRoot.UICamera.WorldToScreenPoint(targetTrans.position);

                        Transform topPanel = GetTopParentPanel(targetTrans);
                        if (topPanel != null)
                        {
                            Vector2 localPos;
                            bool isSucess = RectTransformUtility.ScreenPointToLocalPointInRectangle(topPanel.GetComponent<RectTransform>(), ui1ScreenPos, UIMgr.S.m_UIRoot.UICamera, out localPos);
                            if (isSucess)
                            {
                                Debug.Log("新位置:" + localPos);
                                m_TipText.transform.parent.parent.localPosition = new Vector3(0, localPos.y, 0);
                            }
                            else
                            {
                                m_TipText.transform.parent.parent.localPosition = new Vector3(0, targetTrans.localPosition.y, 0);
                            }
                            Debug.Log(targetTrans.name + "////////////" + pos);
                            m_TipText.transform.parent.parent.localPosition += pos;
                        }
                    }
                }
            }
        }

        private Transform GetTopParentPanel(Transform trans)
        {
            Transform currentTrans = trans;
            while (currentTrans != null && !currentTrans.GetComponent<AbstractPanel>())
            {
                currentTrans = currentTrans.parent;
            }

            return currentTrans;
        }
    }
}