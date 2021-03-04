using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

namespace Skylark
{
    public class FloatMessagePanel : AbstractPanel
    {
        [SerializeField]
        Text m_MsgText;

        private Vector3 m_StartVec;
        private Vector3 m_EndVec;
        private float m_AnimTime = 0.5f;

        void Start()
        {
            if (m_MsgText == null)
                m_MsgText = GetComponentInChildren<Text>();
        }

        protected override void OnPanelOpen(params object[] args)
        {
            m_MsgText.text = "";
            if (args != null && args.Length > 0)
            {
                string msg = (string)args[0];
                m_MsgText.text = msg;
                m_EndVec = m_MsgText.transform.localPosition;
                m_StartVec = m_EndVec - new Vector3(0, 100, 0);
                m_MsgText.transform.localPosition = m_StartVec;
                PlayAnim();
            }
        }

        private void Reset()
        {
            m_MsgText.transform.localPosition = m_EndVec;
            m_MsgText.text = "";
        }

        private void PlayAnim()
        {
            m_MsgText.transform.DOLocalMove(m_EndVec, m_AnimTime).SetEase(Ease.Linear);
            Timer.S.Post2Really((i) =>
            {
                Reset();
                CloseSelfPanel();
            }, m_AnimTime, 1);
        }
    }
}