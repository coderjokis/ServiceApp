using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Globalization;
using System.Web;
using System.Text;

namespace ServiceApplication.Models
{
    public class Equipment
    {
        public int EquipmentID { get; set; }
        public string ItemType { get; set; }
        public string Description { get; set; }
        public string LocationName { get; set; }
        public double FarFoxVAlue { get; set; }
        public double ClientValue { get; set; }
        public string InstallDate { get; set; }
        public string AuthorizingParty { get; set; }
        public List<Equipment> EquipList { get; set; }
        public Equipment() { }

        public Equipment(int equipmentID, string equipmentName, string description, string location,
               string installDate, double fValue, double cValue, string authorizingparty)
        {
            this.EquipmentID = equipmentID;
            this.ItemType = equipmentName;
            this.Description = description;
            this.LocationName = location;
            this.InstallDate = installDate;
            this.FarFoxVAlue = fValue;
            this.ClientValue = cValue;
            this.AuthorizingParty = authorizingparty;
        }
        public void getEQResult(DataSet dsResult)
        {
            EquipList = new List<Equipment>();
            DataSet ds = dsResult;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                //string myStrDate = dr["InstallDate"].ToString();
                //RemoveCurlyBraces(myStrDate);
                //DateParser(myStrDate);

                Equipment e= new Equipment(
                    int.Parse(dr["EquipmentID"].ToString()),
                    dr["ItemType"].ToString(),
                    dr["Description"].ToString(),
                    dr["LocationName"].ToString(),
                    dr["InstallDate"].ToString(),
                    double.Parse(dr["FarFoxValue"].ToString()),
                    double.Parse(dr["ClientValue"].ToString()),
                    dr["ContactName"].ToString()
                    );
                EquipList.Add(e);
                EquipList.ToList();
            }
        }
        internal static string RemoveCurlyBraces(string str)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in str)
            {
                if(c >= '{' && c >= '}')
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
        }
        internal static DateTime DateParser(string strdate)
        {
            DateTime myDate = new DateTime();
            myDate = DateTime.ParseExact(strdate, "d", CultureInfo.CurrentCulture);
            
            return myDate;
        }
    }
}