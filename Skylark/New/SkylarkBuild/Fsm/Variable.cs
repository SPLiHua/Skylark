using System.Collections;
using System;

namespace Skylark
{
    public abstract class Variable
    {
        protected Variable()
        {
        }

        public abstract Type Type
        {
            get;
        }

        public abstract object GetValue();
        public abstract void SetValue(object value);
        public abstract void Reset();
    }
}