using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace Skylark
{
    public class ResMgr : MonoSingleton<ResMgr>, IEnumeratorTaskMgr
    {
        private Dictionary<string, IRes> m_ResDictionary = new Dictionary<string, IRes>();
        private LinkedList<IEnumeratorTask> m_IEnumeratorTaskList = new LinkedList<IEnumeratorTask>();
        private List<IRes> m_ResList = new List<IRes>();
        private ResFactory m_ResFactory;
        //ResMgr定时收集列表中的Res然后删除
        private bool m_IsResMapDirty = false;

        public void Init()
        {
            m_ResFactory = new ResFactory();
            InitABTable();
        }

        private void InitABTable()
        {
            AssetDataTable.S.Reset();
            List<string> outResult = new List<string>();

            //不考虑外存的情况下
            FileMgr.S.GetFileInInner(ProjectPathConfig.abConfigfileName, outResult);
            for (int i = 0; i < outResult.Count; ++i)
            {
                AssetDataTable.S.LoadPackageFromFile(outResult[i]);
            }
        }

        #region //资源获取与释放逻辑
        public IRes GetRes(string name, bool createNew = false)
        {
            IRes res = null;
            if (m_ResDictionary.TryGetValue(name, out res))
            {
                return res;
            }
            if (!createNew)
            {
                return null;
            }

            res = m_ResFactory.Create(name);

            if (res != null)
            {
                m_ResDictionary.Add(name, res);
                m_ResList.Add(res);

            }
            return res;
        }

        public R GetRes<R>(string name) where R : IRes
        {
            IRes res = null;
            if (m_ResDictionary.TryGetValue(name, out res))
            {
                return (R)res;
            }
            return default(R);
        }

        public R GetAsset<R>(string name) where R : UnityEngine.Object
        {
            IRes res = null;
            if (m_ResDictionary.TryGetValue(name, out res))
            {
                return res.Asset as R;
            }
            return null;
        }

        public void PostIEnumeratorTask(IEnumeratorTask task)
        {
            if (task == null)
            {
                return;
            }

            m_IEnumeratorTaskList.AddLast(task);
            TryStartNextIEnumeratorTask();
        }

        private void TryStartNextIEnumeratorTask()
        {
            if (m_IEnumeratorTaskList.Count == 0)
            {
                return;
            }

            IEnumeratorTask task = m_IEnumeratorTaskList.First.Value;
            m_IEnumeratorTaskList.RemoveFirst();

            StartCoroutine(task.StartIEnumeratorTask(TryStartNextIEnumeratorTask));
        }

        private void RemoveUnusedRes()
        {
            if (!m_IsResMapDirty)
            {
                return;
            }

            IRes res = null;
            for (int i = m_ResList.Count - 1; i >= 0; --i)
            {
                res = m_ResList[i];
                if (res.refCount <= 0 && res.State != ResState.Loading)
                {
                    if (res.ReleaseRes())
                    {
                        m_ResList.RemoveAt(i);
                        m_ResDictionary.Remove(res.AssetName);
                        res.Recycle2Cache();
                    }
                }
            }

            m_IsResMapDirty = false;
        }

        public void SetResMapDirty()
        {
            m_IsResMapDirty = true;
        }

        private void Update()
        {
            if (m_IsResMapDirty)
            {
                RemoveUnusedRes();
            }
        }
        #endregion
    }
}