using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class UIClipPanel : AbstractPanel
    {
        Transform m_MaskTrans;

        protected override void OnPanelInit()
        {
            base.OnPanelInit();
            m_MaskTrans = transform.GetChild(0);
        }

        protected override void OnPanelOpen(params object[] param)
        {
            if (m_MaskTrans.GetComponent<BaseUIClip>())
            {
                GameObject.Destroy(m_MaskTrans.GetComponent<BaseUIClip>());
            }

            if (param != null)
            {
                Transform targetUI = null;
                // UIClipCommand.UIClipType uiClipType;
                // bool playAnim = false;
                // float radius = 0;
                Vector2 offset = new Vector2(0, 0);
                if (param.Length > 0)
                {
                    IUINodeFinder Finder = param[0] as IUINodeFinder;
                    targetUI = Finder.FindNode(false);
                }
                // if (param.Length > 1)
                // {
                //     string str = param[1].ToString();
                //     uiClipType = (UIClipCommand.UIClipType)Enum.Parse(typeof(UIClipCommand.UIClipType), str);
                // }
                // if (param.Length > 2)
                // {
                //     int i = Utility.UtilityTable.String2Int((string)param[2]);

                //     if (i == 0)
                //     {
                //         playAnim = false;
                //     }
                //     else
                //     {
                //         playAnim = true;
                //     }
                // }
                // if (param.Length > 3)
                // {
                //     radius = Utility.UtilityTable.String2Float((string)param[3]);
                // }
                // if (param.Length > 4)
                // {
                //     offset = Utility.UtilityTable.String2Vector2((string)param[4], '|');
                // }

                RectTransform rt = targetUI.GetComponent<RectTransform>();
                Debug.Assert(rt != null, "Can't find RectTransform in this ui");

                m_MaskTrans.gameObject.AddComponent<SquareClip>().RefreshMask(rt, false, 0, offset);

                // switch (uiClipType)
                // {
                //     case UIClipCommand.UIClipType.Circle:
                //         m_MaskTrans.gameObject.AddComponent<CircleClip>().RefreshMask(rt, false, 0, offset);
                //         break;
                //     case UIClipCommand.UIClipType.Square:
                //         m_MaskTrans.gameObject.AddComponent<SquareClip>().RefreshMask(rt, false, 0, offset);
                //         break;
                // }
            }
        }

        protected override void OnPanelClose()
        {
            if (m_MaskTrans.GetComponent<BaseUIClip>())
            {
                GameObject.Destroy(m_MaskTrans.GetComponent<BaseUIClip>());
            }
        }
    }
}