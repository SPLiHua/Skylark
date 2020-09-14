using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IDataWriter<T>
    {
        void Write(T t);
        void Write(T t, string path);
        void Write(T t, SaveSetting saveSetting);
        void WriteAsyn(T t);
        void WriteAsyn(T t, string path);
        void WriteAsyn(T t, SaveSetting saveSetting);
        void Flush();
        void Close();
    }
}