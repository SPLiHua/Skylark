using System;

namespace Skylark
{
    public static partial class Utility
    {
        public static class TypeCast
        {
            public static T ParseEnum<T>(string value)
            {
                return (T)Enum.Parse(typeof(T), value, true);
            }
        }
    }
}