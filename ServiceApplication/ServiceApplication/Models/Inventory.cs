using DAL_Project;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ServiceApplication.Models
{
    public class Inventory
    {
        DAL myDal;
       
        public int InventoryID { get; set; }
        public int EquipmentID { get; set; }
        public int Quantity { get; set; }
        public int ClientID { get; set; }
        //public static Inventory instance;
        //public List<Equipment> InventoryItem { get; set; }
        public Inventory(){}
        public Inventory(int equipmentID,int quantity, int clientID)
        {
            this.EquipmentID = equipmentID;
            this.Quantity = quantity;
            this.ClientID = clientID;
        }
      
        //public int GetItemInventory(string ItemID)
        //{
        //    myDal.AddParam("EquipmentID", ItemID);
        //    DataSet ds = new DataSet();
        //    ds = myDal.ExecuteProcedure("spGetItemInventory");
        //    return Convert.ToInt32(ds.Tables[0].Rows[0]["Result"].ToString());
        //}
    }
}