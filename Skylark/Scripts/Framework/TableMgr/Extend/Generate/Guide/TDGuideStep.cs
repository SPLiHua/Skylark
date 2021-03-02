using System.Collections.Generic;

namespace Skylark
{
    public partial class TDGuideStep
    {

        private EInt m_Id = 0;
        private EInt m_GuideID = 0;
        private string m_Trigger;
        private string m_Command;
        private string m_CommonParam;
        private EInt m_KeyFrame;
        private string m_Description;


        /// <summary>
        /// ID
        /// </summary>
        public int id { get { return m_Id; } }

        /// <summary>
        /// GuideID
        /// </summary>
        public int guideID { get { return m_GuideID; } }

        /// <summary>
        /// Trigger1
        /// </summary>
        public string trigger { get { return m_Trigger; } }

        /// <summary>
        /// Command
        /// </summary>
        public string command { get { return m_Command; } }

        /// <summary>
        /// CommandCommonParam
        /// </summary>
        public string commonParam { get { return m_CommonParam; } }

        /// <summary>
        /// KeyFrame
        /// </summary>
        public int keyFrame { get { return m_KeyFrame; } }

        /// <summary>
        /// Description
        /// </summary>
        public string description { get { return m_Description; } }

        public void ReadRow(DataStreamReader dataR, int[] filedIndex)
        {
            int col = 0;
            while (true)
            {
                col = dataR.MoreFieldOnRow();
                if (col == -1)
                {
                    break;
                }
                switch (filedIndex[col])
                {
                    case 0:
                        m_Id = dataR.ReadInt();
                        break;
                    case 1:
                        m_GuideID = dataR.ReadInt();
                        break;
                    case 2:
                        m_Trigger = dataR.ReadString();
                        break;
                    case 3:
                        m_Command = dataR.ReadString();
                        break;
                    case 4:
                        m_CommonParam = dataR.ReadString();
                        break;
                    case 5:
                        m_KeyFrame = dataR.ReadInt();
                        break;
                    case 6:
                        m_Description = dataR.ReadString();
                        break;
                    default:
                        break;
                }
            }

        }

        public static Dictionary<string, int> GetFieldHeadIndex()
        {
            Dictionary<string, int> ret = new Dictionary<string, int>(9);

            ret.Add("Id", 0);
            ret.Add("GuideID", 1);
            ret.Add("Trigger", 2);
            ret.Add("Command", 3);
            ret.Add("CommonParam", 4);
            ret.Add("KeyFrame", 5);
            ret.Add("Description", 6);
            return ret;
        }


    }
}//namespace LR
