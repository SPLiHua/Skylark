using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public class UIClipPanel : AbstractPanel
    {
        Transform m_MaskTrans;
        Text m_TipText;

        protected override void OnPanelInit()
        {
            base.OnPanelInit();
            m_MaskTrans = transform.GetChild(0);
            m_TipText = GetComponentInChildren<Text>();
        }

        protected override void OnPanelOpen(params object[] args)
        {
            if (m_MaskTrans.GetComponent<BaseUIClip>())
            {
                GameObject.Destroy(m_MaskTrans.GetComponent<BaseUIClip>());
            }

            if (args != null)
            {
                Transform targetUI;
                UIClipCommand.UIClipType uiClipType;
                bool playAnim = false;
                float radius = 0;
                Vector2 offset = new Vector2(0, 0);
                string tip;
                if (args.Length > 1)
                {
                    targetUI = (Transform)args[0];
                    uiClipType = (UIClipCommand.UIClipType)args[1];


                    if (args.Length > 2)
                    {
                        int i = Utility.UtilityTable.String2Int((string)args[2]);

                        if (i == 0)
                        {
                            playAnim = false;
                        }
                        else
                        {
                            playAnim = true;
                        }
                    }
                    if (args.Length > 3)
                    {
                        radius = Utility.UtilityTable.String2Float((string)args[3]);
                    }
                    if (args.Length > 4)
                    {
                        offset = Utility.UtilityTable.String2Vector2((string)args[4], '|');
                    }

                    if (args.Length > 5)
                    {
                        tip = args[5].ToString();
                        m_TipText.gameObject.SetActive(true);
                        //m_TipText.transform.position = new Vector3(m_TipText.transform.position.x, targetUI.transform.position.y, 0);
                        m_TipText.text = tip;
                    }
                    else
                    {
                        m_TipText.gameObject.SetActive(false);
                    }

                    RectTransform rt = targetUI.GetComponent<RectTransform>();
                    Debug.Assert(rt != null, "Can't find RectTransform in this ui");

                    switch (uiClipType)
                    {
                        case UIClipCommand.UIClipType.Circle:
                            m_MaskTrans.gameObject.AddComponent<CircleClip>().RefreshMask(rt, playAnim, radius, offset);
                            break;
                        case UIClipCommand.UIClipType.Square:
                            m_MaskTrans.gameObject.AddComponent<SquareClip>().RefreshMask(rt, playAnim, radius, offset);
                            break;
                    }
                }
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