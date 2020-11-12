using System.Collections;
using System.Collections.Generic;
using System;

namespace Skylark
{
    public class FsmManager : IFsmManager
    {
        private readonly Dictionary<TypeNamePair, FsmBase> m_FsmMap;
        private readonly List<FsmBase> m_TempFsmList;

        public FsmManager()
        {
            m_FsmMap = new Dictionary<TypeNamePair, FsmBase>();
            m_TempFsmList = new List<FsmBase>();
        }

        public int Count
        {
            get
            {
                return m_TempFsmList.Count;
            }
        }

        public void Update(float elapseSeconds, float realElapseSeconds)
        {
            m_TempFsmList.Clear();
            if (m_FsmMap.Count <= 0)
            {
                return;
            }

            foreach (KeyValuePair<TypeNamePair, FsmBase> fsm in m_FsmMap)
            {
                m_TempFsmList.Add(fsm.Value);
            }

            foreach (FsmBase fsm in m_TempFsmList)
            {
                if (fsm.IsDestroyed)
                {
                    continue;
                }

                fsm.Update(elapseSeconds, realElapseSeconds);
            }
        }

        internal void Shutdown()
        {
            foreach (KeyValuePair<TypeNamePair, FsmBase> fsm in m_FsmMap)
            {
                fsm.Value.Shutdown();
            }

            m_FsmMap.Clear();
            m_TempFsmList.Clear();
        }

        public bool HasFsm<T>() where T : class
        {
            return InternalHasFsm(new TypeNamePair(typeof(T)));
        }

        public bool HasFsm(Type ownerType)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalHasFsm(new TypeNamePair(ownerType));
        }

        public bool HasFsm<T>(string name) where T : class
        {
            return InternalHasFsm(new TypeNamePair(typeof(T), name));
        }

        public bool HasFsm(Type ownerType, string name)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalHasFsm(new TypeNamePair(ownerType, name));
        }

        public IFsm<T> GetFsm<T>() where T : class
        {
            return (IFsm<T>)InternalGetFsm(new TypeNamePair(typeof(T)));
        }

        public FsmBase GetFsm(Type ownerType)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalGetFsm(new TypeNamePair(ownerType));
        }

        public IFsm<T> GetFsm<T>(string name) where T : class
        {
            return (IFsm<T>)InternalGetFsm(new TypeNamePair(typeof(T), name));
        }

        public FsmBase GetFsm(Type ownerType, string name)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalGetFsm(new TypeNamePair(ownerType, name));
        }

        public FsmBase[] GetAllFsms()
        {
            int index = 0;
            FsmBase[] results = new FsmBase[m_FsmMap.Count];
            foreach (KeyValuePair<TypeNamePair, FsmBase> fsm in m_FsmMap)
            {
                results[index++] = fsm.Value;
            }

            return results;
        }

        public void GetAllFsms(List<FsmBase> results)
        {
            if (results == null)
            {
                throw new Exception("Results is invalid.");
            }

            results.Clear();
            foreach (KeyValuePair<TypeNamePair, FsmBase> fsm in m_FsmMap)
            {
                results.Add(fsm.Value);
            }
        }

        public IFsm<T> CreateFsm<T>(T owner, params FsmState<T>[] states) where T : class
        {
            return CreateFsm(string.Empty, owner, states);
        }

        public IFsm<T> CreateFsm<T>(string name, T owner, params FsmState<T>[] states) where T : class
        {
            TypeNamePair typeNamePair = new TypeNamePair(typeof(T), name);
            if (HasFsm<T>(name))
            {
                throw new Exception(string.Format("Already exist FSM '{0}'.", typeNamePair.ToString()));
            }

            Fsm<T> fsm = Fsm<T>.Create(name, owner, states);
            m_FsmMap.Add(typeNamePair, fsm);
            return fsm;
        }

        public IFsm<T> CreateFsm<T>(T owner, List<FsmState<T>> states) where T : class
        {
            return CreateFsm(string.Empty, owner, states);
        }

        public IFsm<T> CreateFsm<T>(string name, T owner, List<FsmState<T>> states) where T : class
        {
            TypeNamePair typeNamePair = new TypeNamePair(typeof(T), name);
            if (HasFsm<T>(name))
            {
                throw new Exception(string.Format("Already exist FSM '{0}'.", typeNamePair));
            }

            Fsm<T> fsm = Fsm<T>.Create(name, owner, states);
            m_FsmMap.Add(typeNamePair, fsm);
            return fsm;
        }

        public bool DestroyFsm<T>() where T : class
        {
            return InternalDestroyFsm(new TypeNamePair(typeof(T)));
        }

        public bool DestroyFsm(Type ownerType)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalDestroyFsm(new TypeNamePair(ownerType));
        }

        public bool DestroyFsm<T>(string name) where T : class
        {
            return InternalDestroyFsm(new TypeNamePair(typeof(T), name));
        }

        public bool DestroyFsm(Type ownerType, string name)
        {
            if (ownerType == null)
            {
                throw new Exception("Owner type is invalid.");
            }

            return InternalDestroyFsm(new TypeNamePair(ownerType, name));
        }

        public bool DestroyFsm<T>(IFsm<T> fsm) where T : class
        {
            if (fsm == null)
            {
                throw new Exception("FSM is invalid.");
            }

            return InternalDestroyFsm(new TypeNamePair(typeof(T), fsm.Name));
        }

        public bool DestroyFsm(FsmBase fsm)
        {
            if (fsm == null)
            {
                throw new Exception("FSM is invalid.");
            }

            return InternalDestroyFsm(new TypeNamePair(fsm.OwnerType, fsm.Name));
        }

        private bool InternalHasFsm(TypeNamePair typeNamePair)
        {
            return m_FsmMap.ContainsKey(typeNamePair);
        }

        private FsmBase InternalGetFsm(TypeNamePair typeNamePair)
        {
            FsmBase fsm = null;
            if (m_FsmMap.TryGetValue(typeNamePair, out fsm))
            {
                return fsm;
            }

            return null;
        }

        private bool InternalDestroyFsm(TypeNamePair typeNamePair)
        {
            FsmBase fsm = null;
            if (m_FsmMap.TryGetValue(typeNamePair, out fsm))
            {
                fsm.Shutdown();
                return m_FsmMap.Remove(typeNamePair);
            }

            return false;
        }
    }
}

