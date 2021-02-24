﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Skylark.Table;
using System.IO;
using System.Text;

namespace Skylark
{
    public class TableModule : IModule
    {
        private bool m_IsTableLoadFinish = false;

        public bool isTableLoadFinish
        {
            get { return m_IsTableLoadFinish; }
        }

        public static Dictionary<string, byte[]> m_DataMap;

        public void Init()
        {
            HandleTableDataAES();
            InitPreLoadTableMetaData();
            InitDelayLoadTableMetaData();
            m_IsTableLoadFinish = false;
            ApplicationMgr.S.StartCoroutine(TableMgr.S.PreReadAll(HandleTableLoadFinish));
            EventSystem.S.Register(EngineEventID.OnLanguageChange, OnLanguageSwitch);
        }

        private void HandleTableDataAES()
        {
            m_DataMap = new Dictionary<string, byte[]>();

            string content;
            DirectoryInfo root = new DirectoryInfo(UnityEngine.Application.streamingAssetsPath + "/config");
            FileInfo[] files = root.GetFiles();
            foreach (var item in files)
            {
                if (item.FullName.Contains("meta"))
                {
                    continue;
                }

                using (StreamReader sr = item.OpenText())
                {
                    content = sr.ReadToEnd();
                    content = EncryptUtil.UnAesStr(content, SaveSetting.m_AESKeyValue, SaveSetting.m_AESIvValue);
                    byte[] data = System.Text.UTF8Encoding.UTF8.GetBytes(content);
                    m_DataMap.Add(item.Name.Replace(".txt", ""), data);
                    sr.Close();
                }
            }
        }

        protected void HandleTableLoadFinish()
        {
            OnTableLoadFinish();
            m_IsTableLoadFinish = true;
        }

        protected virtual void OnTableLoadFinish()
        {

        }

        protected void OnLanguageSwitch(int key, params object[] args)
        {
            SwitchLanguage(I18NMgr.S.langugePrefix);
        }

        public void SwitchLanguage(string key)
        {
            TDTableMetaData[] tables = new TDTableMetaData[]
            {
               TDLanguageTable.GetLanguageMetaData(),
            };

            m_IsTableLoadFinish = false;
            ApplicationMgr.S.StartCoroutine(TableMgr.S.ReadAll(tables, OnLanguageSwitchLoadFinish));
        }

        private void OnLanguageSwitchLoadFinish()
        {
            m_IsTableLoadFinish = true;
            Log.I("OnLanguageSwitchLoadFinish.");
            AutoTranslation.ReTranslationAll();
            EventSystem.S.Send(EngineEventID.OnLanguageTableSwitchFinish);
        }


        private void InitPreLoadTableMetaData()
        {
            TableConfig.preLoadTableArray = new TDTableMetaData[]
            {
                TDLanguageTable.GetLanguageMetaData(),
                TDPropsTable.metaData,
                TDPropsEntityTable.metaData,
                TDRolesTable.metaData,
                TDSkillsTable.metaData,
                TDConstTable.metaData,
                TDBasePropertyTable.metaData,
                TDChestTable.metaData,
                TDMonsterTable.metaData,
                TDStageTable.metaData,
                TDPayTable.metaData,
                TDBossTable.metaData,
                // TDGuideTable.metaData,
                // TDGuideStepTable.metaData,
                // TDSocialAdapterTable.metaData,
                // TDAdConfigTable.metaData,
                // TDAdPlacementTable.metaData,
                // TDAppConfigTable.metaData,
                // TDRemoteConfigTable.metaData,
                // TDPurchaseTable.metaData,
            };
        }

        private void InitDelayLoadTableMetaData()
        {
            TableConfig.delayLoadTableArray = new TDTableMetaData[]
            {

            };
        }
    }
}