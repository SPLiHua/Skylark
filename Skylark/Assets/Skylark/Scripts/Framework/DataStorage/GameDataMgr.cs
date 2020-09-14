using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GameDataMgr : Singleton<GameDataMgr>
    {
        // public PlayerDataHandler playerDataHandler;
        // public SignDataHandler signDataHandler;
        public void Init()
        {
            // playerDataHandler = new PlayerDataHandler();
            // signDataHandler = new SignDataHandler();
            // playerDataHandler.Init();
            // signDataHandler.Init();
            // Debug.Log("GameDataMgr Init:" + PlayerDataHandler.Data.m_PlayerName);
            // // PlayerDataHandler.Data.Rename("Test1");
            // // Debug.Log(PlayerDataHandler.Data.m_PlayerName);
        }
    }

    // public class PlayerDataHandler : JsonDataHandler<PlayerData>
    // {

    // }

    // public class SignDataHandler : JsonDataHandler<SignData>
    // {

    // }
}