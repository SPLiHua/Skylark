﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class ADRewardHandler : ADHandler
    {
        protected void HandleOnADReward(string adUnitId, string label, float amount)
        {
            Debug.Log("ADReward:" + adUnitId + "/////" + label);

            m_ADInterface.EventListener.OnAdRewardEvent();
        }
    }
}