using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

namespace Skylark
{
    public interface ISingleton
    {
        void OnSingletonInit();
    }

    public abstract class Singleton<T> : ISingleton where T : Singleton<T>, new()
    {
        protected static T m_Instance;
        static object m_Lock = new object();
        public static T S
        {
            get
            {
                lock (m_Lock)
                {
                    if (m_Instance == null)
                    {
                        {
                            m_Instance = SingletonCreator.CreateSingleton<T>();
                        }
                    }
                    return m_Instance;
                }
            }
        }

        public virtual void OnSingletonInit()
        {

        }

        public virtual void Dispose()
        {
            m_Instance = null;
        }
    }

    public static class SingletonCreator
    {
        public static T CreateSingleton<T>() where T : class, ISingleton
        {
            // 获取私有构造函数
            var ctors = typeof(T).GetConstructors(BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);

            // 获取无参构造函数
            var ctor = Array.Find(ctors, c => c.GetParameters().Length == 0);

            if (ctor == null)
            {
                throw new Exception("Non-Public Constructor() not found! in " + typeof(T));
            }

            // 通过构造函数，常见实例
            var retInstance = ctor.Invoke(null) as T;
            retInstance.OnSingletonInit();

            return retInstance;
        }
    }

    public abstract class MonoSingleton<T> : MonoBehaviour, ISingleton where T : MonoSingleton<T>
    {
        protected static T m_Instance;
        protected static bool mOnApplicationQuit = false;

        public static T S
        {
            get
            {
                if (m_Instance == null && !mOnApplicationQuit)
                {
                    m_Instance = MonoSingletonCreator.CreateMonoSingleton<T>();
                }

                return m_Instance;
            }
        }

        public virtual void OnSingletonInit()
        {

        }

        public virtual void Dispose()
        {
            Destroy(gameObject);
            m_Instance = null;
        }
    }

    public static class MonoSingletonCreator
    {
        public static T CreateMonoSingleton<T>() where T : MonoBehaviour, ISingleton
        {
            T instance = null;

            instance = UnityEngine.Object.FindObjectOfType<T>();
            if (instance == null)
            {
                //该写法意义不大
                // System.Reflection.MemberInfo info = typeof(T);
                // object[] attributes = info.GetCustomAttributes(true);
                // foreach (var atribute in attributes)
                // {
                //     TMonoSingletonAttribute defineAttri = atribute as TMonoSingletonAttribute;
                //     if (defineAttri == null)
                //     {
                //         continue;
                //     }
                //     instance = CreateComponentOnGameObject<T>(defineAttri.AbsolutePath, true);

                //     break;
                // }

                // if (instance == null)
                {
                    GameObject obj = new GameObject("Singleton of " + typeof(T).Name);
                    UnityEngine.Object.DontDestroyOnLoad(obj);
                    instance = obj.AddComponent<T>();
                }
            }
            instance.OnSingletonInit();
            return instance;
        }

        private static T CreateComponentOnGameObject<T>(string path, bool dontDestroy) where T : MonoBehaviour
        {
            return null;
        }
    }

    [AttributeUsage(AttributeTargets.Class)]
    public class TMonoSingletonAttribute : System.Attribute
    {
        private string m_AbsolutePath;

        public TMonoSingletonAttribute(string relativePath)
        {
            m_AbsolutePath = relativePath;
        }

        public string AbsolutePath
        {
            get { return m_AbsolutePath; }
        }
    }
}

