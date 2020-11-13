using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Skylark
{
    public class GamePlayMgr : Singleton<GamePlayMgr>
    {
        public void Init()
        {
            Physics.gravity = new Vector3(0, -35, 0);

        }
    }
}