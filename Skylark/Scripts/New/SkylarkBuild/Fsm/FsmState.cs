using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public abstract class FsmState<T> where T : class
    {
        protected internal IFsm<T> m_Fsm;

        public FsmState()
        {

        }

        protected internal virtual void OnInit(IFsm<T> fsm)
        {
            m_Fsm = fsm;
        }

        protected internal virtual void OnEnter(params object[] param)
        {
        }

        /// <summary>
        /// 有限状态机状态轮询时调用。
        /// </summary>
        /// <param name="fsm">有限状态机引用。</param>
        /// <param name="elapseSeconds">逻辑流逝时间，以秒为单位。</param>
        /// <param name="realElapseSeconds">真实流逝时间，以秒为单位。</param>
        protected internal virtual void OnUpdate(float elapseSeconds, float realElapseSeconds)
        {
        }

        protected internal virtual void OnLeave(bool isShutdown)
        {
        }

        protected internal virtual void OnDestroy()
        {
        }

        protected void ChangeState<TState>(params object[] param) where TState : FsmState<T>
        {
            if (m_Fsm == null)
            {
                throw new Exception("FSM is invalid.");
            }

            m_Fsm.ChangeState<TState>(param);
        }

        protected void ChangeState(Type stateType, params object[] param)
        {
            if (m_Fsm == null)
            {
                throw new Exception("FSM is invalid.");
            }

            if (stateType == null)
            {
                throw new Exception("State type is invalid.");
            }

            if (!typeof(FsmState<T>).IsAssignableFrom(stateType))
            {
                throw new Exception(string.Format("State type '{0}' is invalid.", stateType.FullName));
            }

            m_Fsm.ChangeState(stateType, param);
        }
    }
}