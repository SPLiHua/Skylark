using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IAnalysisAdapter
    {
        void CustomEvent(string eventID);
        void CustomValueEvent(string eventID, float value, string label);
        void CustomEventDic(string eventId, Dictionary<string, string> dic);
        void CustomEventDuration(string eventID, long duration);
    }
}