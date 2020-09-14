using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ResLoader : IResLoader, ICacheAble, ICacheType
    {
        private bool m_CacheFlag = false;
        private int m_LoadingCount = 0;
        private LinkedList<IRes> m_WaitLoadList = new LinkedList<IRes>();
        private List<IRes> m_ResList = new List<IRes>();

        private Action m_Listener;
        public static ResLoader Allocate()
        {
            ResLoader loader = ObjectPool<ResLoader>.S.Allocate();
            return loader;
        }

        public void Recycle2Cache()
        {
            ObjectPool<ResLoader>.S.Recycle(this);
        }


        public float progress
        {
            get
            {
                //todo 
                return 0;
            }
        }

        public bool cacheFlag
        {
            get { return m_CacheFlag; }
            set { m_CacheFlag = value; }
        }

        public ResLoader()
        {

        }

        #region //Add2Load
        public bool Add2Load(string name, Action<bool, IRes> listener = null, bool lastOrder = true)
        {
            if (string.IsNullOrEmpty(name))
            {
                return false;
            }
            IRes res = FindResInList(m_ResList, name);
            if (res != null)
            {
                if (listener != null)
                {
                    res.RegisteOnResLoadDoneEvent(listener);
                }
                return true;
            }
            res = ResMgr.S.GetRes(name, true);
            if (res == null)
            {
                return false;
            }

            if (listener != null)
            {
                res.RegisteOnResLoadDoneEvent(listener);
            }

            //无论该资源是否加载完成，都需要添加对该资源依赖的引用
            string[] depends = res.GetDependResList();
            if (depends != null)
            {
                for (int i = 0; i < depends.Length; ++i)
                {
                    Add2Load(depends[i]);
                }
            }

            AddRes2List(res, lastOrder);
            return true;
        }

        public void Add2Load(List<String> list)
        {
            if (list == null)
                return;

            for (int i = list.Count - 1; i >= 0; --i)
            {
                Add2Load(list[i]);
            }
        }

        public void Add2Load(string[] list)
        {
            if (list == null)
            {
                return;
            }

            for (int i = list.Length - 1; i >= 0; --i)
            {
                Add2Load(list[i]);
            }
        }

        private static IRes FindResInList(List<IRes> list, string name)
        {
            if (list == null)
            {
                return null;
            }

            for (int i = list.Count - 1; i >= 0; --i)
            {
                if (list[i].AssetName.Equals(name))
                {
                    return list[i];
                }
            }

            return null;
        }

        private void AddRes2List(IRes res, bool lastOrder)
        {
            IRes oldRes = FindResInList(m_ResList, res.AssetName);
            if (oldRes != null)
                return;

            res.AddRef();
            m_ResList.Add(res);

            if (res.State != ResState.Ready)
            {
                ++m_LoadingCount;
                if (lastOrder)
                {
                    m_WaitLoadList.AddLast(res);
                }
                else
                {
                    m_WaitLoadList.AddFirst(res);
                }
            }
        }
        #endregion

        #region //LoadSync&&LoadAsync
        public UnityEngine.Object LoadSync(string name)
        {
            Add2Load(name);
            LoadWaitLoadListSync();

            IRes res = ResMgr.S.GetRes(name, false);
            if (res == null)
            {
                return null;
            }
            return res.Asset;
        }

        //加载loader持有的res对象内部的具体资源
        private void LoadWaitLoadListSync()
        {
            while (m_WaitLoadList.Count > 0)
            {
                IRes first = m_WaitLoadList.First.Value;
                --m_LoadingCount;
                m_WaitLoadList.RemoveFirst();

                if (first == null)
                    return;

                first.LoadSync();
            }
        }

        public void LoadAsync(Action listener = null)
        {
            m_Listener = listener;
            DoLoadAsync();
        }

        private void DoLoadAsync()
        {
            if (m_LoadingCount == 0)
            {
                if (m_Listener != null)
                {
                    Action callback = m_Listener;
                    m_Listener = null;
                    callback();
                }

                return;
            }

            var nextNode = m_WaitLoadList.First;
            LinkedListNode<IRes> currentNode = null;
            while (nextNode != null)
            {
                currentNode = nextNode;
                IRes res = currentNode.Value;
                nextNode = currentNode.Next;
                if (res.IsDependResLoadFinish())
                {
                    m_WaitLoadList.Remove(currentNode);

                    if (res.State != ResState.Ready)
                    {
                        res.RegisteOnResLoadDoneEvent(OnResLoadFinish);
                        res.LoadAsync();
                    }
                    else
                    {
                        --m_LoadingCount;
                    }
                }
            }
        }

        private void OnResLoadFinish(bool result, IRes res)
        {
            --m_LoadingCount;
            //这一步设计可能会造成功能重复，多次没有必要的调用
            DoLoadAsync();
        }
        #endregion

        public void UnloadImage(bool flag)
        {
            //todo
        }


        public void OnCacheReset()
        {
            ReleaseAllRes();
        }

        public void ReleaseAllRes()
        {
            //todo

            m_Listener = null;
            m_LoadingCount = 0;
            m_WaitLoadList.Clear();
            if (m_ResList.Count > 0)
            {
                //确保首先删除的是AB，这样能对Asset的卸载做优化
                m_ResList.Reverse();

                for (int i = m_ResList.Count - 1; i >= 0; --i)
                {
                    m_ResList[i].UnRegisteOnResLoadDoneEvent(OnResLoadFinish);
                    m_ResList[i].SubRef();
                }
                m_ResList.Clear();
            }

            ResMgr.S.SetResMapDirty();
        }
    }
}