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
        public string DataPath;
        public bool BAutoSave;
        public SaveType SaveType;
        public EncryptType EncryptType;
        public bool BAysn;

        public SaveSetting(string dataName, string path, EncryptType encryptType = EncryptType.AES)
        {
            DataName = dataName;
            BAutoSave = false;
            SaveType = SaveType.Json;
            EncryptType = encryptType;
            BAysn = false;
            if (string.IsNullOrEmpty(path))
            {
                DataPath = Application.persistentDataPath;
            }
            else
            {
                DataPath = path;
            }
        }

        // public SaveSetting(string dataName, string dataPath, bool autoSave = true, SaveType saveType = SaveType.Json,
        //  EncryptType encrypyType = EncryptType.AES, bool bAysn = false)
        // {
        //     DataName = dataName;
        //     DataPath = dataPath;
        //     BAutoSave = autoSave;
        //     SaveType = saveType;
        //     EncryptType = encrypyType;
        //     BAysn = bAysn;
        // }
    }
}