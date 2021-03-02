using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IUINodeFinder : IRuntimeParam
    {
        Transform FindNode(bool search);
    }
}