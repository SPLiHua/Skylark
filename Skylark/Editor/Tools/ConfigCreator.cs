using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Skylark.Editor
{
    public class ConfigCreator
    {
        [MenuItem("Assets/Skylark/Config/SDKConfig")]
        public static void BuildSDKConfig()
        {
            SDKConfig data = null;
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            string spriteDataPath = folderPath + "/SDKConfig.asset";

            data = AssetDatabase.LoadAssetAtPath<SDKConfig>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<SDKConfig>();
                AssetDatabase.CreateAsset(data, spriteDataPath);
            }
            EditorUtility.SetDirty(data);
            AssetDatabase.SaveAssets();
        }

        // [MenuItem("Assets/Skylark/Config/DataSavePathConfig")]
        // public static void BuildDataSavePathConfig()
        // {
        //     DataSavePathConfig data = null;
        //     string folderPath = EditorUtils.GetSelectedDirAssetsPath();
        //     string spriteDataPath = folderPath + "/DataSavePathConfig.asset";

        //     data = AssetDatabase.LoadAssetAtPath<DataSavePathConfig>(spriteDataPath);
        //     if (data == null)
        //     {
        //         data = ScriptableObject.CreateInstance<DataSavePathConfig>();
        //         AssetDatabase.CreateAsset(data, spriteDataPath);
        //     }
        //     EditorUtility.SetDirty(data);
        //     AssetDatabase.SaveAssets();
        // }
    }
}