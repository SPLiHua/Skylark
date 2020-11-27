using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Skylark
{
    public interface IAction : IDisposable
    {
        bool Disposed { get; }
        bool Execute(float delta);
        void Reset();
        void Finish();
        bool Finished { get; }
    }
}