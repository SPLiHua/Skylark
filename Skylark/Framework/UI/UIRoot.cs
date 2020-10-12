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
            }
            if (PopRoot == null)
            {
                PopRoot = transform.Find("PopRoot");
            }
        }
    }
}