using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

namespace Skylark
{
    public class NetworkModule : MonoSingleton<NetworkModule>
    {
        private LinkedList<WebRequestData> getRequestList;
        private LinkedList<WebRequestData> postRequestList;
        private LinkedListNode<WebRequestData> getWebCurrentData;
        private LinkedListNode<WebRequestData> postWebCurrentData;

        public void Init()
        {
            getRequestList = new LinkedList<WebRequestData>();
            postRequestList = new LinkedList<WebRequestData>();
        }

        public void Send(WebType webType, string url, Action<bool, UnityWebRequest> fun, WWWForm wwwForm = null)
        {
            WebRequestData data = ObjectPool<WebRequestData>.S.Allocate();
            data.SetMsg(webType, url, fun, wwwForm);
            switch (data.webType)
            {
                case WebType.Get:
                    getRequestList.AddLast(data);
                    StartGetIEnumerator();
                    break;
                case WebType.Post:
                    postRequestList.AddLast(data);
                    StartPostIEnumerator();
                    break;
            }
        }

        #region //Get
        public void StartGetIEnumerator()
        {
            if (getWebCurrentData.Value.cacheFlag && getRequestList.First != null)
            {
                getWebCurrentData = getRequestList.First;
                StartCoroutine(GetRequest(getWebCurrentData.Value.url, getWebCurrentData.Value.fun));
            }
        }

        private IEnumerator GetRequest(string url, Action<bool, UnityWebRequest> callback)
        {
            UnityWebRequest webRequest = UnityWebRequest.Get(url);

            yield return webRequest.SendWebRequest();
            if (webRequest.isHttpError || webRequest.isNetworkError)
            {
                Debug.Log("webRequest Get Failed:" + webRequest);
                callback(false, webRequest);
            }
            else
            {
                callback(true, webRequest);
                HandleNextGet();
            }
        }

        private void HandleNextGet()
        {
            getWebCurrentData.Value.Recycle2Cache();
            getRequestList.RemoveFirst();
            StartGetIEnumerator();
        }
        #endregion

        #region //Post

        public void StartPostIEnumerator()
        {
            if (postWebCurrentData.Value.cacheFlag && postRequestList.First != null)
            {
                postWebCurrentData = postRequestList.First;
                StartCoroutine(PostRequest(postWebCurrentData.Value.url, postWebCurrentData.Value.wwwForm, postWebCurrentData.Value.fun));
            }
        }

        private IEnumerator PostRequest(string url, WWWForm wwwForm, Action<bool, UnityWebRequest> callback)
        {
            UnityWebRequest webRequest = UnityWebRequest.Post(url, wwwForm);

            yield return webRequest.SendWebRequest();
            if (webRequest.isHttpError || webRequest.isNetworkError)
            {
                Debug.Log("webRequest Post Failed:" + webRequest);
                callback(false, webRequest);
            }
            else
            {
                callback(true, webRequest);
                HandleNextPost();
            }
        }

        private void HandleNextPost()
        {
            postWebCurrentData.Value.Recycle2Cache();
            postRequestList.RemoveFirst();
            postWebCurrentData = null;
            StartGetIEnumerator();
        }
        #endregion
    }

    public class WebRequestData : ICacheAble, ICacheType
    {
        public string url;
        public Action<bool, UnityWebRequest> fun;
        public WebType webType;
        public WWWForm wwwForm;

        public WebRequestData()
        {

        }

        public void SetMsg(WebType webType, string url, Action<bool, UnityWebRequest> fun, WWWForm wwwForm = null)
        {
            this.webType = webType;
            this.url = url;
            this.fun = fun;
            this.wwwForm = wwwForm;
        }

        private bool m_CacheFlag;
        public bool cacheFlag
        {
            get { return m_CacheFlag; }
            set { m_CacheFlag = value; }
        }

        public void OnCacheReset()
        {
            url = null;
            fun = null;
            wwwForm = null;
        }

        public void Recycle2Cache()
        {
            ObjectPool<WebRequestData>.S.Recycle(this);
        }
    }

    public enum WebType
    {
        Get, Post,
    }
}