using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Globalization;
using System.Web;
using System.Text;
using DAL_Project;

namespace ServiceApplication.Models
{
    public class Equipment
    {
        public Equipment equipment;
        public int EquipmentID { get; set; }
        public int ItemID { get; set; }
        public string ItemType { get; set; }
        public string Description { get; set; }
        public int LocationID { get; set; }
        public string LocationName { get; set; }
        public double FarFoxVAlue { get; set; }
        public double ClientValue { get; set; }
        public string InstallDate { get; set; }
        public List<Equipment> EquipList { get; set; }
        DAL myDal = new DAL();
        DataSet dsResult;
        public Equipment() { }

        public Equipment(int equipmentID, int itemTypeID,string itemType, double fValue, double cValue)
        {
            this.EquipmentID = equipmentID;
            this.ItemID = itemTypeID;
            this.ItemType = itemType;
            //this.Description = description;
            //this.LocationID = locationID;
            //this.LocationName = location;
            //this.InstallDate = installDate;
            this.FarFoxVAlue = fValue;
            this.ClientValue = cValue;
        }

        public Equipment(Equipment equipment)
        {
            this.equipment = equipment;
        }

        public void getEQResult()
        {
            dsResult = myDal.ExecuteProcedure("spGetEquipmentInfo");
            EquipList = new List<Equipment>();
            DataSet ds = dsResult;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Equipment e = new Equipment(
                    int.Parse(dr["EquipmentID"].ToString()),
                    int.Parse(dr["ItemID"].ToString()),
                    dr["ItemType"].ToString(),
                    //dr["Description"].ToString(),
                    //int.Parse(dr["LocationID"].ToString()),
                    //dr["LocationName"].ToString(),
                    //dr["InstallDate"].ToString(),
                    double.Parse(dr["FarFoxValue"].ToString()),
                    double.Parse(dr["ClientValue"].ToString())
                    );
                EquipList.Add(e);
            }
            EquipList.ToList();
        }
        public Equipment getEquipItem(string eqID)
        {
            getEQResult();
            Equipment result = new Equipment(EquipList.Find(x => x.EquipmentID == Convert.ToInt32(eqID)));
            return result;
        }
        public void UpdateTableEQ()
        {
            myDal.AddParam("EquipmentID", equipment.EquipmentID.ToString());
            myDal.AddParam("Description", equipment.Description);
            myDal.AddParam("InstallDate", equipment.InstallDate);
            if (equipment.ItemID!=0)
            {
                myDal.AddParam("ItemID", equipment.ItemID.ToString());
            }
            myDal.AddParam("FarFoxValue", equipment.FarFoxVAlue.ToString());
            myDal.AddParam("ClientValue", equipment.ClientValue.ToString());
            if (equipment.LocationID!=0)
            {
                myDal.AddParam("LocationID", equipment.LocationID.ToString());
            }
            myDal.ExecuteProcedure("spUpdateEQuipmentInfo");
        }
    }
}