using UnityEngine;

namespace Skylark
{
    public class RectTransformHelper
    {
        private static Vector3[] m_TempPosArray = new Vector3[4];
        public static Vector2[] GetRectTransformViewPort(RectTransform target)
        {
            target.GetWorldCorners(m_TempPosArray);
            Vector2[] result = new Vector2[2];

            result[0] = UIMgr.S.m_UIRoot.UICamera.WorldToViewportPoint(m_TempPosArray[0]);
            result[1] = UIMgr.S.m_UIRoot.UICamera.WorldToViewportPoint(m_TempPosArray[2]);

            return result;
        }
    }
}
