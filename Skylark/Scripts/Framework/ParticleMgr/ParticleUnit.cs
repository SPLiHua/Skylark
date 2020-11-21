using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ParticleUnit : ICacheAble, ICacheType
    {
        protected static Dictionary<int, ParticleUnit> s_ParticleUnitMap = new Dictionary<int, ParticleUnit>();
        protected static int s_NextID = 0;

        public int m_ID;
        public string m_Name;
        ResLoader m_ResLoader;
        GameObject m_ParticleGo;
        public GameObject ParticleGo { get => m_ParticleGo; }

        private bool m_CacheFlag;
        public bool cacheFlag { get => m_CacheFlag; set => m_CacheFlag = value; }

        public static ParticleUnit Allocate()
        {
            ParticleUnit unit = ObjectPool<ParticleUnit>.S.Allocate();
            unit.m_ID = s_NextID++;
            return unit;
        }

        public void SetParticle(string particleName, Vector3 Pos, bool bRecycle = true, Transform parTrans = null)
        {
            m_ResLoader = ResLoader.Allocate();
            m_Name = particleName;
            GameObject go = m_ResLoader.LoadSync(particleName) as GameObject;
            m_ParticleGo = GameObject.Instantiate(go);
            if (parTrans != null)
            {
                m_ParticleGo.transform.parent = parTrans;
                m_ParticleGo.transform.localPosition = Pos;
            }
            else
            {
                m_ParticleGo.transform.position = Pos;
            }

            ParticleSystem particle = null;
            particle = m_ParticleGo.GetComponent<ParticleSystem>();
            if (particle == null)
            {
                particle = m_ParticleGo.GetComponentInChildren<ParticleSystem>();
            }
            if (particle == null)
            {
                return;
            }

            if (bRecycle)
            {
                Timer.S.Post2Really((i) =>
                {
                    Recycle2Cache();
                }, particle.main.duration, 1);
            }
        }

        public void OnCacheReset()
        {
            GameObject.Destroy(m_ParticleGo);
            m_ResLoader.Recycle2Cache();
        }

        public void Recycle2Cache()
        {
            ObjectPool<ParticleUnit>.S.Recycle(this);
        }
    }
}