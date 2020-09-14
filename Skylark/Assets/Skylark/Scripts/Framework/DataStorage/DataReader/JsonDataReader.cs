using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using LitJson;

namespace Skylark
{
    public class JsonDataReader<T> : IDataReader<T>
    {
        public void Close()
        {

        }

        public bool Read(ref T t)
        {
            //读取默认存放地址
            return Read(ref t, "");
        }

        public bool Read(ref T t, string path)
        {
            if (!File.Exists(path))
            {
                return false;
            }
            //string json = File.ReadAllText(path);      另一种用法
            StreamReader stream = new StreamReader(path);
            if (stream == null)
            {
                return false;
            }
            string json = stream.ReadToEnd();
            if (json.Length > 0)
            {
                t = JsonUtility.FromJson<T>(json);
                Debug.Log(string.Format("{0}:{1}", t.GetType().Name, "读取成功"));
                return true;
            }
            Debug.Log(string.Format("{0}:{1}", t.GetType().Name, "读取失败"));
            return false;
        }

        public bool Read(ref T t, SaveSetting saveSetting)
        {
            FileInfo fileInfo;
            if (!string.IsNullOrEmpty(saveSetting.DataPath))
                fileInfo = new FileInfo(saveSetting.DataPath);
            else
                fileInfo = new FileInfo(saveSetting.PersistentDataPath);

            if (!fileInfo.Exists)
            {
                return false;
            }

            using (FileStream stream = fileInfo.OpenRead())
            {
                try
                {
                    if (stream.Length <= 0)
                    {
                        stream.Close();
                        return false;
                    }

                    byte[] byteData = new byte[stream.Length];

                    stream.Read(byteData, 0, byteData.Length);

                    string context = UTF8Encoding.UTF8.GetString(byteData);

                    stream.Close();

                    if (string.IsNullOrEmpty(context))
                    {
                        return false;
                    }


                    switch (saveSetting.EncryptType)
                    {
                        case EncryptType.None:
                            break;
                        case EncryptType.AES:
                            context = EncryptUtil.UnAesStr(context, "nfsqyddbhhszd", "bpnmawsdssh");
                            break;
                    }

                    t = JsonMapper.ToObject<T>(context);
                    Debug.Log(string.Format("{0}:{1}", t.GetType().Name, "读取成功"));
                }
                catch (Exception e)
                {
                    Debug.Log(string.Format("{0}:{1}", t.GetType().Name, e));
                    return false;
                }
            }

            return true;
        }

        public bool ReadAsyn(ref T t)
        {
            return true;
        }

        public bool ReadAsyn(ref T t, string path)
        {
            return true;
        }

        public bool ReadAsyn(ref T t, SaveSetting saveSetting)
        {
            return true;
        }
    }
}