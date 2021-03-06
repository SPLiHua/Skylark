﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ParticleMgr : Singleton<ParticleMgr>
    {
        List<ParticleUnit> m_ParticleUnitList;

        public override void OnSingletonInit()
        {
            m_ParticleUnitList = new List<ParticleUnit>();
        }

        public int PlayParticle(string particleName, Vector3 Pos, bool bRecycle = true)
        {
            ParticleUnit particleUnit = ParticleUnit.Allocate();
            particleUnit.SetParticle(particleName, Pos, bRecycle);
            m_ParticleUnitList.Add(particleUnit);
            return particleUnit.m_ID;
        }

        public ParticleUnit PlayParticle2(string particleName, Vector3 Pos, bool bRecycle = true)
        {
            ParticleUnit particleUnit = ParticleUnit.Allocate();
            particleUnit.SetParticle(particleName, Pos, bRecycle);
            m_ParticleUnitList.Add(particleUnit);
            return particleUnit;
        }

        public int PlayParticleWithParent(string particleName, Vector3 localPos, bool bRecycle = true, Transform parTrans = null)
        {
            ParticleUnit particleUnit = ParticleUnit.Allocate();
            particleUnit.SetParticle(particleName, localPos, bRecycle, parTrans);
            m_ParticleUnitList.Add(particleUnit);
            return particleUnit.m_ID;
        }

        public void StopParticle(int id)
        {
            for (int i = 0; i < m_ParticleUnitList.Count; i++)
            {
                if (m_ParticleUnitList[i].m_ID == id)
                {
                    m_ParticleUnitList[i].Recycle2Cache();
                    break;
                }
            }
        }

        public ParticleUnit GetParticleUnit(int id)
        {
            for (int i = 0; i < m_ParticleUnitList.Count; i++)
            {
                if (m_ParticleUnitList[i].m_ID == id)
                {
                    return m_ParticleUnitList[i];
                }
            }
            return null;
        }
    }
}