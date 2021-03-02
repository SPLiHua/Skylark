using System.Collections.Generic;

namespace Skylark
{
    public partial class TDGuide
    {

        private EInt m_Id = 0;
        private string m_Name;
        private string m_Description;

        /// <summary>
        /// ID
        /// </summary>
        public int id { get { return m_Id; } }

        /// <summary>
        /// Description
        /// </summary>
        public string description { get { return m_Description; } }

        /// <summary>
        /// Name
        /// </summary>
        public string name { get { return m_Name; } }

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
                        m_Name = dataR.ReadString();
                        break;
                    case 2:
                        m_Description = dataR.ReadString();
                        break;
                    default:
                        break;
                }
            }

        }

        public static Dictionary<string, int> GetFieldHeadIndex()
        {
            Dictionary<string, int> ret = new Dictionary<string, int>(4);

            ret.Add("Id", 0);
            ret.Add("Name", 1);
            ret.Add("Description", 2);
            return ret;
        }


    }
}//namespace LR
