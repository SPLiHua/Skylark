using UnityEngine.UI;

namespace Skylark
{
    public class ButtonCommand : AbstractGuideCommand
    {
        private IUINodeFinder m_Finder;
        private Button m_TargetButton;

        public override void SetParam(object[] param)
        {
            m_Finder = param[0] as IUINodeFinder;
        }

        protected override void OnStart()
        {
            var target = m_Finder.FindNode(false);

            if (target == null)
            {
                return;
            }

            m_TargetButton = target.GetComponent<Button>();

            if (m_TargetButton == null)
            {
                return;
            }

            m_TargetButton.onClick.AddListener(OnClickTargetButton);
        }

        protected void OnClickTargetButton()
        {
            m_TargetButton.onClick.RemoveListener(OnClickTargetButton);
            m_TargetButton = null;
            FinishStep();
        }

        protected override void OnFinish(bool forceClean)
        {
            if (m_TargetButton != null)
            {
                m_TargetButton.onClick.RemoveListener(OnClickTargetButton);
                m_TargetButton = null;
            }
        }
    }
}