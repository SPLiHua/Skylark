using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class GuideTipPanel : AbstractPanel
    {
        [SerializeField]
        Text m_TipText;

        protected override void OnPanelOpen(params object[] args)
        {
            if (args != null)
            {
                m_TipText.text = (string)args[0];
            }
        }
    }
}