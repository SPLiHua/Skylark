using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GameDataMgr : Singleton<GameDataMgr>
    {
        public StageDataHandler m_StageDataHandler;
        public PlayerDataHandler m_PlayerDataHandler;


        public void Init()
        {
            m_StageDataHandler = new StageDataHandler();
            m_PlayerDataHandler = new PlayerDataHandler();
            m_PlayerDataHandler.Init();
        }

    }

    public class PlayerDataHandler : JsonDataHandler<PlayerData>
    {

    }

    //该数据读取需传入关卡index
    public class StageDataHandler : JsonDataHandler<StageData>
    {

    }
}