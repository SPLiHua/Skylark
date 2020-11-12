using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class DataStreamReader
    {
        public enum FieldType
        {
            UnKnown,
            Int,
            Float,
            String,
            Vector2,
            Vector3,
            Bool,
        }

        private TxtReader m_TxtReader;
        private int m_Column;
        private int m_CurColumn;
        private int m_CurRow = 0;

        private string[] m_SchemeNameArr;
        private const int FILETYPE_ROW = 1;
        private const int FIELDNAME_ROW = 2;
        private const int SCHEME_ROW_LEN = 3;
        private FieldType[] m_FieldTypeArr;

        public DataStreamReader(byte[] data)
        {
            if (data == null)
            {
                return;
            }

            m_TxtReader = new TxtReader();
            m_TxtReader.ParseData(System.Text.UTF8Encoding.UTF8.GetString(data), 0, FIELDNAME_ROW);
            m_SchemeNameArr = m_TxtReader.GetColName();
            m_Column = m_TxtReader.GetCols();
            PreReadFieldType();
            SkipSchemeName();
        }

        private void SkipSchemeName()
        {
            m_CurRow += SCHEME_ROW_LEN;
        }

        private void PreReadFieldType()
        {
            m_FieldTypeArr = new FieldType[m_Column];
            for (int i = 0; i < m_FieldTypeArr.Length; ++i)
            {
                string ret = m_TxtReader.ReadString(FILETYPE_ROW, m_SchemeNameArr[i]);
                switch (ret)
                {
                    case "bool":
                        m_FieldTypeArr[i] = FieldType.Bool;
                        break;
                    case "int":
                        m_FieldTypeArr[i] = FieldType.Int;
                        break;
                    case "float":
                        m_FieldTypeArr[i] = FieldType.Float;
                        break;
                    case "string":
                        m_FieldTypeArr[i] = FieldType.String;
                        break;
                    default:
                        m_FieldTypeArr[i] = FieldType.UnKnown;
                        break;
                }
            }
        }

        public int GetRowCount()
        {
            return m_TxtReader.GetRows() - SCHEME_ROW_LEN;
        }

        public int[] GetFieldIndex(Dictionary<string, int> fieldSourceMap)
        {
            int[] ret = new int[m_Column];
            for (int i = 0; i < m_Column; i++)
            {
                string key = m_SchemeNameArr[i];
                if (fieldSourceMap.ContainsKey(key))
                {
                    ret[i] = fieldSourceMap[key];
                }
                else
                {
                    ret[i] = -1;
                }
            }
            return ret;
        }

        public void CheckFieldMatch(Dictionary<string, int> fieldSourceMap, string tableName)
        {
            // Check New Field Add
            for (int i = 0; i < m_Column; ++i)
            {
                string key = m_SchemeNameArr[i];
                if (!fieldSourceMap.ContainsKey(key))
                {
                    Log.W(string.Format("Found a new Field :{0} In {1}",
                        key, tableName));
                }
            }

            //Check Filed Remove
            foreach (string key in fieldSourceMap.Keys)
            {
                bool findKey = false;
                for (int i = 0; i < m_SchemeNameArr.Length; ++i)
                {
                    if (m_SchemeNameArr[i].Equals(key))
                    {
                        findKey = true;
                        break;
                    }
                }
                if (!findKey)
                {
                    Log.E(string.Format("Field :{0}  removed In {1}",
                        key, tableName));
                }
            }
        }

        public int MoreFieldOnRow()
        {
            if (m_CurColumn >= m_Column)
            {
                m_CurColumn = 0;
                m_CurRow += 1;
                return -1;
            }
            else
            {
                return m_CurColumn;
            }
        }

        public void SkipField()
        {
            m_CurColumn += 1;
        }


        public Vector3 ReadVector3()
        {
            string str = ReadString();
            return Utility.UtilityTable.String2Vector3(str);
        }

        public Vector2 ReadVector2()
        {
            string str = ReadString();
            return Utility.UtilityTable.String2Vector2(str);
        }

        public int ReadInt()
        {
            int ret = m_TxtReader.ReadInt(m_CurRow, m_SchemeNameArr[m_CurColumn]);
            m_CurColumn += 1;
            return ret;
        }

        public bool ReadBool()
        {
            bool ret = m_TxtReader.ReadBool(m_CurRow, m_SchemeNameArr[m_CurColumn]);
            m_CurColumn += 1;
            return ret;

        }

        public float ReadFloat()
        {
            float ret = m_TxtReader.ReadFloat(m_CurRow, m_SchemeNameArr[m_CurColumn]);
            m_CurColumn += 1;
            return ret;
        }

        public string ReadString()
        {
            string ret = m_TxtReader.ReadString(m_CurRow, m_SchemeNameArr[m_CurColumn]);
            m_CurColumn += 1;
            return ret;
        }
    }
}