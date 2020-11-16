using UnityEngine;
using UnityEditor;
using System.IO;
using System;

namespace Skylark.Editor
{
    public class PrefabBatchHelper
    {
        [MenuItem("Tools/PrefabBatch")]
        private static void ChangePrefab()
        {
            //路径
            string fullPath = Application.dataPath + "/Bitgem/Cube_World_Cave/Prefabs/";
            Log.I(fullPath);
            //获得指定路径下面的所有资源文件
            if (Directory.Exists(fullPath))
            {
                DirectoryInfo dirInfo = new DirectoryInfo(fullPath);
                FileInfo[] files = dirInfo.GetFiles("*", SearchOption.AllDirectories); //包括子目录
                Log.I(files.Length);
                for (int i = 0; i < files.Length; i++)
                {
                    if (files[i].Name.EndsWith(".prefab"))
                    {
                        //Log.I("预制体名字" + files[i].Name);
                        string path = "Assets/Bitgem/Cube_World_Cave/Prefabs/" + files[i].Name;
                        //Log.I("预制体路径" + path);
                        GameObject obj = AssetDatabase.LoadAssetAtPath(path, typeof(GameObject)) as GameObject;
                        //Log.I("obj的名字" + obj.name);

                        //移除LOD相关
                        // if (obj.transform.GetComponent<LODGroup>())
                        // {
                        //     GameObject.DestroyImmediate(obj.transform.GetComponent<LODGroup>(), true);
                        // }

                        // Transform[] childs = obj.transform.GetComponentsInChildren<Transform>();
                        //Array.Reverse(childs);
                        // foreach (Transform child in childs)
                        // {
                        //     Log.I("child的名字" + child.name);

                        //     if (child.name.Contains("LOD0") || child.name.Contains("LOD1"))
                        //     {
                        //         GameObject.DestroyImmediate(child.gameObject, true);
                        //     }
                        // }

                        //添加collider
                        if (!obj.GetComponent<Collider>())
                        {
                            obj.AddComponent<BoxCollider>();
                        }

                        //通知你的编辑器 obj 改变了
                        EditorUtility.SetDirty(obj);
                        //保存修改
                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();
                    }
                }
            }
            else
            {
                Log.I("资源路径不存在");
            }
        }
    }
}