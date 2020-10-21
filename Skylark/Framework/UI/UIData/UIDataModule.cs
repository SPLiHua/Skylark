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
            UIDataTable.AddPanelData(UIID.GamingPanel, "UI/Gaming/GamingPanel");
            UIDataTable.AddPanelData(UIID.ShopPanel, "UI/Shop/ShopPanel");
            UIDataTable.AddPanelData(UIID.OfflinePanel, "UI/Offline/OfflinePanel");
            UIDataTable.AddPanelData(UIID.LosePanel, "UI/Lose/LosePanel");
            UIDataTable.AddPanelData(UIID.WinPanel, "UI/Win/WinPanel");
            UIDataTable.AddPanelData(UIID.BalloonPanel, "UI/Balloon/BalloonPanel");

            UIDataTable.SetABMode(false);
            UIDataTable.AddPanelData(UIID.MaskPanel, "UI/MaskPanel/MaskPanel");
            UIDataTable.AddPanelData(UIID.FloatMessagePanel, "FloatMessagePanel", PanelShowMode.Pop);
        }
    }
}
