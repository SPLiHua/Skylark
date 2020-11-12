using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;

namespace Skylark
{
    public class TableReadThreadWork
    {
        class ReadParams
        {
            public TDTableMetaData tdTableMetaData;
            public byte[] fileData;
            public string filePath;
        }

        private Queue<ReadParams> m_RequestFilePathQueue = null;

        public TableReadThreadWork()
        {
            m_RequestFilePathQueue = new Queue<ReadParams>();
        }

        public void AddJob(TDTableMetaData tdTableMetaData)
        {
            if (tdTableMetaData.OnParse == null)
            {
                return;
            }
            var readParam = CreateReadParams(tdTableMetaData);
            m_RequestFilePathQueue.Enqueue(readParam);
        }

        private ReadParams CreateReadParams(TDTableMetaData tdTableMetaData)
        {
            ReadParams readParam = new ReadParams();
            readParam.filePath = GetTableFilePath(tdTableMetaData.TableName);
            readParam.tdTableMetaData = tdTableMetaData;
            return readParam;
        }

        private Thread m_Thread = null;
        public bool m_IsDone = false;
        private int m_ReadMaxCount = 0;
        private int m_FinishedCount = 0;
        public int finishedCount
        {
            get { return m_FinishedCount; }
        }

        public int readMaxCount
        {
            get { return m_ReadMaxCount; }
        }

        public void Start()
        {
            //初始化 避免在子线程调用mono
            FileMgr.S.InitStreamingAssetPath();
            m_IsDone = false;
            m_FinishedCount = 0;
            m_ReadMaxCount = m_RequestFilePathQueue.Count;
            m_Thread = new Thread(Work);
            m_Thread.Start();
        }

        private void Work()
        {
            ReadParams readparm;

            while (m_RequestFilePathQueue.Count > 0)
            {
                try
                {
                    readparm = m_RequestFilePathQueue.Dequeue();
                    byte[] fileData = FileMgr.S.ReadSync(readparm.filePath);
                    readparm.fileData = fileData;
                    bool isReadTxtSuccess = false;

                    //多国版优先读取 txt文件
                    if (isReadTxtSuccess == false)
                    {
                        ReadTable(readparm);
                    }
                    ++m_FinishedCount;
                }
                catch (Exception ex)
                {
                    Log.E(ex.ToString());
                }
            }
            m_IsDone = true;
        }

        private void ReadTable(ReadParams readparm)
        {
            if (readparm != null)
            {
                try
                {
                    readparm.tdTableMetaData.OnParse(readparm.fileData);
                }
                catch (System.Exception ex)
                {
                    Log.E("Parse table error TD" + readparm.tdTableMetaData.TableName);
                    Log.E(ex.ToString() + ex.StackTrace);
                }
            }
        }

        public static string GetTableFilePath(string fileName)
        {
#if USE_TABLE_XC
            return "config/" + fileName + ".xc";
#else
            return "config/" + fileName + ".txt";
#endif
        }
    }
}