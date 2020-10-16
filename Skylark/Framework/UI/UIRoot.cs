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