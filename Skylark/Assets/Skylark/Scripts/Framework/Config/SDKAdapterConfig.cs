using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    [SerializeField]
    public class SDKAdapterConfig
    {
        public bool isEnable = true;
        public bool isDebugMode = false;
        public int Priority = 1;//越低优先级越高
        public virtual string adapterClassName
        {
            get { return ""; }
        }
    }
}