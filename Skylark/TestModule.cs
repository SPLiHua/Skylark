using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class TestModule
    {
        public void TestTimer()
        {
            Timer.S.Post2Really((i) =>
            {
                Log.I("Timer Post2Really Dealy1 Repeat10:" + i);
            }, 1, 10);

            return;
            Timer.S.Post2Really((i) =>
            {
                Log.I("Timer Post2Really Dealy1 RepeatAlways:" + i);
            }, 1, -1);
        }

        ResLoader m_Loader;
        public void TestResLoader()
        {
            m_Loader = ResLoader.Allocate();
            m_Loader.Add2Load("Bench_A");
            m_Loader.LoadAsync(ResLoaderCallback);
            //GameObject go = m_Loader.LoadSync("Bench_A") as GameObject;
            //GameObject.Instantiate(go);

            //回收资源
            //m_Loader.Recycle2Cache();
        }

        private void ResLoaderCallback()
        {
            GameObject go = m_Loader.LoadSync("Bench_A") as GameObject;
            GameObject.Instantiate(go);
        }
    }
}