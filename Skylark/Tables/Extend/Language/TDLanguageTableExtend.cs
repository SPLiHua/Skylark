using UnityEngine;
using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Skylark
{
    public partial class TDLanguageTable
    {
        static void CompleteRowAdd(TDLanguage tdData)
        {

        }

        public static string GetFormat(string key, params object[] args)
        {
            string msg = Get(key);
            if (string.IsNullOrEmpty(msg))
            {
                return msg;
            }
            return string.Format(msg, args);
        }

        public static TDTableMetaData GetLanguageMetaData()
        {
            string key = I18NMgr.S.langugePrefix;

            string tableName = FormatTableName(TDLanguageTable.metaData.TableName, key);

            if (!FileMgr.S.FileExists(TableReadThreadWork.GetTableFilePath(tableName)))
            {
                return TDLanguageTable.metaData;
            }

            return new TDTableMetaData(TDLanguageTable.Parse, tableName);
        }

        private static string FormatTableName(string rawName, string key)
        {
            return string.Format("{0}_{1}", rawName, key);
        }

        public static void DumppAllKey()
        {
            for (int i = m_DataList.Count - 1; i >= 0; --i)
            {
                Log.I(m_DataList[i].id);
            }
        }
    }
}
