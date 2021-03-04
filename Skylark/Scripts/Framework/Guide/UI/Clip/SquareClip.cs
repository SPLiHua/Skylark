using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class SquareClip : BaseUIClip
    {
        /// <summary>
        /// 播放动画
        /// </summary>
        private bool m_PlayAnim;

        /// <summary>
        /// 最终的偏移值X
        /// </summary>
        private float _targetOffsetX = 0f;

        /// <summary>
        /// 最终的偏移值Y
        /// </summary>
        private float _targetOffsetY = 0f;

        /// <summary>
        /// 遮罩材质
        /// </summary>
        private Material m_Material;

        /// <summary>
        /// 当前的偏移值X
        /// </summary>
        private float _currentOffsetX = 0f;

        /// <summary>
        /// 当前的偏移值Y
        /// </summary>
        private float _currentOffsetY = 0f;

        /// <summary>
        /// 动画收缩时间
        /// </summary>
        private float _shrinkTime = 0.2f;

        public override void RefreshMask(RectTransform target, bool playAnim, float radius, Vector2 offset)
        {
            Canvas canvas = transform.parent.GetComponent<Canvas>();

            //获取高亮区域四个顶点的世界坐标
            Vector3[] _corners = new Vector3[4];
            target.GetWorldCorners(_corners);

            for (int i = 0; i < _corners.Length; i++)
            {
                _corners[i] = UIMgr.S.m_UIRoot.UICamera.WorldToScreenPoint(_corners[i]);
            }

            //计算高亮显示区域咋画布中的范围
            _targetOffsetX = Vector2.Distance(WorldToCanvasPos(canvas, _corners[0]), WorldToCanvasPos(canvas, _corners[3])) / 2f;
            _targetOffsetY = Vector2.Distance(WorldToCanvasPos(canvas, _corners[0]), WorldToCanvasPos(canvas, _corners[1])) / 2f;
            //计算高亮显示区域的中心
            float x = _corners[0].x + ((_corners[3].x - _corners[0].x) / 2f);
            float y = _corners[0].y + ((_corners[1].y - _corners[0].y) / 2f);
            Vector3 centerWorld = new Vector3(x, y, 0);
            Vector2 center = WorldToCanvasPos(canvas, centerWorld);
            //设置遮罩材料中中心变量
            Vector4 centerMat = new Vector4(center.x, center.y, 0, 0);
            centerMat += new Vector4(offset.x, offset.y, 0, 0);
            m_Material = new Material(Shader.Find("UIClip/Square"));
            GetComponent<Image>().material = m_Material;
            m_Material.SetVector("_Center", centerMat);

            m_PlayAnim = playAnim;
            if (m_PlayAnim)
            {
                //计算当前偏移的初始值
                RectTransform canvasRectTransform = (canvas.transform as RectTransform);
                if (canvasRectTransform != null)
                {
                    //获取画布区域的四个顶点
                    canvasRectTransform.GetWorldCorners(_corners);
                    //求偏移初始值
                    for (int i = 0; i < _corners.Length; i++)
                    {
                        if (i % 2 == 0)
                            _currentOffsetX = Mathf.Max(Vector3.Distance(WorldToCanvasPos(canvas, _corners[i]), center), _currentOffsetX);
                        else
                            _currentOffsetY = Mathf.Max(Vector3.Distance(WorldToCanvasPos(canvas, _corners[i]), center), _currentOffsetY);
                    }
                }
                //设置遮罩材质中当前偏移的变量
                m_Material.SetFloat("_SliderX", _currentOffsetX);
                m_Material.SetFloat("_SliderY", _currentOffsetY);
            }
            else
            {
                m_Material.SetFloat("_SliderX", _targetOffsetX);
                m_Material.SetFloat("_SliderY", _targetOffsetY);
            }
        }

        private float _shrinkVelocityX = 0f;
        private float _shrinkVelocityY = 0f;

        private void Update()
        {
            if (m_PlayAnim)
            {
                //从当前偏移值到目标偏移值差值显示收缩动画
                float valueX = Mathf.SmoothDamp(_currentOffsetX, _targetOffsetX, ref _shrinkVelocityX, _shrinkTime);
                float valueY = Mathf.SmoothDamp(_currentOffsetY, _targetOffsetY, ref _shrinkVelocityY, _shrinkTime);
                if (!Mathf.Approximately(valueX, _currentOffsetX))
                {
                    _currentOffsetX = valueX;
                    m_Material.SetFloat("_SliderX", _currentOffsetX);
                }

                if (!Mathf.Approximately(valueY, _currentOffsetY))
                {
                    _currentOffsetY = valueY;
                    m_Material.SetFloat("_SliderY", _currentOffsetY);
                }
            }
        }
    }
}