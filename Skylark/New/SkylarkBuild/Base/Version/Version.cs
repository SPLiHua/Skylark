using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public partial class Version
    {
        private const string SkyLarkVersionStr = "2020.11.5";
        private IVersionHelper m_VersionHelper = null;

        public string SkyLarkVersion
        {
            get
            {
                return SkyLarkVersionStr;
            }
        }

        public string GameVersion
        {
            get
            {
                if (m_VersionHelper == null)
                {
                    return string.Empty;
                }
                return m_VersionHelper.GameVersion;
            }
        }

        public int InternalGameVersion
        {
            get
            {
                if (m_VersionHelper == null)
                {
                    return 0;
                }

                return m_VersionHelper.InternalGameVersion;
            }
        }

        public void SetVersionHelper(IVersionHelper versionHelper)
        {
            m_VersionHelper = versionHelper;
        }
    }
}