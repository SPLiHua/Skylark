using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class MaskPanel : AbstractPanel
    {
        Image m_ImgBG;

        private void Awake()
        {
            m_ImgBG = GetComponent<Image>();
        }

        public override void OnPanelOpen(params object[] args)
        {
            if (args != null && args.Length > 2)
            {
                bool bPentrate = (bool)args[0];
                Color color = (Color)args[1];
                m_ImgBG.raycastTarget = bPentrate;
                m_ImgBG.color = color;
                transform.SetAsLastSibling();
            }
        }
    }
}