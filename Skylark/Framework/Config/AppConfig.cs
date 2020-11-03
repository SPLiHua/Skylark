using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public enum ProjectMode
    {
        Game, Editor, Test,
    }

    public class AppConfig : ScriptableObject
    {
        private static AppConfig instance;
        public static AppConfig S
        {
            get
            {
                if (instance == null)
                {
                    instance = LoadInstance();
                }
                return instance;
            }
        }

        private static AppConfig LoadInstance()
        {
            ResLoader loader = ResLoader.Allocate();

            UnityEngine.Object obj = loader.LoadSync("Resources/Config/AppConfig");
            if (obj == null)
            {
                loader.Recycle2Cache();
                return null;
            }

            instance = obj as AppConfig;

            // // AppConfig newAB = GameObject.Instantiate(instance);

            // // instance = newAB;

            //loader.Recycle2Cache();

            //简易写法
            //instance = Resources.Load<AppConfig>("Config/AppConfig");

            return instance;
        }

        public void Init()
        {
            Log.Level = instance.m_LogLevel;
        }

        [SerializeField]
        public ProjectMode projectMode;
        [SerializeField]
        private LogLevel m_LogLevel = LogLevel.Max;
        [SerializeField]
        public string m_AppID;
    }
}