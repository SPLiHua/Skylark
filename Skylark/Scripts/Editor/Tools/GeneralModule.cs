using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace Skylark.Editor
{
    public class GeneralModule
    {
        [MenuItem("DataClear/ClearPlayerPrefs")]
        public static void ClearPlayerPrefs()
        {
            PlayerPrefs.DeleteAll();
            PlayerPrefs.Save();
        }

        public static void DeleteTarget()
        {
            PlayerPrefs.DeleteKey(Selection.activeGameObject.name);
            PlayerPrefs.Save();
        }

        [MenuItem("DataClear/ClearPersistentData")]
        public static void ClearPersistentData()
        {
            try
            {
                DirectoryInfo dir = new DirectoryInfo(Application.persistentDataPath);
                FileSystemInfo[] fileinfo = dir.GetFileSystemInfos();  //返回目录中所有文件和子目录
                foreach (FileSystemInfo i in fileinfo)
                {
                    if (i is DirectoryInfo)            //判断是否文件夹
                    {
                        DirectoryInfo subdir = new DirectoryInfo(i.FullName);
                        subdir.Delete(true);          //删除子目录和文件
                    }
                    else
                    {
                        File.Delete(i.FullName);      //删除指定文件
                    }
                }
                //DataSavePathConfig.S.saveSettingList.Clear();
                Log.I("DeletePersistentData Success!");
            }
            catch (Exception e)
            {
                Log.E("DeletePersistentData failed:" + e);
                throw;
            }
        }
    }
}