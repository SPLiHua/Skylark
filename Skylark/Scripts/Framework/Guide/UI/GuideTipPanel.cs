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

                        m_TipText.transform.parent.parent.localPosition = new Vector3(0, targetTrans.localPosition.y, 0);
                        m_TipText.transform.parent.parent.localPosition += pos;
                    }
                }
            }
        }
    }
}