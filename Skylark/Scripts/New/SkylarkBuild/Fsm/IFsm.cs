using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IFsm<T> where T : class
    {
        string Name
        {
            get;
        }

        string FullName
        {
            get;
        }

        T Owner
        {
            get;
        }

        int FsmStateCount
        {
            get;
        }

        bool IsRunning
        {
            get;
        }

        bool IsDestroyed
        {
            get;
        }

        FsmState<T> CurrentState
        {
            get;
        }

        float CurrentStateTime
        {
            get;
        }

        void Start<TState>(params object[] param) where TState : FsmState<T>;
        void Start(Type stateType, params object[] param);
        bool HasState<TState>() where TState : FsmState<T>;
        bool HasState(Type stateType);
        TState GetState<TState>() where TState : FsmState<T>;
        FsmState<T> GetState(Type stateType);
        FsmState<T>[] GetAllStates();
        void GetAllStates(List<FsmState<T>> results);
        bool HasData(string name);
        TData GetData<TData>(string name) where TData : Variable;
        void SetData<TData>(string name, TData data) where TData : Variable;
        void SetData(string name, Variable data);
        bool RemoveData(string name);
        void ChangeState<TState>(params object[] param) where TState : FsmState<T>;
        void ChangeState(Type stateType, params object[] param);
    }
}