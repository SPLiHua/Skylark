using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class SpawnNode : NodeAction
    {
        public List<NodeAction> m_NodeList = new List<NodeAction>();

        public SpawnNode(params NodeAction[] nodes)
        {
            m_NodeList.AddRange(nodes);

            foreach (var nodeAction in nodes)
            {
                nodeAction.OnEndedCallback += IncreaseFinishCount;
            }
        }

        public SpawnNode Append(params NodeAction[] nodes)
        {
            m_NodeList.AddRange(nodes);

            foreach (var nodeAction in nodes)
            {
                nodeAction.OnEndedCallback += IncreaseFinishCount;
            }
            return this;
        }

        protected override void OnExecute(float dt)
        {
            for (var i = m_NodeList.Count - 1; i >= 0; i--)
            {
                var node = m_NodeList[i];
                if (!node.Finished && node.Execute(dt))
                    Finished = m_NodeList.Count == m_FinishCount;
            }
        }

        private int m_FinishCount = 0;
        private void IncreaseFinishCount()
        {
            m_FinishCount++;
        }

        protected override void OnReset()
        {
            m_NodeList.ForEach(node => node.Reset());
            m_FinishCount = 0;
        }

        public override void Finish()
        {
            for (var i = m_NodeList.Count - 1; i >= 0; i--)
            {
                m_NodeList[i].Finish();
            }

            base.Finish();
        }

        protected override void OnDispose()
        {
            foreach (var node in m_NodeList)
            {
                node.OnEndedCallback -= IncreaseFinishCount;
                node.Dispose();
            }

            m_NodeList = null;
        }
    }
}