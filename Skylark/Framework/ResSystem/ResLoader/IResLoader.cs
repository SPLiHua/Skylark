using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IResLoader
    {
        bool Add2Load(string name, Action<bool, IRes> listener, bool lastOrder = true);
        void ReleaseAllRes();
        void UnloadImage(bool flag);
    }
}