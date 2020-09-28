using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class AudioUnit : ICacheAble, ICacheType
    {
        protected static Dictionary<int, AudioUnit> s_AudioUnitMap = new Dictionary<int, AudioUnit>();
        protected static int s_NextID = 0;


        #region  //配置相关
        private string m_Name;
        private int m_ID = -1;
        private int m_PlayCount = 0;
        private bool m_IsLoop;
        private bool m_IsPause = false;
        private AudioSource m_Source;
        private AudioClip m_AudioClip;
        #endregion

        private float m_LeftDelayTime = -1;
        private int m_TimeItemID;
        private ResLoader m_Loader;
        private bool m_UsedCache = true;

        private Action<int> m_OnFinishListener;
        private Action<int> m_OnStopListener;


        public AudioSource audioSource
        {
            get { return m_Source; }
        }

        public bool usedCache
        {
            get { return m_UsedCache; }
            set { m_UsedCache = false; }
        }

        public string audioName
        {
            get { return m_Name; }
        }

        public int id
        {
            get { return m_ID; }
            private set { m_ID = value; }
        }

        private bool m_CacheFlag;
        public bool cacheFlag
        {
            get { return m_CacheFlag; }
            set { m_CacheFlag = value; }
        }

        public static AudioUnit Allocate()
        {
            AudioUnit unit = ObjectPool<AudioUnit>.S.Allocate();
            return unit;
        }

        public void SetOnFinishListener(Action<int> l)
        {
            m_OnFinishListener = l;
        }

        public void SetOnStopListener(Action<int> l)
        {
            m_OnStopListener = l;
        }

        public void PlayShot()
        {
            if (m_AudioClip == null)
            {
                return;
            }

            int loopCount = 1;
            if (m_IsLoop)
            {
                loopCount = -1;
            }

            if (m_TimeItemID >= 0)
            {
                Timer.S.Cancel(m_TimeItemID);
            }

            m_TimeItemID = Timer.S.Post2Really(OnSoundPlayFinish, GetAudioClipLength(m_AudioClip), loopCount);

            if (m_Source.enabled)
            {
                m_Source.PlayOneShot(m_AudioClip);
            }
        }

        public void SetAudio(GameObject root, string name, bool loop, bool isEnable)
        {
            if (string.IsNullOrEmpty(name))
            {
                return;
            }

            if (m_Name == name)
            {
                return;
            }

            if (m_Source == null)
            {
                m_Source = root.AddComponent<AudioSource>();
                if (!isEnable)
                {
                    m_Source.enabled = isEnable;
                }
            }

            //防止卸载后立马加载的情况
            ResLoader preLoader = m_Loader;
            m_Loader = null;
            CleanResources();

            RegisterActiveAudioUnit(this);

            m_Loader = ResLoader.Allocate();

            m_IsLoop = loop;
            m_Name = name;

            m_Loader.Add2Load(name, OnResLoadFinish);

            if (preLoader != null)
            {
                preLoader.Recycle2Cache();
                preLoader = null;
            }

            if (m_Loader != null)
            {
                m_Loader.LoadAsync();
            }
        }

        private void OnResLoadFinish(bool result, IRes res)
        {
            if (!result)
            {
                Release();
                return;
            }

            m_AudioClip = res.Asset as AudioClip;

            if (m_AudioClip == null)
            {
                Debug.Log("Asset Is Invalid AudioClip:" + m_Name);
                Release();
                return;
            }

            PlayAudioClip();
        }

        private void PlayAudioClip()
        {
            if (m_Source == null || m_AudioClip == null)
            {
                Release();
                return;
            }

            m_Source.clip = m_AudioClip;
            m_Source.loop = m_IsLoop;

            int loopCount = 1;
            if (m_IsLoop)
            {
                loopCount = -1;
            }

            m_TimeItemID = Timer.S.Post2Really(OnSoundPlayFinish, GetAudioClipLength(m_AudioClip), loopCount);

            if (m_Source.enabled)
            {
                m_Source.Play();
            }
        }

        public void Stop()
        {
            Release();
        }

        public void Resume()
        {
            if (!m_IsPause)
            {
                return;
            }

            if (m_LeftDelayTime >= 0)
            {
                m_TimeItemID = Timer.S.Post2Really(OnResumeTimeTick, m_LeftDelayTime);
            }

            m_IsPause = false;

            if (m_Source.enabled)
            {
                m_Source.Play();
            }
        }

        public void Pause()
        {
            if (m_IsPause)
            {
                return;
            }

            m_LeftDelayTime = -1;

            Timer.TimeItem item = Timer.TimeItem.GetTimeItemByID(m_TimeItemID);
            //暂停
            if (item != null)
            {
                m_LeftDelayTime = item.sortScore - Timer.S.currentScaleTime;
                item.Cancel();
                m_TimeItemID = -1;
            }

            m_IsPause = true;

            if (m_Source.enabled)
            {
                m_Source.Pause();
            }
        }

        private void OnResumeTimeTick(int repeatCount)
        {
            OnSoundPlayFinish(repeatCount);

            if (m_IsLoop)
            {
                m_TimeItemID = Timer.S.Post2Really(OnSoundPlayFinish, GetAudioClipLength(m_AudioClip), -1);
            }
        }

        private void OnSoundPlayFinish(int count)
        {
            ++m_PlayCount;

            if (m_OnFinishListener != null)
            {
                m_OnFinishListener(m_ID);
            }

            if (!m_IsLoop)
            {
                Release();
            }
        }

        public void SetVolume(float volume)
        {
            m_Source.volume = volume;
        }

        public void SetPitch(float pitch)
        {
            m_Source.pitch = pitch;
        }

        private float GetAudioClipLength(AudioClip clip)
        {
            return clip.length + 0.2f;
        }

        private void CleanResources()
        {
            if (m_OnStopListener != null)
            {
                m_OnStopListener(m_ID);
            }

            UnRegisterActiveAudioUnit(this);
            m_Name = null;
            m_PlayCount = 0;
            m_IsPause = false;
            m_OnFinishListener = null;
            m_OnStopListener = null;
            m_LeftDelayTime = -1;

            if (m_TimeItemID > 0)
            {
                Timer.S.Cancel(m_TimeItemID);
                m_TimeItemID = -1;
            }

            if (m_Source != null)
            {
                if (m_Source.clip == m_AudioClip)
                {
                    if (m_Source.enabled)
                    {
                        m_Source.Stop();
                    }
                    m_Source.clip = null;
                }
                m_Source.volume = 1.0f;
                m_Source.pitch = 1.0f;
            }

            m_AudioClip = null;

            if (m_Loader != null)
            {
                m_Loader.Recycle2Cache();
                m_Loader = null;
            }
        }

        private void Release()
        {
            CleanResources();

            if (m_UsedCache)
            {
                Recycle2Cache();
            }
        }

        private static void RegisterActiveAudioUnit(AudioUnit unit)
        {
            unit.id = ++s_NextID;
            s_AudioUnitMap.Add(unit.id, unit);
        }

        private static void UnRegisterActiveAudioUnit(AudioUnit unit)
        {
            if (s_AudioUnitMap.ContainsKey(unit.id))
            {
                s_AudioUnitMap.Remove(unit.id);
            }
            unit.id = -1;
        }

        public static AudioUnit GetAudioUnitByID(int id)
        {
            AudioUnit unit;
            if (s_AudioUnitMap.TryGetValue(id, out unit))
            {
                return unit;
            }
            return null;
        }

        public void OnCacheReset()
        {
            CleanResources();
        }

        public void Recycle2Cache()
        {
            if (!ObjectPool<AudioUnit>.S.Recycle(this))
            {
                if (m_Source != null)
                {
                    GameObject.Destroy(m_Source);
                    m_Source = null;
                }
            }
        }
    }
}