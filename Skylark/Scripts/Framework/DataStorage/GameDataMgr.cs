using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GameDataMgr : Singleton<GameDataMgr>
    {
        public PlayerDataHandler m_PlayerDataHandler;

        public void Init()
        {
            m_PlayerDataHandler = new PlayerDataHandler();
            m_PlayerDataHandler.Init();
        }

    }

    public class PlayerDataHandler : JsonDataHandler<PlayerData>
    {

    }
}