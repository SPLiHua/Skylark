using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class TxtReader
    {
        struct LineData
        {
            public string[] columnArr;
        }

        string m_FileData = "";
        int m_ColumnCount;
        string[] m_ColName;
        List<LineData> m_LinesList = new List<LineData>();
        List<string> m_SinglelineList = new List<string>(512);

        public bool ParseData(string fileData, int start_line = 3, int colNameLine = 0)
        {
            m_FileData = fileData;
            if (m_FileData == null)
            {
                return false;
            }

            int line_num = 0;
            int filed_cur = 0;
            string field;
            int fieldLen;
            for (int i = 0; i < m_FileData.Length; ++i)
            {
                switch (m_FileData[i])
                {
                    case '\t':   //横向跳到下一制表位置
                        field = m_FileData.Substring(filed_cur, i - filed_cur);
                        m_SinglelineList.Add(field);
                        filed_cur = i + 1;
                        continue;
                    case '\r':   //回车
                        //忽略
                        continue;
                    case '\n':   //换行
                        ++line_num;
                        if ((start_line > 0) && ((int)line_num < start_line))
                        {
                            continue;
                        }
                        if (m_FileData[i - 1] == '\r')
                        {
                            fieldLen = i - filed_cur - 1;
                        }
                        else
                        {
                            fieldLen = i - filed_cur;
                        }
                        field = m_FileData.Substring(filed_cur, fieldLen);
                        m_SinglelineList.Add(field);
                        LineData ld;
                        ld.columnArr = m_SinglelineList.ToArray();
                        m_LinesList.Add(ld);
                        filed_cur = i + 1;
                        if (m_ColumnCount == 0)
                        {
                            m_ColumnCount = m_SinglelineList.Count;
                        }
                        if (line_num - 1 == colNameLine)
                        {
                            m_ColName = ld.columnArr;
                        }
                        m_SinglelineList.Clear();
                        break;
                    default:
                        break;
                }
            }
            return true;
        }

        public string[] GetColName()
        {
            return m_ColName;
        }

        public string GetField(int row, int colomu)
        {
            return m_LinesList[row].columnArr[colomu];
        }

        public string[] GetARow(int row)
        {
            return m_LinesList[row].columnArr;
        }

        public int GetCols()
        {
            return m_ColumnCount;
        }

        public int GetRows()
        {
            return m_LinesList.Count;
        }

        public int ReadInt(int row, string colName)
        {
            string data = GetData(row, colName);

            if (null == data)
            {
                return 0;
            }
            else
            {
                return Utility.UtilityTable.String2Int(data);
            }
        }

        public bool ReadBool(int row, string colName)
        {
            string data = GetData(row, colName);

            if (null == data)
            {
                return false;
            }
            else
            {
                return Utility.UtilityTable.String2Bool(data);
            }
        }

        public long ReadInt64(int row, string colName)
        {
            string data = GetData(row, colName);

            if (null == data)
            {
                return 0;
            }
            else
            {
                return Utility.UtilityTable.String2Int64(data);
            }
        }

        public string ReadString(int row, string colName)
        {
            string data = GetData(row, colName);

            if (null == data)
            {
                return "";
            }
            else
            {
                return data;
            }
        }

        public float ReadFloat(int row, string colName)
        {
            string data = GetData(row, colName);

            if (null == data)
            {
                return 0f;
            }
            else
            {
                return Utility.UtilityTable.String2Float(data);
            }
        }

        public int[] ReadIntArray(int row, string colName, char split)
        {
            string data = GetData(row, colName);

            if (!Utility.UtilityTable.IsConfigStringValid(data))
            {
                return new int[0];
            }

            string[] datas = data.Split(new char[] { split });

            int[] rets = new int[datas.Length];

            for (int i = 0; i < rets.Length; ++i)
            {
                rets[i] = Utility.UtilityTable.String2Int(datas[i]);
            }

            return rets;
        }

        public long[] ReadInt64Array(int row, string colName, char split)
        {
            string data = GetData(row, colName);

            if (!Utility.UtilityTable.IsConfigStringValid(data))
            {
                return new long[0];
            }

            string[] datas = data.Split(new char[] { split });

            long[] rets = new long[datas.Length];

            for (int i = 0; i < rets.Length; ++i)
            {
                rets[i] = Utility.UtilityTable.String2Int64(datas[i]);
            }

            return rets;
        }

        public string[] ReadStringArray(int row, string colName, char split)
        {
            string data = GetData(row, colName);

            if (!Utility.UtilityTable.IsConfigStringValid(data))
            {
                return new string[0];
            }

            string[] datas = data.Split(new char[] { split });

            return datas;
        }

        string GetData(int row, string colName)
        {
            if (row >= m_LinesList.Count)
            {
                return null;
            }

            int col = GetColIndex(colName);

            if (col < 0)
            {
                return null;
            }

            return m_LinesList[row].columnArr[col];
        }

        int GetColIndex(string colName)
        {
            if (null == colName)
            {
                return -1;
            }

            for (int i = 0; i < m_ColName.Length; ++i)
            {
                if (m_ColName[i] == colName)
                {
                    return i;
                }
            }

            return -1;
        }
    }
}