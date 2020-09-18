using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GameDataMgr : Singleton<GameDataMgr>
    {
        public StageDataHandler m_StageDataHandler;

        public void Init()
        {
            m_StageDataHandler = new StageDataHandler();
        }

    }

    public class GameDataHandler : JsonDataHandler<GameData>
    {

    }

    //该数据读取需传入关卡index
    public class StageDataHandler : JsonDataHandler<StageData>
    {

    }
}