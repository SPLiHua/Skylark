using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class TDTableMetaData
    {
        public delegate void TDTableOnParse(byte[] data);
        private TDTableOnParse m_OnParse;

        public TDTableOnParse OnParse
        {
            get
            {
                return m_OnParse;
            }
        }

        public string TableName { get; set; }

        public TDTableMetaData(TDTableOnParse onParse, string tName)
        {
            m_OnParse = onParse;
            TableName = tName;
        }
    }
}