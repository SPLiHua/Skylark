using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

namespace Skylark
{
    public class StreamDataWriter<T> : IDataWriter<T>
    {
        public void Close()
        {

        }

        public void Flush()
        {

        }

        public void Write(T t)
        {

        }

        public void Write(T t, string path)
        {
            //todo   实现思路：将t转换为string类再存储，读取时采用相同约定约束。
            // //创建StreamWriter 类的实例
            // StreamWriter streamWriter = new StreamWriter(saveSetting.DataPath);
            // //向文件中写入姓名
            // streamWriter.WriteLine("小张");
            // //向文件中写入手机号
            // streamWriter.WriteLine("13112345678");
            // //刷新缓存
            // streamWriter.Flush();
            // //关闭流
            // streamWriter.Close();

        }

        public void Write(T t, SaveSetting saveSetting)
        {
            Write(t, saveSetting.DataPath);
        }

        public void WriteAsyn(T t)
        {

        }

        public void WriteAsyn(T t, string path)
        {

        }

        public void WriteAsyn(T t, SaveSetting saveSetting)
        {

        }
    }
}