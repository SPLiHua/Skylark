using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class TableModule : IModule
    {
        private bool m_IsTableLoadFinish = false;

        public bool isTableLoadFinish
        {
            get { return m_IsTableLoadFinish; }
        }

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
                // TDConstTable.metaData,
                TDLanguageTable.GetLanguageMetaData(),
                // TDGuideTable.metaData,
                // TDGuideStepTable.metaData,
                // TDSocialAdapterTable.metaData,
                // TDAdConfigTable.metaData,
                // TDAdPlacementTable.metaData,
                // TDAppConfigTable.metaData,
                // TDRemoteConfigTable.metaData,
                // TDPurchaseTable.metaData,
                // TDFishTable.metaData,
                // TDFishPriceTable.metaData,
                // TDSpinTable.metaData,
                // TDPlayerLevelTable.metaData,
                // TDTaskTable.metaData,
                // TDEquipTable.metaData,
                // TDFreeLevelUpTable.metaData,
                // TDShopItemTable.metaData,
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