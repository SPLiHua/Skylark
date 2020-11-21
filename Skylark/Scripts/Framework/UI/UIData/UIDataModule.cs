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
            UIDataTable.AddPanelData(UIID.LoadingPanel, "UI/Prefabs/LoadingPanel");
            UIDataTable.AddPanelData(UIID.GamingPanel, "UI/Prefabs/GamingPanel");
            UIDataTable.AddPanelData(UIID.RolePanel, "UI/Prefabs/RolePanel");
            UIDataTable.AddPanelData(UIID.GamOverPanel, "UI/Prefabs/GameOverPanel");

            UIDataTable.SetABMode(false);
            UIDataTable.AddPanelData(UIID.MaskPanel, "UI/MaskPanel/MaskPanel");
            UIDataTable.AddPanelData(UIID.FloatMessagePanel, "FloatMessagePanel", PanelShowMode.Pop);
        }
    }
}
