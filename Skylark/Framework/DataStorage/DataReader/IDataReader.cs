using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IDataReader<T>
    {
        bool Read(ref T t);
        bool Read(ref T t, string path);
        bool Read(ref T t, SaveSetting saveSetting);
        bool ReadAsyn(ref T t);
        bool ReadAsyn(ref T t, string path);
        bool ReadAsyn(ref T t, SaveSetting saveSetting);
        void Close();
    }
}