using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Skylark
{
    public class PlayerPrefsHelper : IPlayerPrefsHelper
    {
        public void Init()
        {

        }

        public void Reset()
        {
        }

        public void Save()
        {
        }

        public void SetBool(string key, bool value)
        {
            float fvalue = -1;
            if (value)
            {
                fvalue = 1;
            }
            else
            {
                fvalue = 0;
            }
            PlayerPrefs.SetFloat(key, fvalue);
        }

        public bool GetBool(string key, bool defaultValue = false)
        {
            float fvalue = PlayerPrefs.GetFloat(key, 0);

            if (fvalue == 1 || defaultValue)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void SetFloat(string key, float value)
        {
            PlayerPrefs.SetFloat(key, value);
        }

        public float GetFloat(string key, float defaultValue = 0)
        {
            return PlayerPrefs.GetFloat(key, defaultValue);
        }

        public void SetInt(string key, int value)
        {
            PlayerPrefs.SetString(key, value.ToString());
        }

        public int GetInt(string key, int defaultValue = 0)
        {
            string svalue = PlayerPrefs.GetString(key);
            int value;
            if (!int.TryParse(svalue, out value))
            {
                return defaultValue;
            }
            return value;
        }

        public string GetString(string key, string defaultValue = "")
        {
            return PlayerPrefs.GetString(key, defaultValue);
        }

        public void SetString(string key, string value)
        {
            PlayerPrefs.SetString(key, value);
        }
    }
}