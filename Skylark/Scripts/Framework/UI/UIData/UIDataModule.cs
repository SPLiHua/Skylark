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
            UIDataTable.AddPanelData(UIID.LoadingPanel, "UI/Prefabs/LoadingPanel/LoadingPanel");
            UIDataTable.AddPanelData(UIID.GamingPanel, "UI/Prefabs/GamingPanel/GamingPanel");
            UIDataTable.AddPanelData(UIID.RolePanel, "UI/Prefabs/RolePanel/RolePanel");
            UIDataTable.AddPanelData(UIID.GameOverPanel, "UI/Prefabs/GameOverPanel/GameOverPanel");
            UIDataTable.AddPanelData(UIID.TipPanel, "UI/Prefabs/TipPanel/TipPanel");
            UIDataTable.AddPanelData(UIID.HomePanel, "UI/Prefabs/HomePanel/HomePanel");
            UIDataTable.AddPanelData(UIID.EggPanel, "UI/Prefabs/EggPanel/EggPanel");
            UIDataTable.AddPanelData(UIID.ChestPanel, "UI/Prefabs/ChestPanel/ChestPanel");
            UIDataTable.AddPanelData(UIID.PausePanel, "UI/Prefabs/PausePanel/PausePanel");
            UIDataTable.AddPanelData(UIID.PrisonPanel, "UI/Prefabs/PrisonPanel/PrisonPanel");
            UIDataTable.AddPanelData(UIID.ChestUnlockPanel, "UI/Prefabs/ChestUnlockPanel/ChestUnlockPanel");
            UIDataTable.AddPanelData(UIID.BasePropertyPanel, "UI/Prefabs/BasePropertyPanel/BasePropertyPanel");
            UIDataTable.AddPanelData(UIID.ShopPanel, "UI/Prefabs/ShopPanel/ShopPanel");
            UIDataTable.AddPanelData(UIID.ChestOpenPanel, "UI/Prefabs/ChestOpenPanel/ChestOpenPanel", PanelShowMode.Pop);
            UIDataTable.AddPanelData(UIID.MainPanel, "UI/Prefabs/MainPanel/MainPanel", PanelShowMode.Pop);

            UIDataTable.SetABMode(false);
            UIDataTable.AddPanelData(UIID.MaskPanel, "MaskPanel");
            UIDataTable.AddPanelData(UIID.FloatMessagePanel, "FloatMessagePanel", PanelShowMode.Pop);
            UIDataTable.AddPanelData(UIID.GuideTipPanel, "GuideTipPanel");
            UIDataTable.AddPanelData(UIID.UIClipPanel, "UIClipPanel");
        }
    }
}
