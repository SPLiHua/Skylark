using UnityEngine;
using System;

namespace Skylark
{
    public interface IInputer
    {
        bool isEnabled
        {
            get;
            set;
        }
        void RegisterKeyCodeMonitor(KeyCode keyCode, Action begin, Action end, Action press);
        void Release();
        void LateUpdate();
    }
}