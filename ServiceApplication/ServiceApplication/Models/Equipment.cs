using System;
using System.Collections.Generic;
using System.Linq;
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
        public  string InstallDate { get; set; }
        public string AuthorizingParty { get; set; }
        public Equipment(){}

        public Equipment(int equipmentID, string equipmentName, string description, string location,
            string installdate, int fValue, int cValue,string authorizingparty )
        {
            this.EquipmentID = equipmentID;
            this.ItemType = equipmentName;
            this.Description = description;
            this.FVAlue = fValue;
            this.CValue = cValue;
            this.LocationName = location;
            this.InstallDate = installdate;
            this.AuthorizingParty = authorizingparty;
        }
        //public override string ToString()
        //{
        //    var n = DateTime.TryParse(InstallDate);
        //    return String.Format("{0}", n.ToString("dd MMMM yyyy"));
        //}
    }
}