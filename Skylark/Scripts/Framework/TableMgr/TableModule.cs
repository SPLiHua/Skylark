using System.Collections;
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
            InitPreLoadTableMetaData();
            InitDelayLoadTableMetaData();
            m_IsTableLoadFinish = false;
            ApplicationMgr.S.StartCoroutine(TableMgr.S.PreReadAll(HandleTableLoadFinish));
            EventSystem.S.Register(EngineEventID.OnLanguageChange, OnLanguageSwitch);
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
                TDGuideTable.metaData,
                TDGuideStepTable.metaData,

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