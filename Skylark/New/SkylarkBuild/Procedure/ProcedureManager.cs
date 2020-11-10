using System;

namespace Skylark
{
    public class ProcedureManager : AbstractModule, IProcedureManager
    {
        private IFsmManager m_FsmManager;
        private IFsm<IProcedureManager> m_ProcedureFsm;

        public ProcedureManager()
        {
            m_FsmManager = null;
            m_ProcedureFsm = null;
        }

        internal override int Priority
        {
            get
            {
                return 10;
            }
        }

        public ProcedureBase CurrentProcedure
        {
            get
            {
                if (m_ProcedureFsm == null)
                {
                    throw new Exception("You must initialize procedure first.");
                }

                return (ProcedureBase)m_ProcedureFsm.CurrentState;
            }
        }

        public float CurrentProcedureTime
        {
            get
            {
                if (m_ProcedureFsm == null)
                {
                    throw new Exception("You must initialize procedure first.");
                }

                return m_ProcedureFsm.CurrentStateTime;
            }
        }

        internal override void OnInit()
        {
            m_FsmManager = null;
            m_ProcedureFsm = null;
            //Initialize(new Fsm<IProcedureManager>());
        }

        internal override void Update(float elapseSeconds, float realElapseSeconds)
        {
        }

        internal override void Shutdown()
        {
            if (m_FsmManager != null)
            {
                if (m_ProcedureFsm != null)
                {
                    m_FsmManager.DestroyFsm(m_ProcedureFsm);
                    m_ProcedureFsm = null;
                }

                m_FsmManager = null;
            }
        }

        public void Initialize(IFsmManager fsmManager, params ProcedureBase[] procedures)
        {
            if (fsmManager == null)
            {
                throw new Exception("FSM manager is invalid.");
            }

            m_FsmManager = fsmManager;
            m_ProcedureFsm = m_FsmManager.CreateFsm(this, procedures);
        }

        public void StartProcedure<T>() where T : ProcedureBase
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            m_ProcedureFsm.Start<T>();
        }

        public void StartProcedure(Type procedureType)
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            m_ProcedureFsm.Start(procedureType);
        }

        public bool HasProcedure<T>() where T : ProcedureBase
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            return m_ProcedureFsm.HasState<T>();
        }

        public bool HasProcedure(Type procedureType)
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            return m_ProcedureFsm.HasState(procedureType);
        }

        public ProcedureBase GetProcedure<T>() where T : ProcedureBase
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            return m_ProcedureFsm.GetState<T>();
        }

        public ProcedureBase GetProcedure(Type procedureType)
        {
            if (m_ProcedureFsm == null)
            {
                throw new Exception("You must initialize procedure first.");
            }

            return (ProcedureBase)m_ProcedureFsm.GetState(procedureType);
        }
    }
}