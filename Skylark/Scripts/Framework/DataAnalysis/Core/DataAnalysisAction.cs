using System;

namespace Skylark
{
    public class DataAnalysisAction : NodeAction
    {
        public static DataAnalysisAction Allocate()
        {
            DataAnalysisAction node = new DataAnalysisAction();
            DataAnalysisMgr.S.Init();
            return node;
        }

        protected override void OnExecute(float dt)
        {
            Finished = DataAnalysisMgr.S.m_IsLoadFinish;
        }

        protected override void OnReset()
        {

        }

        public override void Recycle2Cache()
        {

        }
    }
}

