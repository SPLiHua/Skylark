using UnityEngine;
using System.Collections;

namespace Skylark
{
    public class UIDataModule : Singleton<UIDataModule>
    {
        public void Init()
        {
            InitUIPath();
            UIDataTable.SetABMode(false);
            RegisterAllPanel();
        }

        private static void InitUIPath()
        {
            PanelData.PREFIX_PATH = "Resources/UI/Panels/{0}";
        }

        private void RegisterAllPanel()
        {
            UIDataTable.SetABMode(true);
            UIDataTable.AddPanelData(UIID.Test1Panel, "Test/Test1Panel");

            UIDataTable.SetABMode(false);
            UIDataTable.AddPanelData(UIID.MaskPanel, "Mask/MaskPanel");
            UIDataTable.AddPanelData(UIID.Test2Panel, "Test/Test2Panel");
        }
    }
}
