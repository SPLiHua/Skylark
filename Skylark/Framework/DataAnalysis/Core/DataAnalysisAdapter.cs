using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public abstract class DataAnalysisAdapter : BaseSDKAdapter, IAnalysisAdapter
    {
        public virtual void CustomEvent(string eventID, string label = null, Dictionary<string, string> dic = null)
        {

        }

        public virtual void CustomEventDic(string eventId, Dictionary<string, string> dic)
        {

        }

        public virtual void CustomEventDuration(string eventID, long duration)
        {

        }

        public virtual void CustomValueEvent(string eventID, float value, string label = null, Dictionary<string, string> dic = null)
        {

        }
    }
}