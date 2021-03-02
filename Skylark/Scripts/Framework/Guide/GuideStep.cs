using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideStep : IGuideStep
    {
        private int m_GuideStepID;
        private Guide m_Guide;
        private List<IGuideTrigger> m_TriggerList;
        private List<AbstractGuideCommand> m_CommandList;
        private bool m_IsTracking = false;

        public Guide guide
        {
            get { return m_Guide; }
            set { m_Guide = value; }
        }

        public int stepID
        {
            get { return m_GuideStepID; }
        }

        public GuideStep(int stepID)
        {
            m_GuideStepID = stepID;
        }

        public void RegisterTrack()
        {
            m_TriggerList = GetTriggerArray();
            m_CommandList = GetCommandArray();
        }

        public bool StartTrack()
        {
            if (m_TriggerList == null)
            {
                return false;
            }

            m_IsTracking = true;

            for (int i = 0; i < m_TriggerList.Count; ++i)
            {
                m_TriggerList[i].Start(CheckAllTriggerState);
            }

            Log.I("#GuideStep Start:" + m_GuideStepID);
            DataAnalysisMgr.S.CustomEvent("Guide", string.Format("Start_{0}", m_GuideStepID));

            return true;
        }

        private void CheckAllTriggerState()
        {
            for (int i = 0; i < m_TriggerList.Count; ++i)
            {
                if (!m_TriggerList[i].isReady)
                {
                    OnAllTriggerEvent(false);
                    return;
                }
            }

            OnAllTriggerEvent(true);
        }

        private void OnAllTriggerEvent(bool ready)
        {
            if (ready)
            {
                if (m_CommandList != null)
                {
                    for (int i = 0; i < m_CommandList.Count; ++i)
                    {
                        m_CommandList[i].guideStep = this;
                        m_CommandList[i].Start();
                    }
                }
            }
        }

        public void FinishTrack()
        {
            if (!m_IsTracking)
            {
                return;
            }

            m_IsTracking = false;

            if (m_TriggerList == null)
            {
                return;
            }

            for (int i = 0; i < m_TriggerList.Count; ++i)
            {
                m_TriggerList[i].Finish();
            }

            for (int i = 0; i < m_CommandList.Count; ++i)
            {
                m_CommandList[i].Finish(true);
            }

            DataAnalysisMgr.S.CustomEvent("Guide", string.Format("Finish_{0}", m_GuideStepID));
            Log.I("#GuideStep Finish:" + m_GuideStepID);
        }

        public void OnCommandFinish()
        {
            m_Guide.OnStepFinish(this);
        }

        //[name:p1,p2;name:p1,p2]
        protected List<IGuideTrigger> LoadTrigger(string context, string common)
        {
            if (string.IsNullOrEmpty(context))
            {
                return null;
            }

            string[] msg = context.Split(';');
            if (msg == null || msg.Length == 0)
            {
                return null;
            }

            object[] commonParams = null;

            if (common != null)
            {
                string[] comParamString = common.Split(';');
                if (comParamString.Length > 0)
                {
                    commonParams = new object[comParamString.Length];
                    for (int i = 0; i < comParamString.Length; ++i)
                    {
                        if (comParamString[i].Contains(":"))
                        {
                            string[] dynaParams = comParamString[i].Split(':');
                            IRuntimeParam runtimeParam = RuntimeParamFactory.S.Create(dynaParams[0]);
                            if (runtimeParam == null)
                            {
                                Log.E("Create Runtime Param Failed:" + dynaParams[0]);
                            }
                            else
                            {
                                if (dynaParams.Length > 1)
                                {
                                    //string[] findParams = dynaParams[1].Split(',');
                                    object[] resultArray = GuideConfigParamProcess.ProcessParam(dynaParams[1], commonParams);
                                    runtimeParam.SetParam(resultArray);
                                }
                            }

                            commonParams[i] = runtimeParam;
                        }
                        else
                        {
                            commonParams[i] = comParamString[i];
                        }
                    }
                }
            }

            List<IGuideTrigger> result = new List<IGuideTrigger>();

            for (int i = 0; i < msg.Length; ++i)
            {
                if (string.IsNullOrEmpty(msg[i]))
                {
                    continue;
                }
                string[] com = msg[i].Split(':');
                if (com == null || com.Length == 0)
                {
                    continue;
                }

                IGuideTrigger trigger = GuideTriggerFactory.S.Create(com[0]);
                if (trigger == null)
                {
                    Log.E("Create Trigger Failed:" + com[0]);
                }

                if (com.Length > 1)
                {
                    object[] resultArray = GuideConfigParamProcess.ProcessParam(com[1], commonParams);

                    //处理参数
                    trigger.SetParam(resultArray);
                }

                if (trigger != null)
                {
                    result.Add(trigger);
                }
            }
            return result;
        }


        //command format:[c1:p1,p2,p3;c2:p1,p2,p3]
        private List<AbstractGuideCommand> LoadCommands(string context, string common)
        {
            if (string.IsNullOrEmpty(context))
            {
                return null;
            }

            string[] msg = context.Split(';');
            if (msg == null || msg.Length == 0)
            {
                return null;
            }

            object[] commonParams = null;

            if (common != null)
            {
                string[] comParamString = common.Split(';');
                if (comParamString.Length > 0)
                {
                    commonParams = new object[comParamString.Length];
                    for (int i = 0; i < comParamString.Length; ++i)
                    {
                        if (comParamString[i].Contains(":"))
                        {
                            string[] dynaParams = comParamString[i].Split(':');
                            IRuntimeParam runtimeParam = RuntimeParamFactory.S.Create(dynaParams[0]);
                            if (runtimeParam == null)
                            {
                                Log.E("Create RuntimeParam Failed:" + dynaParams[0]);
                            }
                            else
                            {
                                if (dynaParams.Length > 1)
                                {
                                    object[] resultArray = GuideConfigParamProcess.ProcessParam(dynaParams[1], commonParams);
                                    runtimeParam.SetParam(resultArray);
                                }
                            }
                            commonParams[i] = runtimeParam;
                        }
                        else
                        {
                            commonParams[i] = comParamString[i];
                        }
                    }
                }
            }

            List<AbstractGuideCommand> result = null;

            for (int i = 0; i < msg.Length; ++i)
            {
                if (string.IsNullOrEmpty(msg[i]))
                {
                    continue;
                }
                string[] com = msg[i].Split(':');
                if (com == null || com.Length == 0)
                {
                    continue;
                }

                AbstractGuideCommand command = GuideCommandFactory.S.Create(com[0]);
                if (command == null)
                {
                    Log.E("Create Command Failed:" + com[0]);
                    continue;
                }

                if (com.Length > 1)
                {
                    object[] resultArray = GuideConfigParamProcess.ProcessParam(com[1], commonParams);
                    //处理参数
                    command.SetParam(resultArray);
                }

                if (result == null)
                {
                    result = new List<AbstractGuideCommand>();
                }

                result.Add(command);
            }

            return result;
        }

        private List<IGuideTrigger> GetTriggerArray()
        {
            TDGuideStep data = TDGuideStepTable.GetData(m_GuideStepID);
            if (data == null)
            {
                return null;
            }

            return LoadTrigger(data.trigger, data.commonParam);
        }

        private List<AbstractGuideCommand> GetCommandArray()
        {
            TDGuideStep data = TDGuideStepTable.GetData(m_GuideStepID);
            if (data == null)
            {
                return null;
            }

            return LoadCommands(data.command, data.commonParam);
        }
    }
}