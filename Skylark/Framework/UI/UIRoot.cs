using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class UIRoot : MonoBehaviour
    {
        [SerializeField]
        private Transform m_NormalRoot;
        [SerializeField]
        private Transform m_PopRoot;
        [SerializeField]
        private Camera m_UICamera;

        public Transform NormalRoot
        {
            get { return m_NormalRoot; }
            set { m_NormalRoot = value; }
        }

        public Transform PopRoot
        {
            get { return m_PopRoot; }
            set { m_PopRoot = value; }
        }

        public Camera UICamera
        {
            get { return m_UICamera; }
        }

        private int m_NormalPanelOrder = 10;
        private int m_PopPanelOrder = 10000000;

        public int RequireNextPanelSortingOrder(PanelShowMode showMode)
        {
            switch (showMode)
            {
                case PanelShowMode.Normal:
                    m_NormalPanelOrder += 10;
                    return m_NormalPanelOrder;
                case PanelShowMode.Pop:
                    m_PopPanelOrder += 10;
                    return m_PopPanelOrder;
                case PanelShowMode.HideOther:
                    return 0;
                default:
                    break;
            }

            return m_NormalPanelOrder;
        }

        private void Awake()
        {
            if (NormalRoot == null)
            {
                NormalRoot = transform.Find("Canvas/NormalRoot");
                AbstractPanel[] panels = NormalRoot.GetComponentsInChildren<AbstractPanel>();
                if (panels != null)
                {
                    for (int i = 0; i < panels.Length; i++)
                    {
                        panels[i].gameObject.SetActive(false);
                    }
                }
            }
            if (PopRoot == null)
            {
                PopRoot = transform.Find("Canvas/PopRoot");
                AbstractPanel[] panels = PopRoot.GetComponentsInChildren<AbstractPanel>();
                if (panels != null)
                {
                    for (int i = 0; i < panels.Length; i++)
                    {
                        panels[i].gameObject.SetActive(false);
                    }
                }
            }
            if (m_UICamera == null)
            {
                m_UICamera = transform.Find("UICamera").GetComponent<Camera>();
            }
        }
    }
}