using System.Collections;
using System.Collections.Generic;
using System;

namespace Skylark
{
    public class ModuleMgr
    {
        private static LinkedList<AbstractModule> s_GameFrameworkModules = new LinkedList<AbstractModule>();

        public static void Update(float elapseSeconds, float realElapseSeconds)
        {
            foreach (AbstractModule module in s_GameFrameworkModules)
            {
                module.Update(elapseSeconds, realElapseSeconds);
            }
        }

        public static void Shutdown()
        {
            for (LinkedListNode<AbstractModule> current = s_GameFrameworkModules.Last; current != null; current = current.Previous)
            {
                current.Value.Shutdown();
            }

            s_GameFrameworkModules.Clear();
        }

        public static AbstractModule GetModule(Type moduleType)
        {
            foreach (AbstractModule module in s_GameFrameworkModules)
            {
                if (module.GetType() == moduleType)
                {
                    return module;
                }
            }

            return CreateModule(moduleType);
        }

        private static AbstractModule CreateModule(Type moduleType)
        {
            AbstractModule module = (AbstractModule)Activator.CreateInstance(moduleType);
            if (module == null)
            {
                throw new Exception(string.Format("Can not create module '{0}'.", moduleType.FullName));
            }

            LinkedListNode<AbstractModule> current = s_GameFrameworkModules.First;
            while (current != null)
            {
                if (module.Priority < current.Value.Priority)
                {
                    break;
                }

                current = current.Next;
            }

            if (current != null)
            {
                s_GameFrameworkModules.AddBefore(current, module);
            }
            else
            {
                s_GameFrameworkModules.AddLast(module);
            }

            return module;
        }
    }
}