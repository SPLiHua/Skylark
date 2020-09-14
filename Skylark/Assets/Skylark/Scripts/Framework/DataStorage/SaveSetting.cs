using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public enum SaveType
    {
        Json, XML, Sqlite, Stream, File
    }

    public enum EncryptType
    {
        None, MD5, SHA, HMAC, AES, DES, BASE64,
    }

    [System.Serializable]
    public class SaveSetting
    {
        public string DataName;
        public string PersistentDataPath
        {
            get
            {
                return string.Format("{0}/{1}.json", Application.persistentDataPath, DataName);
            }
        }
        public string StreamingAssetsPath
        {
            get
            {
                return string.Format("{0}/{1}.json", Application.streamingAssetsPath, DataName);
            }
        }
        public string DataPath;
        public bool BAutoSave;
        public SaveType SaveType;
        public EncryptType EncryptType;
        public bool BAysn;

        public SaveSetting(string dataName)
        {
            DataName = dataName;
            BAutoSave = false;
            SaveType = SaveType.Json;
            EncryptType = EncryptType.AES;
            BAysn = false;
        }

        public SaveSetting(string dataName, string dataPath, bool autoSave = true, SaveType saveType = SaveType.Json,
         EncryptType encrypyType = EncryptType.AES, bool bAysn = false)
        {
            DataName = dataName;
            DataPath = dataPath;
            BAutoSave = autoSave;
            SaveType = saveType;
            EncryptType = encrypyType;
            BAysn = bAysn;
        }
    }
}