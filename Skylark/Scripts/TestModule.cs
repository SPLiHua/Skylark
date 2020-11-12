using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class TestModule : MonoBehaviour
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

        private void SequenceNodeWithEventAction()
        {
            SequenceNode m_SequenceNode = new SequenceNode();
            m_SequenceNode.Append(EventAction.Allocate(() => { Log.I(Time.time); }));
            m_SequenceNode.Append(EventAction.Allocate(() => { Log.I(Time.time); }));
            m_SequenceNode.Append(EventAction.Allocate(() => { Log.I(Time.time); }));
            m_SequenceNode.Append(EventAction.Allocate(() => { Log.I(Time.time); }));
            m_SequenceNode.Append(EventAction.Allocate(() => { Log.I(Time.time); }));
            this.ExecuteNode(m_SequenceNode);
        }

        private void SequenceNodeWithDelayAction()
        {
            SequenceNode m_SequenceNode = new SequenceNode();
            m_SequenceNode.Append(DelayAction.Allocate(1, () => Log.I(Time.time)));
            m_SequenceNode.Append(DelayAction.Allocate(1, () => Log.I(Time.time)));
            m_SequenceNode.Append(DelayAction.Allocate(1, () => Log.I(Time.time)));
            m_SequenceNode.Append(DelayAction.Allocate(1, () => Log.I(Time.time)));
            m_SequenceNode.Append(DelayAction.Allocate(1, () => Log.I(Time.time)));
            this.ExecuteNode(m_SequenceNode);
        }
    }
}