using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface INode
    {
        IAction CurrentExecutingNode { get; }
    }

    public interface IResetable
    {
        void Reset();
    }
}