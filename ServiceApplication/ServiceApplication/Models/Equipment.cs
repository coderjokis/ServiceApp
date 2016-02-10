using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class Equipment
    {
        public int EquipmentID { get; set; }
        public string EquipmentName { get; set; }
        public string Description { get; set; }
        public string Location { get; set; }
        public  string InstallDate { get; set; }
        public string AuthorizingParty { get; set; }
        public Equipment(){}
        public Equipment(int equipmentID, string equipmentName, string description, string location, string installDate, string authorizingParty)
        {
            this.EquipmentID = equipmentID;
            this.EquipmentName = equipmentName;
            this.Description = description;
            this.Location = location;
            this.InstallDate = installDate;
            this.AuthorizingParty = authorizingParty;      
        }
    }
}