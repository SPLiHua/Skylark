using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IGameObjectPoolStrategy
    {
        void ProcessContainer(GameObject container);
        void OnAllcate(GameObject result);
        void OnRecycle(GameObject result);
    }

    public class DefaultPoolStrategy : Singleton<DefaultPoolStrategy>, IGameObjectPoolStrategy
    {
        public void ProcessContainer(GameObject container)
        {
            container.SetActive(false);
        }

        public void OnAllcate(GameObject result)
        {

        }

        public void OnRecycle(GameObject result)
        {

        }
    }
}