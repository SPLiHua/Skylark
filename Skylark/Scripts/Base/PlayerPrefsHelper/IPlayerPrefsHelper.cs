using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public interface IPlayerPrefsHelper
    {
        void Init();
        void Reset();
        void Save();
        bool GetBool(string key, bool defaultValue = false);

        string GetString(string key, string defaultValue = "");

        float GetFloat(string key, float defaultValue = 0);

        int GetInt(string key, int defaultValue = 0);

        void SetString(string key, string value);

        void SetBool(string key, bool value);

        void SetFloat(string key, float value);

        void SetInt(string key, int value);
    }

    public class PrefsRecord
    {
        private static IPlayerPrefsHelper s_Record;
        public static IPlayerPrefsHelper S
        {
            get
            {
                if (s_Record == null)
                {
                    s_Record = new PlayerPrefsHelper();
                    s_Record.Init();
                }
                return s_Record;
            }
        }
    }
}