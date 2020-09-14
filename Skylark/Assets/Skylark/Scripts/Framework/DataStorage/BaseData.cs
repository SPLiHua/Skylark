using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace Skylark
{
    [System.Serializable]
    public class BaseData : DataDirtyHandler, System.ICloneable
    {
        public virtual void InitWithEmptyData()
        {

        }

        public virtual void OnDataLoadFinish()
        {

        }

        public virtual void Clear()
        {

        }

        public virtual object Clone()
        {
            return null;
        }
    }
}