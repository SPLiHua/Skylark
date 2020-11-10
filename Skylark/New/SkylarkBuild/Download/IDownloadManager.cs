using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IDownloadManager
    {
        bool Paused
        {
            get; set;
        }
    }
}