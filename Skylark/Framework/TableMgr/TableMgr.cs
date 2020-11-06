using System;
using System.Collections;

namespace Skylark
{
    public class TableMgr : Singleton<TableMgr>
    {
        private float m_TableReadProgress;
        private bool m_IsLoading = false;

        public float tableReadProgress
        {
            get { return m_TableReadProgress; }
        }

        public bool isLoading
        {
            get { return m_IsLoading; }
        }

        /// <summary>
        /// 预先读取Language Const表
        /// </summary>
        /// <returns></returns>
        public IEnumerator PreReadAll(Action onLoadFinish)
        {
            TableReadThreadWork readWork = CreateTableReadJobs(TableConfig.preLoadTableArray);

            readWork.Start();
            while (readWork.m_IsDone == false)
            {
                yield return 0;
            }

            if (onLoadFinish != null)
            {
                onLoadFinish();
            }
            yield return 0;
        }

        public IEnumerator ReadAll(TDTableMetaData[] dataArray, Action onLoadFinish)
        {
            m_IsLoading = true;
            TableReadThreadWork readWork = CreateTableReadJobs(dataArray);
            readWork.Start();
            while (readWork.m_IsDone == false)
            {
                m_TableReadProgress = readWork.finishedCount * 1.0f / readWork.readMaxCount * 1.0f;
                yield return 0;
            }

            m_IsLoading = false;

            if (onLoadFinish != null)
            {
                onLoadFinish();
            }
            yield return 0;
        }

        private TableReadThreadWork CreateTableReadJobs(TDTableMetaData[] tableArrayA, TDTableMetaData[] tableArrayB = null)
        {
            TableReadThreadWork readWork = new TableReadThreadWork();
            if (tableArrayA != null)
            {
                for (int i = 0; i < tableArrayA.Length; ++i)
                {
                    readWork.AddJob(tableArrayA[i]);
                }
            }

            if (tableArrayB != null)
            {
                for (int i = 0; i < tableArrayB.Length; ++i)
                {
                    readWork.AddJob(tableArrayB[i]);
                }
            }

            return readWork;
        }

        public void ReloadAll()
        {

        }
    }
}