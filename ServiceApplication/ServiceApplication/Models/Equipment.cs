using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Globalization;
using System.Web;

namespace ServiceApplication.Models
{
    public class Equipment
    {
        public int EquipmentID { get; set; }
        public string ItemType { get; set; }
        public string Description { get; set; }
        public string LocationName { get; set; }
        public int FVAlue { get; set; }
        public int CValue { get; set; }
        public DateTime InstallDate { get; set; }
        public string AuthorizingParty { get; set; }
        public List<Equipment> EquipList { get; set; }
        public Equipment() { }

        public Equipment(int equipmentID, string equipmentName, string description, string location,
              DateTime installDate, int fValue, int cValue,  string authorizingparty)
        {
            this.EquipmentID = equipmentID;
            this.ItemType = equipmentName;
            this.Description = description;
            this.LocationName = location;
            this.InstallDate = installDate;
            this.FVAlue = fValue;
            this.CValue = cValue;
            this.AuthorizingParty = authorizingparty;
        }
        public void getEQResult(DataSet dsResult)
        {
            EquipList = new List<Equipment>();
            DataSet ds = dsResult;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string myStrDate = dr["InstallDate"].ToString();
                ////Convert.ToString(DateTime.Parse(dr["InstallDate"].ToString()));
                DateTime myDate = new DateTime();
                   myDate = DateTime.ParseExact(myStrDate,"'MM/d/yyyy'",CultureInfo.InvariantCulture);
                EquipList.Add(new Equipment(
                    int.Parse(dr["EquipmentID"].ToString()),
                    dr["ItemType"].ToString(),
                    dr["Description"].ToString(),
                    dr["LocationName"].ToString(),
                    myDate,
                    int.Parse(dr["FarFoxValue"].ToString()),
                    int.Parse(dr["ClientValue"].ToString()),
                    dr["ContactName"].ToString()
                    ));
                EquipList.ToList();
            }
        }
    }
}