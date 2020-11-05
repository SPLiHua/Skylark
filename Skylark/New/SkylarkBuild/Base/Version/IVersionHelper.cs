using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public partial class Version
    {
        public interface IVersionHelper
        {
            string GameVersion
            {
                get;
            }

            int InternalGameVersion
            {
                get;
            }
        }
    }
}