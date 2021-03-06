﻿using System.Collections;
using System.Collections.Generic;
using System;

namespace Skylark
{
    public class ModuleMgr : Singleton<ModuleMgr>
    {
        private LinkedList<AbstractModule> s_GameFrameworkModules = new LinkedList<AbstractModule>();

        public override void OnSingletonInit()
        {
            //需轮询module
            GetModule<ProcedureManager>();
            GetModule<InputModule>();

            //不需轮询，module
            SequenceNode sequenceNode = new SequenceNode();
            sequenceNode.Append(DataAnalysisAction.Allocate());
            sequenceNode.Append(EventAction.Allocate(() => { NetworkModule.S.Init(); }));
            sequenceNode.Append(TableAction.Allocate());
            sequenceNode.Append(EventAction.Allocate(() => { GamePersistentData.S.HandleTDData(); }));
            sequenceNode.Append(EventAction.Allocate(() => { GameDataMgr.S.Init(); }));
            sequenceNode.Append(EventAction.Allocate(() =>
            {
                GuideModule guideModule = new GuideModule();
                guideModule.OnInit();
            }));
            sequenceNode.OnEndedCallback += () => { GetModule<ProcedureManager>().StartProcedure<GamingProcedure>(); };
            ApplicationMgr.S.ExecuteNode(sequenceNode);
        }

        public void Update(float elapseSeconds, float realElapseSeconds)
        {
            foreach (AbstractModule module in s_GameFrameworkModules)
            {
                module.Update(elapseSeconds, realElapseSeconds);
            }
        }

        public void Shutdown()
        {
            for (LinkedListNode<AbstractModule> current = s_GameFrameworkModules.Last; current != null; current = current.Previous)
            {
                current.Value.Shutdown();
            }

            s_GameFrameworkModules.Clear();
        }

        public T GetModule<T>() where T : class
        {
            Type moduleType = typeof(T);

            return GetModule(moduleType) as T;
        }

        private AbstractModule GetModule(Type moduleType)
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

        private AbstractModule CreateModule(Type moduleType)
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

            module.OnInit();
            return module;
        }
    }
}