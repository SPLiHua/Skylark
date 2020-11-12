using System;

namespace Skylark
{
    public class EventAction : NodeAction
    {
        private Action m_OnExecuteEvent;

        public static EventAction Allocate(params Action[] onExecuteEvents)
        {
            EventAction node = ObjectPool<EventAction>.S.Allocate();
            Array.ForEach(onExecuteEvents, onExecuteEvent => node.m_OnExecuteEvent += onExecuteEvent);
            return node;
        }

        protected override void OnExecute(float dt)
        {
            if (m_OnExecuteEvent != null)
            {
                m_OnExecuteEvent.Invoke();
            }

            Finished = true;
        }

        protected override void OnReset()
        {
            m_OnExecuteEvent = null;
        }

        public override void Recycle2Cache()
        {
            ObjectPool<EventAction>.S.Recycle(this);
        }
    }
}