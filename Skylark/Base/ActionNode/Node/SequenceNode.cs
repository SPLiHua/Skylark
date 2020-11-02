using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class SequenceNode : NodeAction, INode
    {
        protected List<IAction> m_NodeList = new List<IAction>();
        protected List<IAction> m_ExecutingNodeList = new List<IAction>();

        public IAction CurrentExecutingNode
        {
            get
            {
                var currentNode = m_ExecutingNodeList[0];
                var node = currentNode as INode;
                return node == null ? currentNode : node.CurrentExecutingNode;
            }
        }

        public SequenceNode(params IAction[] nodes)
        {
            foreach (var node in nodes)
            {
                m_NodeList.Add(node);
                m_ExecutingNodeList.Add(node);
            }
        }

        public SequenceNode Append(IAction appendNode)
        {
            m_NodeList.Add(appendNode);
            m_ExecutingNodeList.Add(appendNode);
            return this;
        }

        protected override void OnExecute(float dt)
        {
            if (m_ExecutingNodeList.Count > 0)
            {
                if (m_ExecutingNodeList[0].Disposed && !m_ExecutingNodeList[0].Finished)
                {
                    Dispose();
                    return;
                }

                while (m_ExecutingNodeList[0].Execute(dt))
                {
                    m_ExecutingNodeList.RemoveAt(0);

                    if (m_ExecutingNodeList.Count == 0)
                    {
                        break;
                    }
                }
            }

            Finished = m_ExecutingNodeList.Count == 0;
        }

        protected override void OnReset()
        {
            m_ExecutingNodeList.Clear();
            foreach (var node in m_NodeList)
            {
                node.Reset();
                m_ExecutingNodeList.Add(node);
            }
        }

        protected override void OnDispose()
        {
            base.OnDispose();

            if (m_NodeList != null)
            {
                m_NodeList.ForEach(node => node.Dispose());
                m_NodeList.Clear();
                m_NodeList = null;
            }

            if (m_ExecutingNodeList != null)
            {
                m_ExecutingNodeList = null;
            }
        }
    }
}