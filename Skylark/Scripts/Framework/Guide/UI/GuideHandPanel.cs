using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideHandPanel : AbstractPanel
    {
        [SerializeField]
        private Transform m_HandImage;
        [SerializeField]
        private Vector3 m_OffsetPos;

        private Vector3 m_OldPos = Vector3.zero;
        private Transform m_Target;

        protected override void OnPanelOpen(params object[] args)
        {
            if (args.Length == 0)
            {
                return;
            }

            m_Target = args[0] as Transform;

            if (args.Length > 1)
            {
                m_OffsetPos = (Vector3)args[1];
            }
        }

        private void Update()
        {
            if (m_Target == null)
            {
                return;
            }

            Vector3 pos = m_Target.position;
            if (pos.x != m_OldPos.x || pos.y != m_OldPos.y)
            {
                m_HandImage.position = pos;

            }
        }
    }
}