using System;
using System.IO;
using System.Xml.Serialization;
using System.Text;
using LitJson;
using UnityEngine;

namespace Skylark
{
    public class SerializeHelper
    {
        public static bool SerializeJson(string path, object obj, bool encry)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("SerializeJson Without Valid Path.");
                return false;
            }

            if (obj == null)
            {
                Debug.Log("SerializeJson obj is Null.");
                return false;
            }

            string jsonValue = null;
            try
            {
                jsonValue = JsonMapper.ToJson(obj);
                if (encry)
                {
                    jsonValue = EncryptUtil.AesStr(jsonValue, "weoizkxjkfs", "asjkdyweucn");
                }
            }
            catch (Exception e)
            {
                Debug.Log(e);
                return false;
            }

            FileInfo fileInfo = new FileInfo(path);
            if (fileInfo.Exists)
            {
                fileInfo.Delete();
            }

            using (FileStream fs = new FileStream(path, FileMode.OpenOrCreate))
            {
                byte[] writeDataArray = UTF8Encoding.UTF8.GetBytes(jsonValue);
                fs.Write(writeDataArray, 0, writeDataArray.Length);
                fs.Flush();
            }

            return true;
        }

        public static T DeserializeJson<T>(Stream stream, bool encry)
        {
            if (stream == null)
            {
                Debug.Log("DeserializeJson Failed!");
                return default(T);
            }

            using (stream)
            {
                try
                {
                    if (stream.Length <= 0)
                    {
                        stream.Close();
                        return default(T);
                    }

                    byte[] byteData = new byte[stream.Length];

                    stream.Read(byteData, 0, byteData.Length);

                    string context = UTF8Encoding.UTF8.GetString(byteData);

                    stream.Close();

                    if (string.IsNullOrEmpty(context))
                    {
                        return default(T);
                    }

                    if (encry)
                    {
                        context = EncryptUtil.UnAesStr(context, "weoizkxjkfs", "asjkdyweucn");
                    }

                    return JsonMapper.ToObject<T>(context);
                }
                catch (Exception e)
                {
                    Debug.Log(e);
                }
            }

            Debug.Log("DeserializeBinary Failed!");
            return default(T);
        }

        //public static T DeserializeJsonRelativePath<T>(string path, bool encry)
        // {
        //     if (string.IsNullOrEmpty(path))
        //     {
        //         Debug.Log("DeserializeJson Without Valid Path.");
        //         return default(T);
        //     }

        //     try
        //     {
        //         byte[] byteData = FileMgr.S.ReadSync(path);

        //         string context = UTF8Encoding.UTF8.GetString(byteData);

        //         if (string.IsNullOrEmpty(context))
        //         {
        //             return default(T);
        //         }

        //         if (encry)
        //         {
        //             context = EncryptUtil.UnAesStr(context, "weoizkxjkfs", "asjkdyweucn");
        //         }

        //         return JsonMapper.ToObject<T>(context);

        //     }
        //     catch (Exception e)
        //     {
        //         Debug.Log(e);
        //     }

        //     Debug.Log("DeserializeJson Failed!");
        //     return default(T);
        // }

        public static T DeserializeJson<T>(string path, bool encry)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("DeserializeJson Without Valid Path.");
                return default(T);
            }

            FileInfo fileInfo = new FileInfo(path);

            if (!fileInfo.Exists)
            {
                return default(T);
            }

            using (FileStream stream = fileInfo.OpenRead())
            {
                try
                {
                    if (stream.Length <= 0)
                    {
                        stream.Close();
                        return default(T);
                    }

                    byte[] byteData = new byte[stream.Length];

                    stream.Read(byteData, 0, byteData.Length);

                    string context = UTF8Encoding.UTF8.GetString(byteData);

                    stream.Close();

                    if (string.IsNullOrEmpty(context))
                    {
                        return default(T);
                    }

                    if (encry)
                    {
                        context = EncryptUtil.UnAesStr(context, "weoizkxjkfs", "asjkdyweucn");
                    }

                    return JsonMapper.ToObject<T>(context);
                }
                catch (Exception e)
                {
                    Debug.Log(e);
                }
            }

            Debug.Log("DeserializeJson Failed!");
            return default(T);
        }

        public static bool SerializeBinary(string path, object obj)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("SerializeBinary Without Valid Path.");
                return false;
            }

            if (obj == null)
            {
                Debug.Log("SerializeBinary obj is Null.");
                return false;
            }

            using (FileStream fs = new FileStream(path, FileMode.OpenOrCreate))
            {
                System.Runtime.Serialization.Formatters.Binary.BinaryFormatter bf = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                bf.Serialize(fs, obj);
                return true;
            }
        }

        public static object DeserializeBinary(Stream stream)
        {
            if (stream == null)
            {
                Debug.Log("DeserializeBinary Failed!");
                return null;
            }

            using (stream)
            {
                try
                {
                    System.Runtime.Serialization.Formatters.Binary.BinaryFormatter bf = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                    object data = bf.Deserialize(stream);

                    stream.Close();

                    if (data != null)
                    {
                        return data;
                    }
                }
                catch (Exception e)
                {
                    Debug.Log(e);
                }
            }

            Debug.Log("DeserializeBinary Failed!");
            return null;
        }

        public static object DeserializeBinary(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("DeserializeBinary Without Valid Path.");
                return null;
            }

            FileInfo fileInfo = new FileInfo(path);

            if (!fileInfo.Exists)
            {
                Debug.Log("DeserializeBinary File Not Exit.");
                return null;
            }

            using (FileStream fs = fileInfo.OpenRead())
            {
                System.Runtime.Serialization.Formatters.Binary.BinaryFormatter bf = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                object data = bf.Deserialize(fs);

                if (data != null)
                {
                    return data;
                }
            }

            Debug.Log("DeserializeBinary Failed:" + path);
            return null;
        }

        public static bool SerializeXML(string path, object obj)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("SerializeBinary Without Valid Path.");
                return false;
            }

            if (obj == null)
            {
                Debug.Log("SerializeBinary obj is Null.");
                return false;
            }

            if (File.Exists(path))
            {
                File.Delete(path);
            }

            using (FileStream fs = new FileStream(path, FileMode.CreateNew))
            {
                XmlSerializer xmlserializer = new XmlSerializer(obj.GetType());
                xmlserializer.Serialize(fs, obj);
                return true;
            }
        }

        public static object DeserializeXML<T>(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                Debug.Log("DeserializeBinary Without Valid Path.");
                return null;
            }

            FileInfo fileInfo = new FileInfo(path);

            using (FileStream fs = fileInfo.OpenRead())
            {
                XmlSerializer xmlserializer = new XmlSerializer(typeof(T));
                object data = xmlserializer.Deserialize(fs);

                if (data != null)
                {
                    return data;
                }
            }

            Debug.Log("DeserializeBinary Failed:" + path);
            return null;
        }
    }
}
