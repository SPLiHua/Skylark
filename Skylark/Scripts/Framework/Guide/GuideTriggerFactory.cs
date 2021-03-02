using System.Collections.Generic;

namespace Skylark
{
    public class GuideTriggerFactory : Singleton<GuideTriggerFactory>
    {
        public delegate IGuideTrigger GuideTriggerCreator();
        private Dictionary<string, GuideTriggerCreator> m_CreatorMap = new Dictionary<string, GuideTriggerCreator>();

        public void RegisterCreator(string name, GuideTriggerCreator creator)
        {
            if (m_CreatorMap.ContainsKey(name))
            {
                Log.W("Already Add Creator for :" + name);
                return;
            }

            m_CreatorMap.Add(name, creator);
        }


        public IGuideTrigger Create(string name)
        {
            GuideTriggerCreator creator = null;
            if (m_CreatorMap.TryGetValue(name, out creator))
            {
                return creator();
            }

            return null;
        }
    }
}

