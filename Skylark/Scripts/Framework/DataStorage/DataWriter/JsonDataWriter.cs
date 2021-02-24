using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using System;
using System.Text;
using LitJson;
using Newtonsoft.Json;

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
                Log.I(string.Format("{0}:{1}", t.GetType().Name, "写入成功"));

            }
            catch (Exception e)
            {
                Log.I(string.Format("{0}{1}:{2}", t.GetType().Name, "写入失败", e));
            }
        }

        public void Write(T t, SaveSetting saveSetting)
        {
            string jsonValue = null;
            try
            {
                jsonValue = JsonConvert.SerializeObject(t);
                switch (saveSetting.EncryptType)
                {
                    case EncryptType.None:
                        break;
                    case EncryptType.AES:
                        jsonValue = EncryptUtil.AesStr(jsonValue, SaveSetting.m_AESKeyValue, SaveSetting.m_AESIvValue);
                        break;
                }
            }
            catch (Exception e)
            {
                Log.I(string.Format("{0}{1}:{2}", t.GetType().Name, "写入失败", e));
                return;
            }

            FileInfo fileInfo;
            fileInfo = new FileInfo(string.Format("{0}/{1}.json", saveSetting.DataPath, saveSetting.DataName));

            if (!Directory.Exists(saveSetting.DataPath))
            {
                Directory.CreateDirectory(saveSetting.DataPath);
            }
            if (!fileInfo.Exists)
            {
                fileInfo.Create().Dispose();
            }
            using (FileStream fs = fileInfo.OpenWrite())
            {
                fs.SetLength(0);
                byte[] writeDataArray = UTF8Encoding.UTF8.GetBytes(jsonValue);
                fs.Write(writeDataArray, 0, writeDataArray.Length);
                fs.Flush();
                Log.I(string.Format("{0}:{1}", t.GetType().Name, "Write Success"));
            }

#if UNITY_EDITOR
            #region //保险起见，persistentDataPath路径也做存储
            FileInfo fileInfo1;
            fileInfo1 = new FileInfo(string.Format("{0}/{1}.json", Application.persistentDataPath, saveSetting.DataName));

            if (!fileInfo1.Exists)
            {
                fileInfo1.Delete();
            }
            else
            {
                fileInfo1.Create().Dispose();
            }
            using (FileStream fs = fileInfo1.OpenWrite())
            {
                byte[] writeDataArray = UTF8Encoding.UTF8.GetBytes(jsonValue);
                fs.Write(writeDataArray, 0, writeDataArray.Length);
                fs.Flush();
            }
            #endregion
#endif
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