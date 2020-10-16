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

        private void Awake()
        {
            if (NormalRoot == null)
            {
                NormalRoot = transform.Find("NormalRoot");
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
                PopRoot = transform.Find("PopRoot");
                AbstractPanel[] panels = PopRoot.GetComponentsInChildren<AbstractPanel>();
                if (panels != null)
                {
                    for (int i = 0; i < panels.Length; i++)
                    {
                        panels[i].gameObject.SetActive(false);
                    }
                }
            }
        }
    }
}