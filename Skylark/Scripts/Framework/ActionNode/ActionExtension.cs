using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public static class ActionExtension
    {
        public static T ExecuteNode<T>(this T selBehaviour, IAction commandNode) where T : MonoBehaviour
        {
            selBehaviour.StartCoroutine(commandNode.Execute());
            return selBehaviour;
        }

        public static IEnumerator Execute(this IAction selfNode)
        {
            if (selfNode.Finished) selfNode.Reset();
            while (!selfNode.Execute(Time.deltaTime))
            {
                yield return null;
            }
        }
    }
}