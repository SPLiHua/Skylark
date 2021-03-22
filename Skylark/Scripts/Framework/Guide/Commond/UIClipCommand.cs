using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Skylark
{
    public class UIClipCommand : AbstractGuideCommand
    {
        public enum UIClipType
        {
            Circle,
            Square,
        }

        private object[] m_Params;

        protected Transform m_TargetButton;
        private IUINodeFinder m_Finder;

        private bool m_HasDown = false;
        private static List<RaycastResult> m_Result = new List<RaycastResult>();

        public override void SetParam(object[] param)
        {
            if (param != null && param.Length > 0)
            {
                m_Finder = param[0] as IUINodeFinder;
                m_Params = param;
            }
        }

        protected override void OnStart()
        {
            if (m_Finder != null)
            {
                m_TargetButton = m_Finder.FindNode(false);
            }
            // if (m_TargetButton == null)
            // {
            //     Log.E("Can't find targe ui node");
            //     return;
            // }

            AppLoopMgr.S.onUpdate += Update;

            UIMgr.S.OpenPanelTop(UIID.UIClipPanel, m_Params);
        }

        protected void Update()
        {
            if (m_TargetButton == null)
            {
                AppLoopMgr.S.onUpdate -= Update;
                return;
            }

            if (Input.GetMouseButtonDown(0))
            {
                if (CheckIsTouchInTarget())
                {
                    m_HasDown = true;
                    OnClickDownOnTarget();
                }
            }
            if (!m_HasDown)
            {
                return;
            }

            if (Input.GetMouseButtonUp(0))
            {
                if (CheckIsTouchInTarget())
                {
                    OnClickUpOnTarget();
                }
                m_HasDown = false;
            }
        }

        protected bool CheckIsTouchInTarget()
        {
            PointerEventData pd = new PointerEventData(UnityEngine.EventSystems.EventSystem.current);
            pd.position = Input.mousePosition;

            var graphicRaycasr = m_TargetButton.GetComponentInParent<GraphicRaycaster>();

            if (graphicRaycasr == null)
            {
                return false;
            }

            graphicRaycasr.Raycast(pd, m_Result);

            if (m_Result.Count == 0)
            {
                return false;
            }

            if (IsHitWhiteObject(m_Result))
            {
                m_Result.Clear();
                return true;
            }

            m_Result.Clear();
            return false;
        }


        private bool IsHitWhiteObject(List<RaycastResult> result)
        {
            if (result == null || result.Count == 0)
            {
                return false;
            }

            for (int i = result.Count - 1; i >= 0; --i)
            {
                GameObject go = result[i].gameObject;
                if (go != null)
                {
                    if (IsHitWhiteObject(go.transform))
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        private bool IsHitWhiteObject(Transform tr)
        {
            if (tr.IsChildOf(m_TargetButton.transform))
            {
                return true;
            }

            return false;
        }

        private void OnClickDownOnTarget()
        {
            ExecuteEvents.Execute<IPointerDownHandler>(m_TargetButton.gameObject, new PointerEventData(UnityEngine.EventSystems.EventSystem.current), ExecuteEvents.pointerDownHandler);
        }

        protected virtual void OnClickUpOnTarget()
        {
            ExecuteEvents.Execute<IPointerClickHandler>(m_TargetButton.gameObject, new PointerEventData(UnityEngine.EventSystems.EventSystem.current), ExecuteEvents.pointerClickHandler);

            FinishStep();
        }

        protected override void OnFinish(bool forceClean)
        {
            AppLoopMgr.S.onUpdate -= Update;

            UIMgr.S.ClosePanel(UIID.UIClipPanel);
        }
    }
}