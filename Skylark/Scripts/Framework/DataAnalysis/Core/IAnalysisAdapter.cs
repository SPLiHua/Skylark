using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IAnalysisAdapter
    {
        void CustomEvent(string eventID, string label = null, Dictionary<string, string> dic = null);
        void CustomValueEvent(string eventID, float value, string label = null, Dictionary<string, string> dic = null);
        void CustomEventDic(string eventId, Dictionary<string, string> dic);
        void CustomEventDuration(string eventID, long duration);
    }
}