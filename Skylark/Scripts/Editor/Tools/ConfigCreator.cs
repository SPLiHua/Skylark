﻿using System.Collections;
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

        [MenuItem("Assets/Skylark/Config/AppConfig")]
        public static void BuildAppConfig()
        {
            AppConfig data = null;
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            string spriteDataPath = folderPath + "/AppConfig.asset";

            data = AssetDatabase.LoadAssetAtPath<AppConfig>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<AppConfig>();
                AssetDatabase.CreateAsset(data, spriteDataPath);
            }
            EditorUtility.SetDirty(data);
            AssetDatabase.SaveAssets();
        }

        [MenuItem("Assets/Skylark/Config/ProjectPathConfig")]
        public static void BuildDataSavePathConfig()
        {
            ProjectPathConfig data = null;
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            string spriteDataPath = folderPath + "/ProjectPathConfig.asset";

            data = AssetDatabase.LoadAssetAtPath<ProjectPathConfig>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<ProjectPathConfig>();
                AssetDatabase.CreateAsset(data, spriteDataPath);
            }
            EditorUtility.SetDirty(data);
            AssetDatabase.SaveAssets();
        }

        [MenuItem("Assets/Skylark/Config/GamePersistentData")]
        public static void BuildDataGamePersistent()
        {
            GamePersistentData data = null;
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            string spriteDataPath = folderPath + "/GamePersistentData.asset";

            data = AssetDatabase.LoadAssetAtPath<GamePersistentData>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<GamePersistentData>();
                AssetDatabase.CreateAsset(data, spriteDataPath);
            }
            EditorUtility.SetDirty(data);
            AssetDatabase.SaveAssets();
        }

        [MenuItem("Assets/Skylark/Config/GameHelper")]
        public static void BuildGameHelper()
        {
            GameHelper data = null;
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            string spriteDataPath = folderPath + "/GameHelper.asset";

            data = AssetDatabase.LoadAssetAtPath<GameHelper>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<GameHelper>();
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