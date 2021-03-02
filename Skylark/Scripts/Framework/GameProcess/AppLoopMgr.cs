using System;

namespace Skylark
{
    public class AppLoopMgr : MonoSingleton<AppLoopMgr>
    {
        public event Action onUpdate;

        private void Update()
        {
            if (onUpdate != null)
            {
                try
                {
                    onUpdate();
                }
                catch (Exception e)
                {
                    Log.E(e);
                }
            }
        }
    }
}
