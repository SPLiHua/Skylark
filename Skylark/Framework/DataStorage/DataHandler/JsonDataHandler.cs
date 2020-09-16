using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class JsonDataHandler<T> : DataHandler<T> where T : BaseData, new()
    {
        public JsonDataHandler() : base()
        {
            m_DataWriter = new JsonDataWriter<T>();
            m_DataReader = new JsonDataReader<T>();
        }
    }
}