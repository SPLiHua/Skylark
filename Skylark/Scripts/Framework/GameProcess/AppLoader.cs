using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AppLoader : MonoBehaviour
    {
        private void Awake()
        {
            Log.I("Init[{0}]", ApplicationMgr.S.GetType().Name);
        }
    }
}