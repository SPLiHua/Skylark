﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

namespace Skylark
{
    public class GuideHandPanel : AbstractPanel
    {
        [SerializeField]
        GameObject m_HandGo;

        private IUINodeFinder m_Finder;
        private Sequence m_Sequence;

        protected override void OnPanelOpen(params object[] args)
        {
            transform.localPosition = new Vector3(0, 0, -1000);

            if (args != null)
            {
                Vector3 pos = Vector3.zero;
                if (args.Length > 0)
                {
                    pos = Utility.UtilityTable.String2Vector2((string)args[0], '|');
                    m_HandGo.transform.localPosition = pos;

                    if (args.Length > 1)
                    {
                        m_Finder = args[1] as IUINodeFinder;
                        Transform targetTrans = m_Finder.FindNode(false);
                        m_HandGo.transform.localPosition = new Vector3(targetTrans.localPosition.x, targetTrans.localPosition.y, 0);

                        m_HandGo.transform.localPosition += pos;
                    }

                    if (m_Sequence != null)
                    {
                        DOTween.Kill(m_HandGo.transform);
                    }
                    Vector3 scale = Vector3.one;
                    m_Sequence = DOTween.Sequence().Append(m_HandGo.transform.DOScale(scale * 1.2f, 0.5f)).Append(m_HandGo.transform.DOScale(scale, 0.5f))
                    .SetEase(Ease.Linear).SetLoops(-1).SetUpdate(true);
                }
            }
        }
    }
}