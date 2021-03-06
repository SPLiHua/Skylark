﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class DataHandler<T> where T : BaseData, new()
    {
        protected IDataWriter<T> m_DataWriter;
        protected IDataReader<T> m_DataReader;
        public static T Data = new T();
        public SaveSetting m_SaveSetting;

        public virtual void Init()
        {
            Read();
            SetAutoSave();
        }

        public virtual void Write()
        {
            //SetSaveSetting(m_SaveSetting);
            if (m_SaveSetting == null)
                SetSaveSetting(typeof(T).FullName);
            m_DataWriter.Write(Data, m_SaveSetting);
            Data.ResetDataDirty();
        }

        /// <summary>
        /// 根据文件名写入
        /// </summary>
        /// <param name="name">文件名</param>
        public virtual void Write(string name, string path, EncryptType encryptType = EncryptType.None)
        {
            SetSaveSetting(name, path, encryptType);
            m_DataWriter.Write(Data, m_SaveSetting);
            Data.ResetDataDirty();
        }

        public virtual bool Read()
        {
            // int index;
            // SaveSetting temp = DataSavePathConfig.S.GetSaveSettingPath(typeof(T).FullName, out index);
            // if (temp != null)
            // {
            //     m_SaveSetting = temp;
            // }
            // else
            if (m_SaveSetting == null)
                SetSaveSetting(typeof(T).FullName);

            bool bReadSuccess = m_DataReader.Read(ref Data, m_SaveSetting);
            if (!bReadSuccess)
            {
                Data = new T();
                Data.InitWithEmptyData();
                Data.SetDirty();
            }
            Data.SetRecorder(new DataDirtyRecorder());
            Data.OnDataLoadFinish();
            return bReadSuccess;
        }

        /// <summary>
        /// 根据文件名读取无加密文件
        /// </summary>
        /// <param name="name">文件名</param>
        /// <returns></returns>
        public virtual bool Read(string name, string path, EncryptType encryptType = EncryptType.None)
        {
            SetSaveSetting(name, path, encryptType);
            bool bReadSuccess = m_DataReader.Read(ref Data, m_SaveSetting);
            if (Data == null)
            {
                Data = new T();
                Data.InitWithEmptyData();
                Data.SetDirty();
            }
            Data.SetRecorder(new DataDirtyRecorder());
            Data.OnDataLoadFinish();
            return bReadSuccess;
        }

        // public void SetSaveSetting(SaveSetting saveSetting)
        // {
        //     m_SaveSetting = saveSetting;

        //     return;
        //     int index;
        //     SaveSetting temp = DataSavePathConfig.S.GetSaveSettingPath(m_SaveSetting.DataName, out index);
        //     if (temp != null)
        //     {
        //         DataSavePathConfig.S.saveSettingList[index] = m_SaveSetting;
        //         Log.I(Data.GetType().Name + ":数据覆盖");
        //     }
        //     else
        //         DataSavePathConfig.S.saveSettingList.Add(m_SaveSetting);
        // }

        public void SetSaveSetting(string name, string path = "", EncryptType encryptType = EncryptType.AES)
        {
            m_SaveSetting = new SaveSetting(name, path, encryptType);
        }

        public void SetAutoSave()
        {
            m_SaveSetting.BAutoSave = true;
            EventSystem.S.Register(EngineEventID.OnApplicationPauseChange, OnAppPauseCallback);
            EventSystem.S.Register(EngineEventID.OnApplicationQuit, OnAppQuitCallback);
        }

        private void OnAppQuitCallback(int key, object[] param)
        {
            Write();
        }

        private void OnAppPauseCallback(int key, object[] param)
        {
            if (param != null && param.Length > 0)
            {
                bool bPause = (bool)param[0];
                if (m_SaveSetting.BAutoSave && bPause)
                {
                    Write();
                }
            }
        }
    }
}