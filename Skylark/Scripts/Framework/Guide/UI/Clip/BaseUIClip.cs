using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public abstract class BaseUIClip : MonoBehaviour
    {
        public virtual void RefreshMask(RectTransform target, bool playAnim, float radius, Vector2 offset)
        {

        }

        protected Vector2 WorldToCanvasPos(Canvas canvas, Vector3 world)
        {
            Vector2 position = Vector2.zero;
            RectTransformUtility.ScreenPointToLocalPointInRectangle(canvas.transform as RectTransform, world, UIMgr.S.m_UIRoot.UICamera, out position);
            return position;
        }
    }
}