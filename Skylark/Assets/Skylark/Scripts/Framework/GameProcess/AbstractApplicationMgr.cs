using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AbstractApplicationMgr<T> : MonoSingleton<T> where T : MonoSingleton<T>
    {
        public Action onApplicationUpdate = null;
        public Action onApplicationOnGUI = null;

        protected void Start()
        {
            StartApp();
        }

        protected void StartApp()
        {
            InitThirdLibConfig();
            InitAppEnvironment();
            StartGame();
        }

        #region //子类实现
        protected virtual void InitThirdLibConfig()
        {

        }

        protected virtual void InitAppEnvironment()
        {

        }

        protected virtual void StartGame()
        {

        }
        #endregion

        void OnApplicationQuit()
        {
            EventSystem.S.Send(EngineEventID.OnApplicationQuit);
        }

        void OnApplicationPause(bool pauseStatus)
        {
            EventSystem.S.Send(EngineEventID.OnApplicationPauseChange, pauseStatus);
            EventSystem.S.Send(EngineEventID.OnAfterApplicationPauseChange, pauseStatus);
        }

        void OnApplicationFocus(bool focusStatus)
        {
            EventSystem.S.Send(EngineEventID.OnApplicationFocusChange, focusStatus);
            EventSystem.S.Send(EngineEventID.OnAfterApplicationFocusChange, focusStatus);
        }

        void Update()
        {
            if (onApplicationUpdate != null)
            {
                onApplicationUpdate();
            }
        }

        void OnGUI()
        {
            if (onApplicationOnGUI != null)
            {
                onApplicationOnGUI();
            }
        }
    }
}