using System;

namespace Skylark
{
    public class TableAction : NodeAction
    {
        static TableModule m_TableModule;
        public static TableAction Allocate()
        {
            TableAction node = new TableAction();
            m_TableModule = new TableModule();
            m_TableModule.Init();
            return node;
        }

        protected override void OnExecute(float dt)
        {
            Finished = m_TableModule.isTableLoadFinish;
        }

        protected override void OnReset()
        {

        }

        public override void Recycle2Cache()
        {

        }
    }
}

