using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class GuideMgr : MonoSingleton<GuideMgr>
    {
        private LinkedList<Guide> m_TrackingGuideList = new LinkedList<Guide>();

        public static string GetGuideKey(int guideID)
        {
            return string.Format("guide_{0}", guideID);
        }

        public static string GetLastKeyStepKey(int guideID)
        {
            return string.Format("guidekey_{0}", guideID);
        }

        public bool IsGuideFinish(int guideID)
        {
            return PrefsRecord.S.GetBool(GetGuideKey(guideID));
        }

        public override void OnSingletonInit()
        {
            InitGuideCommandFactory();
            InitGuideTriggerFactory();
            InitRuntimeParamFactory();
        }

        private void RegisterGuide()
        {
            for (int i = 0; i < TDGuideTable.dataList.Count; ++i)
            {
                TDGuide data = TDGuideTable.dataList[i];
                if (IsGuideFinish(data.id))
                {
                    continue;
                }
                Guide guide = new Guide(data.id);
                guide.RegisterTrack();
                m_TrackingGuideList.AddLast(guide);
            }
        }

        public void StartGuideTrack()
        {
            RegisterGuide();

            if (m_TrackingGuideList.Count > 0)
                m_TrackingGuideList.First.Value.StartTrack();
        }

        public void SaveStep(GuideStep step)
        {
            int oldKeyStep = PrefsRecord.S.GetInt(GetLastKeyStepKey(step.guide.guideID));

            if (oldKeyStep >= step.stepID)
            {
                return;
            }

            //TODO:需要找到最近的关键帧并保存
            var data = TDGuideStepTable.GetData(step.stepID);

            if (data != null)
            {
                if (data.keyFrame == 1)
                {
                    PrefsRecord.S.SetInt(GetLastKeyStepKey(step.guide.guideID), step.stepID);
                    PrefsRecord.S.Save();
                }
                else
                {
                    //纪录最近的keyframe
                    var allStep = TDGuideStepTable.GetDataAsGuideID(step.guide.guideID);
                    for (int i = allStep.Count - 1; i >= 0; --i)
                    {
                        if (allStep[i].keyFrame == 0)
                        {
                            continue;
                        }

                        if (allStep[i].id <= oldKeyStep)
                        {
                            break;
                        }

                        if (allStep[i].id <= data.id)
                        {
                            PrefsRecord.S.SetInt(GetLastKeyStepKey(step.guide.guideID), allStep[i].id);
                            PrefsRecord.S.Save();
                            break;
                        }

                    }
                }
            }
        }

        public void FinishGuide()
        {
            m_TrackingGuideList.First.Value.FinishTrack();
            SaveFinishGuideID(m_TrackingGuideList.First.Value.guideID);
            m_TrackingGuideList.RemoveFirst();

            if (m_TrackingGuideList.Count > 0)
            {
                m_TrackingGuideList.First.Value.StartTrack();
            }
            else
            {
                Log.I("All Guide Finish.");
                DataAnalysisMgr.S.CustomEvent("All_Guide_Finish");
            }
        }

        private void SaveFinishGuideID(int guideID)
        {
            PrefsRecord.S.SetBool(GetGuideKey(guideID), true);
            PrefsRecord.S.Save();
        }

        public int GetGuideLastStep(int guideID)
        {
            int stepId = PrefsRecord.S.GetInt(GetLastKeyStepKey(guideID));
            if (stepId > 0)
            {
                return stepId;
            }

            var data = TDGuideStepTable.GetGuideFirstStep(guideID);

            if (data == null)
            {
                return -1;
            }

            return data.id - 1;
        }

        private void InitGuideCommandFactory()
        {
            RegisterGuideCommand(typeof(ButtonHackCommand));
            RegisterGuideCommand(typeof(DelayCommand));
            RegisterGuideCommand(typeof(GuideTipCommand));
            RegisterGuideCommand(typeof(GuideHandCommand));
            RegisterGuideCommand(typeof(ScreenTouchCommand));
            RegisterGuideCommand(typeof(UIClipCommand));
            RegisterGuideCommand(typeof(PauseCommand));
            //RegisterGuideCommand(typeof(PlayAudioCommand));
            RegisterGuideCommand(typeof(MonoFuncCall));
            RegisterGuideCommand(typeof(OpenPanelCommand));
            RegisterGuideCommand(typeof(ButtonCommand));
        }

        private void InitGuideTriggerFactory()
        {
            //RegisterGuideTrigger(typeof(TopPanelTrigger));
            RegisterGuideTrigger(typeof(DelayTrigger));
            RegisterGuideTrigger(typeof(EventTrigger));
            RegisterGuideTrigger(typeof(EmptyTrigger));
        }

        private void InitRuntimeParamFactory()
        {
            RegisterRuntimeParam(typeof(UINodeFinder));
            RegisterRuntimeParam(typeof(MonoFuncCall));
        }

        public void RegisterGuideCommand(Type type)
        {
            Type[] ty = new Type[0];
            var constructor = type.GetConstructor(ty);

            if (constructor == null)
            {
                return;
            }

            GuideCommandFactory.S.RegisterCreator(type.Name, () =>
            {
                return constructor.Invoke(null) as AbstractGuideCommand;
            });
        }

        public void RegisterGuideTrigger(Type type)
        {
            Type[] ty = new Type[0];
            var constructor = type.GetConstructor(ty);
            if (constructor == null)
            {
                return;
            }

            GuideTriggerFactory.S.RegisterCreator(type.Name, () =>
            {
                return constructor.Invoke(null) as IGuideTrigger;
            });
        }

        public void RegisterRuntimeParam(Type type)
        {
            Type[] ty = new Type[0];
            var constructor = type.GetConstructor(ty);

            if (constructor == null)
            {
                return;
            }

            RuntimeParamFactory.S.RegisterCreator(type.Name, () =>
            {
                return constructor.Invoke(null) as IRuntimeParam;
            });
        }
    }
}