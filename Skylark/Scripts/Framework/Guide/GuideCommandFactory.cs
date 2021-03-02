using System.Collections.Generic;

namespace Skylark
{
    public class GuideCommandFactory : Singleton<GuideCommandFactory>
    {
        public delegate AbstractGuideCommand GuideCommandCreator();
        private Dictionary<string, GuideCommandCreator> m_CreatorMap = new Dictionary<string, GuideCommandCreator>();

        public void RegisterCreator(string name, GuideCommandCreator creator)
        {
            if (m_CreatorMap.ContainsKey(name))
            {
                Log.W("Already Add Creator for :" + name);
                return;
            }

            m_CreatorMap.Add(name, creator);
        }


        public AbstractGuideCommand Create(string name)
        {
            GuideCommandCreator creator = null;
            if (m_CreatorMap.TryGetValue(name, out creator))
            {
                return creator();
            }

            return null;
        }
    }
}