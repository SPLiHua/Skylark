using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface ITypeEventSystem
    {
        bool RegisterEvent<T>(Action<T> fun);
        void UnRegisterEvent<T>(Action<T> fun);
        void SendEvent<T>() where T : new();
        void SendEvent<T>(T t);
        void Clear();
    }

    public class TypeEventSystem : ITypeEventSystem
    {
        interface IListenWrap : IDisposable
        {

        }

        private class ListenWrap<T> : IListenWrap
        {
            //委托可一对多注册
            public Action<T> OnReceives = obj => { };

            public void Dispose()
            {
                OnReceives = null;
            }
        }

        //全局注册事件
        private static readonly ITypeEventSystem m_GlobalEventSystem = new TypeEventSystem();
        private Dictionary<Type, IListenWrap> m_TypeEventDict = new Dictionary<Type, IListenWrap>();

        public static bool Register<T>(Action<T> fun)
        {
            return m_GlobalEventSystem.RegisterEvent<T>(fun);
        }

        public static void UnRegister<T>(Action<T> fun)
        {
            m_GlobalEventSystem.UnRegisterEvent<T>(fun);
        }

        public static void Send<T>(T t)
        {
            m_GlobalEventSystem.SendEvent<T>(t);
        }

        public static void Send<T>() where T : new()
        {
            m_GlobalEventSystem.SendEvent<T>();
        }

        public bool RegisterEvent<T>(Action<T> fun)
        {
            var type = typeof(T);
            IListenWrap listenWrap = null;
            if (m_TypeEventDict.TryGetValue(type, out listenWrap))
            {
                var reg = listenWrap as ListenWrap<T>;
                reg.OnReceives += fun;
            }
            else
            {
                var reg = new ListenWrap<T>();
                reg.OnReceives += fun;
                m_TypeEventDict.Add(type, reg);
            }
            return false;
        }

        public void UnRegisterEvent<T>(Action<T> fun)
        {
            var type = typeof(T);
            IListenWrap listenWrap = null;
            if (m_TypeEventDict.TryGetValue(type, out listenWrap))
            {
                var reg = listenWrap as ListenWrap<T>;
                reg.OnReceives -= fun;
            }
        }

        public void SendEvent<T>() where T : new()
        {
            var type = typeof(T);
            IListenWrap listenWrap = null;
            if (m_TypeEventDict.TryGetValue(type, out listenWrap))
            {
                var reg = listenWrap as ListenWrap<T>;
                reg.OnReceives(new T());
            }
        }

        public void SendEvent<T>(T t)
        {
            var type = typeof(T);
            IListenWrap listenWrap = null;
            if (m_TypeEventDict.TryGetValue(type, out listenWrap))
            {
                var reg = listenWrap as ListenWrap<T>;
                reg.OnReceives(t);
            }
        }

        public void Clear()
        {
            foreach (var keyValuePair in m_TypeEventDict)
            {
                keyValuePair.Value.Dispose();
            }

            m_TypeEventDict.Clear();
        }
    }
}