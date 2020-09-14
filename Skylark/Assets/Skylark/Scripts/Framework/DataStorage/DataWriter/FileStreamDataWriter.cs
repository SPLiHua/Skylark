using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

namespace Skylark
{
    public class FileStreamDataWriter<Object> : IDataWriter<Object>
    {
        public void Close()
        {

        }

        public void Flush()
        {

        }

        public void Write(Object t)
        {

        }

        public void Write(Object t, string path)
        {
            FileInfo fileInfo = new FileInfo(path);
            if (fileInfo.Exists)
            {
                fileInfo.Delete();
            }
            using (FileStream fs = new FileStream(path, FileMode.OpenOrCreate))
            {
                System.Runtime.Serialization.Formatters.Binary.BinaryFormatter bf = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                bf.Serialize(fs, t);
            }
        }

        public void Write(Object t, SaveSetting saveSetting)
        {
            Write(t, saveSetting.DataPath);
        }

        public void WriteAsyn(Object t)
        {

        }

        public void WriteAsyn(Object t, string path)
        {

        }

        public void WriteAsyn(Object t, SaveSetting saveSetting)
        {

        }
    }
}