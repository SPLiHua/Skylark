using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IBinaryHeapElement
    {
        float sortScore
        {
            get;
        }

        int heapIndex
        {
            set;
        }

        void RebuildHeap<T>(BinaryHeap<T> heap) where T : IBinaryHeapElement;
    }
}