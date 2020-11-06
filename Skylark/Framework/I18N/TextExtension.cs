using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Skylark
{
    public static class TextExtension
    {
        public static T SetTranText<T>(this T text, string key, params object[] m_Values) where T : Text
        {
            text.gameObject.AddComponent<AutoTranslation>().SetKeyValue(key, m_Values);
            return text;
        }
    }
}