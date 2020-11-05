using UnityEngine;
using Skylark;

namespace Skylark.Runtime
{
    public class DefaultVersionHelper : Version.IVersionHelper
    {
        public string GameVersion
        {
            get
            {
                return Application.version;
            }
        }

        public int InternalGameVersion
        {
            get
            {
                return 0;
            }
        }
    }
}