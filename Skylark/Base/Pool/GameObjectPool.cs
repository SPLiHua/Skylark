using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GameObjectPool
    {
        private string m_PoolName;
        private Transform m_Root;
        private GameObject m_Prefab;
        private int m_MaxCount = 10;
        private Stack<GameObject> m_CacheStack;
        private List<GameObject> m_AllCacheList;
        private IGameObjectPoolStrategy m_Strategy;

        public void InitPool(string name, GameObject prefab, Transform parentTrans, int maxCount, int initCount, IGameObjectPoolStrategy strategy = null)
        {
            if (m_Prefab != null)
            {
                Debug.LogError("Already exist {" + name + "}Pool.");
                return;
            }
            if (prefab == null)
            {
                return;
            }
            m_PoolName = name;
            m_Prefab = prefab;
            GameObject container = new GameObject(m_PoolName);
            GameObject go = GameObject.Instantiate(container);

            m_Root = go.transform;
            if (parentTrans != null)
                m_Root.SetParent(parentTrans);

            m_Strategy = strategy;
            if (m_Strategy == null)
                m_Strategy = DefaultPoolStrategy.S;
            m_Strategy.ProcessContainer(container);
            GameObject.DestroyImmediate(container);
            if (maxCount > 0)
            {
                m_MaxCount = Mathf.Max(1, maxCount);
                initCount = Mathf.Min(maxCount, initCount);
            }
            if (initCount > 0)
            {
                for (int i = 0; i < initCount; i++)
                {
                    Recycle(CreateNewGameObject());
                }
            }
        }

        public int currentCount
        {
            get
            {
                if (m_CacheStack == null)
                    return 0;
                else
                    return m_CacheStack.Count;
            }
        }

        public int maxCacheCount
        {
            get { return m_MaxCount; }
            set
            {
                m_MaxCount = value;
                if (m_CacheStack != null)
                {
                    if (m_MaxCount < m_CacheStack.Count)
                    {
                        for (int i = m_MaxCount; i < m_CacheStack.Count; i++)
                        {
                            GameObject go = m_CacheStack.Pop();
                            GameObject.DestroyImmediate(go);
                        }
                    }
                    else if (m_MaxCount > m_CacheStack.Count)
                    {
                        for (int i = m_CacheStack.Count; i < m_MaxCount; i++)
                        {
                            Recycle(CreateNewGameObject());
                        }
                    }
                }
            }
        }

        public GameObject Allocate()
        {
            GameObject result;
            if (m_CacheStack == null || m_CacheStack.Count == 0)
            {
                if (m_Prefab == null)
                {
                    Debug.Log("Pool has no Prefab.");
                    return null;
                }
                Recycle(CreateNewGameObject());
                result = m_CacheStack.Pop();
            }
            else
            {
                result = m_CacheStack.Pop();
            }
            if (m_AllCacheList == null)
                m_AllCacheList = new List<GameObject>();

            m_AllCacheList.Add(result);
            m_Strategy.OnAllcate(result);
            result.SetActive(true);
            return result;
        }

        public void Recycle(GameObject go)
        {
            if (go == null)
                return;
            if (m_CacheStack == null)
                m_CacheStack = new Stack<GameObject>();
            m_Strategy.OnRecycle(go);
            PoolObjectReset itemComponent = go.GetComponent<PoolObjectReset>();
            if (m_MaxCount > 0)
            {
                if (m_CacheStack.Count >= m_MaxCount)
                {
                    if (itemComponent != null)
                        itemComponent.OnReset2Cache();
                    GameObject.Destroy(go);
                    return;
                }
            }
            if (itemComponent != null)
                itemComponent.OnReset2Cache();
            if (go.GetComponent<ICacheAble>() != null)
            {
                go.GetComponent<ICacheAble>().OnCacheReset();
            }
            go.transform.SetParent(m_Root, true);
            go.SetActive(false);  //某些情况不需要处理这步
            if (!m_CacheStack.Contains(go))
                m_CacheStack.Push(go);
        }

        public void RecycleAll()
        {
            if (m_AllCacheList == null)
                return;

            foreach (var item in m_AllCacheList)
            {
                Recycle(item);
            }
            m_AllCacheList.Clear();
        }

        public void RemoveAllObject(bool destroySelf, bool destoryPrefab)
        {
            if (destoryPrefab && m_Prefab != null)
            {
                GameObject.DestroyImmediate(m_Prefab, true);
                m_Prefab = null;
            }
            if (destroySelf)
            {
                foreach (var item in m_AllCacheList)
                {
                    GameObject.Destroy(item);
                }
                m_AllCacheList.Clear();
                if (m_Root != null)
                {
                    GameObject.Destroy(m_Root.gameObject);
                    m_Root = null;
                }
                if (m_CacheStack != null)
                {
                    m_CacheStack.Clear();
                }
                if (m_AllCacheList != null)
                {
                    m_AllCacheList.Clear();
                }
                return;
            }
            if (m_CacheStack == null || m_CacheStack.Count == 0)
                return;
            // GameObject next = null;
            // while (m_CacheStack.Count > 0)
            // {
            //     next = m_CacheStack.Pop();
            //     GameObject.Destroy(next);
            // }
        }

        private GameObject CreateNewGameObject()
        {
            if (m_Prefab == null)
                return null;
            GameObject gameObject = GameObject.Instantiate(m_Prefab, m_Root, true) as GameObject;

            return gameObject;
        }
    }
}