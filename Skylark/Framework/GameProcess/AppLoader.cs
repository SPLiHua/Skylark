using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AppLoader : MonoBehaviour
    {
        private void Awake()
        {
            Debug.LogFormat("Init[{0}]", ApplicationMgr.S.GetType().Name);
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.W))
            {
                GameStageMgr.S.Reset();
                GameStageMgr.S.CreateStage(3);
            }
        }
    }
}