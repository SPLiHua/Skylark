﻿using UnityEngine;
using UnityEditor;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Skylark.Editor
{
    public class SpritesDataBuilder
    {
        [MenuItem("Assets/Skylark/Build SpritesData")]
        private static void BuildSpritesDataInFolder()
        {
            string folderPath = EditorUtils.GetSelectedDirAssetsPath();
            DirectoryInfo dInfo = new DirectoryInfo(EditorUtils.AssetsPath2ABSPath(folderPath));
            DirectoryInfo[] subFolders = dInfo.GetDirectories();
            if (subFolders == null || subFolders.Length == 0)
            {
                BuildSpritesData(folderPath);
            }
            else
            {
                for (int i = 0; i < subFolders.Length; ++i)
                {
                    BuildSpritesData(EditorUtils.ABSPath2AssetsPath(subFolders[i].FullName));
                }
            }
        }

        public static void BuildSpritesData(string folderPath)
        {
            SpritesData data = null;

            string folderName = PathHelper.FullAssetPath2Name(folderPath);
            string spriteDataPath = folderPath + "/" + folderName + "SpritesData.asset";

            data = AssetDatabase.LoadAssetAtPath<SpritesData>(spriteDataPath);
            if (data == null)
            {
                data = ScriptableObject.CreateInstance<SpritesData>();
                data.atlasName = folderPath;
                AssetDatabase.CreateAsset(data, spriteDataPath);
            }

            data.ClearAllSprites();

            string workPath = EditorUtils.AssetsPath2ABSPath(folderPath);
            var filePaths = Directory.GetFiles(workPath);
            string spritePackingTag = folderPath.ToLower();
            for (int i = 0; i < filePaths.Length; ++i)
            {
                string relPath = EditorUtils.ABSPath2AssetsPath(filePaths[i]);
                UnityEngine.Object[] objs = AssetDatabase.LoadAllAssetsAtPath(relPath);

                if (objs != null)
                {
                    for (int j = 0; j < objs.Length; ++j)
                    {
                        if (objs[j] is Sprite)
                        {
                            data.AddSprite(objs[j] as Sprite);
                        }
                        else if (objs[j] is Texture2D)
                        {
                            ProcessSpriteTextureImport(relPath, spritePackingTag);
                        }
                    }
                }
            }

            EditorUtility.SetDirty(data);
            AssetDatabase.SaveAssets();
            Debug.Log("Success Process SpriteImport:" + folderPath);
        }

        protected static bool ProcessSpriteTextureImport(string texPath, string spritePackingTag)
        {
            TextureImporter import = AssetImporter.GetAtPath(texPath) as TextureImporter;
            if (import == null)
            {
                return false;
            }

            if (import.spritePackingTag == spritePackingTag)
            {
                return false;
            }

            import.spritePackingTag = spritePackingTag;
            import.textureCompression = TextureImporterCompression.Uncompressed;
            AssetDatabase.ImportAsset(texPath);
            //EditorUtility.SetDirty(import);
            return true;
        }
    }
}
