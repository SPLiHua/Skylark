using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Skylark
{
    public abstract class FsmBase
    {
        private string m_Name;

        public FsmBase()
        {
            m_Name = string.Empty;
        }

        public string Name
        {
            get
            {
                return m_Name;
            }
            protected set
            {
                m_Name = value ?? string.Empty;
            }
        }

        public string FullName
        {
            get
            {
                return new TypeNamePair(OwnerType, m_Name).ToString();
            }
        }

        public abstract Type OwnerType
        {
            get;
        }

        public abstract int FsmStateCount
        {
            get;
        }

        public abstract bool IsRunning
        {
            get;
        }

        public abstract bool IsDestroyed
        {
            get;
        }

        public abstract string CurrentStateName
        {
            get;
        }

        public abstract float CurrentStateTime
        {
            get;
        }

        internal abstract void Update(float elapseSeconds, float realElapseSeconds);

        internal abstract void Shutdown();
    }
}