using System;
using UnityEngine;

namespace Skylark
{
    public static partial class Utility
    {
        public static class UtilityTable
        {
            public static Vector2 String2Vector2(string pos)
            {
                return String2Vector2(pos, ',');
            }

            public static Vector2 String2Vector2(string pos, char split)
            {
                if (string.IsNullOrEmpty(pos))
                {
                    return Vector2.zero;
                }

                char[] splits = new char[1] { split };
                string[] str = pos.Split(splits);

                float x = str.Length > 0 ? String2Float(str[0]) : 0f;
                float y = str.Length > 1 ? String2Float(str[1]) : 0f;

                Vector2 ret = new Vector2(x, y);

                return ret;
            }

            public static Vector3 String2Vector3(string pos)
            {
                return String2Vector3(pos, ',');
            }

            public static Vector3 String2Vector3(string pos, char split)
            {
                if (string.IsNullOrEmpty(pos))
                {
                    return Vector3.zero;
                }

                char[] splits = new char[1] { split };
                string[] str = pos.Split(splits);

                float x = str.Length > 0 ? String2Float(str[0]) : 0f;
                float y = str.Length > 1 ? String2Float(str[1]) : 0f;
                float z = str.Length > 2 ? String2Float(str[2]) : 0f;

                Vector3 ret = new Vector3(x, y, z);

                return ret;
            }

            public static float String2Float(string value)
            {
                float ret = 0;
                float.TryParse(value, out ret);

                return ret;
            }

            public static int String2Int(string value)
            {
                int ret = 0;
                int.TryParse(value, out ret);

                return ret;
            }


            public static bool String2Bool(string value)
            {
                bool ret = false;
                if (String2Int(value) > 0)
                {
                    return true;
                }
                else
                {
                    bool.TryParse(value, out ret);
                }
                return ret;
            }

            public static long String2Int64(string value)
            {
                Int64 ret = 0;
                Int64.TryParse(value, out ret);

                return ret;
            }

            // 从表格读取的是否有效数据，空或者-1为无效数据
            public static bool IsConfigStringValid(string value)
            {
                if (string.IsNullOrEmpty(value))
                {
                    return false;
                }

                if (value == "-1")
                {
                    return false;
                }

                if (value.Equals("null") ||
                    value.Equals("Null") ||
                    value.Equals("NULL"))
                {
                    return false;
                }

                return true;
            }
        }
    }
}