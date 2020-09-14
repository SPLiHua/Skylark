using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using System;
using System.Text;
using LitJson;

namespace Skylark
{
    public class JsonDataWriter<T> : IDataWriter<T>
    {
        public void Write(T t)
        {
            //todo  存储持久化路径，持久化路径还未封装
            Write(t);
        }

        public void Write(T t, string path)
        {
            // if (!File.Exists(path))
            // {
            // 	File.Create(path);
            // }
            try
            {
                string jsonValue = JsonMapper.ToJson(t);
                File.WriteAllText(path, jsonValue);
                Debug.Log(string.Format("{0}:{1}", t.GetType().Name, "写入成功"));

            }
            catch (Exception e)
            {
                Debug.Log(string.Format("{0}{1}:{2}", t.GetType().Name, "写入失败", e));
            }
        }

        public void Write(T t, SaveSetting saveSetting)
        {
            string jsonValue = null;
            try
            {
                jsonValue = JsonMapper.ToJson(t);
                switch (saveSetting.EncryptType)
                {
                    case EncryptType.None:
                        break;
                    case EncryptType.AES:
                        jsonValue = EncryptUtil.AesStr(jsonValue, "nfsqyddbhhszd", "bpnmawsdssh");
                        break;
                }
            }
            catch (Exception e)
            {
                Debug.Log(string.Format("{0}{1}:{2}", t.GetType().Name, "写入失败", e));
                return;
            }

            FileInfo fileInfo;
            if (!string.IsNullOrEmpty(saveSetting.DataPath))
                fileInfo = new FileInfo(saveSetting.DataPath);
            else
                fileInfo = new FileInfo(saveSetting.PersistentDataPath);

            if (fileInfo.Exists)
            {
                fileInfo.Delete();
            }
            using (FileStream fs = fileInfo.OpenWrite())
            {
                byte[] writeDataArray = UTF8Encoding.UTF8.GetBytes(jsonValue);
                fs.Write(writeDataArray, 0, writeDataArray.Length);
                fs.Flush();
                Debug.Log(string.Format("{0}:{1}", t.GetType().Name, "写入成功"));
            }
        }

        public void WriteAsyn(T t)
        {
            //StartCoroutine(WriterCallBack(t));
        }

        private IEnumerator WriteCallBack(T t)
        {
            Write(t);
            yield break;
        }

        public void WriteAsyn(T t, string path)
        {
            //StartCoroutine(WriterCallBack(t, saveSetting));
        }

        private IEnumerator WriteCallBack(T t, string path)
        {
            Write(t, path);
            yield break;
        }


        public void WriteAsyn(T t, SaveSetting saveSetting)
        {

        }

        public void Flush()
        {

        }

        public void Close()
        {

        }
    }
}