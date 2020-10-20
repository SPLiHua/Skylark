using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

namespace Skylark
{
    public class TweeningHelper
    {
        public static Sequence PlayBreathEffect(Transform transform, float duration, int loop = -1)
        {
            Vector3 scale = transform.localScale;
            Vector3 beginScale = scale * 0.9f;
            transform.localScale = beginScale;
            return DOTween.Sequence()
                .Append(transform.DOScale(scale * 1.1f, duration).SetEase(Ease.InOutSine))
                .AppendInterval(duration * 0.2f)
                .Append(transform.DOScale(beginScale, duration).SetEase(Ease.InOutSine)).SetLoops(loop).SetEase(Ease.Linear);
        }

        public static Sequence PlayShakeEffect(Transform transform, float dur, int loop = -1)
        {
            Vector3 scale = Vector3.one;
            return DOTween.Sequence()
           .Append(transform.DOScale(scale * 1.1f, dur))
           .Append(transform.DOScale(scale, dur))
           .SetEase(Ease.OutBack)
           .SetLoops(loop);
        }
    }
}