using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class CircleClip : BaseUIClip
    {
        /// <summary>
        /// 播放动画
        /// </summary>
        private bool m_PlayAnim;

        /// <summary>
        /// 镂空区域半径
        /// </summary>
        private float m_Radius;

        /// <summary>
        /// 遮罩材质
        /// </summary>
        private Material m_Material;

        /// <summary>
        /// 当前高亮区域的半径
        /// </summary>
        private float m_CurrentRadius;

        /// <summary>
        /// 收缩速度
        /// </summary>
        private float _shrinkVelocity = 0f;

        /// <summary>
        /// 高亮区域缩放的动画时间
        /// </summary>
        private float _shrinkTime = 0.2f;

        public override void RefreshMask(RectTransform target, bool playAnim, float radius, Vector2 offset)
        {
            Canvas canvas = transform.parent.GetComponent<Canvas>();

            //获取高亮区域的四个顶点的世界坐标
            Vector3[] _corners = new Vector3[4];
            target.GetWorldCorners(_corners);

            for (int i = 0; i < _corners.Length; i++)
            {
                _corners[i] = UIMgr.S.m_UIRoot.UICamera.WorldToScreenPoint(_corners[i]);
            }

            //计算最终高亮显示区域的半径
            m_Radius = Vector2.Distance(WorldToCanvasPos(canvas, _corners[0]), WorldToCanvasPos(canvas, _corners[2])) / 2f;
            m_Radius = Mathf.Max(m_Radius, radius);
            //计算高亮显示区域的圆心
            float x = _corners[0].x + ((_corners[3].x - _corners[0].x) / 2f);
            float y = _corners[0].y + ((_corners[1].y - _corners[0].y) / 2f);
            Vector3 centerWorld = new Vector3(x, y, 0);
            Vector2 center = WorldToCanvasPos(canvas, centerWorld);
            //设置遮罩材料中的圆心变量
            Vector4 centerMat = new Vector4(center.x, center.y, 0, 0);
            centerMat += new Vector4(offset.x, offset.y, 0, 0);
            m_Material = new Material(Shader.Find("UIClip/Circle"));
            GetComponent<Image>().material = m_Material;
            m_Material.SetVector("_Center", centerMat);

            m_PlayAnim = playAnim;
            if (m_PlayAnim)
            {
                //计算当前高亮显示区域的半径
                RectTransform canRectTransform = canvas.transform as RectTransform;
                if (canRectTransform != null)
                {
                    //获取画布区域的四个顶点
                    canRectTransform.GetWorldCorners(_corners);
                    //将画布顶点距离高亮区域中心最远的距离作为当前高亮区域半径的初始值
                    foreach (Vector3 corner in _corners)
                    {
                        m_CurrentRadius = Mathf.Max(Vector3.Distance(WorldToCanvasPos(canvas, corner), center), m_CurrentRadius);
                    }
                }
                m_Material.SetFloat("_Slider", m_CurrentRadius);
            }
            else
            {
                m_Material.SetFloat("_Slider", m_Radius);
            }
        }

        private void Update()
        {
            if (m_PlayAnim)
            {
                //从当前半径到目标半径差值显示收缩动画
                float value = Mathf.SmoothDamp(m_CurrentRadius, m_Radius, ref _shrinkVelocity, _shrinkTime);
                if (!Mathf.Approximately(value, m_CurrentRadius))
                {
                    m_CurrentRadius = value;
                    m_Material.SetFloat("_Slider", m_CurrentRadius);
                }
            }
        }
    }
}