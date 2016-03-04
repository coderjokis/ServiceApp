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
        static int ItemIDCount = 0;
        public int InventoryID { get; set; }
        public Equipment Item { get; set; }
        public static Inventory instance;
        //public List<Equipment> InventoryItem { get; set; }
        public Inventory(){}
        public Inventory(Equipment item)
        {
            ItemIDCount++;
            this.Item = item;
        }
        public static Inventory Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new Inventory();
                }
                return instance;
            }
        }
        public int GetItemInventory(string ItemID)
        {
            myDal.AddParam("EquipmentID", ItemID);
            DataSet ds = new DataSet();
            ds = myDal.ExecuteProcedure("spGetItemInventory");
            return Convert.ToInt32(ds.Tables[0].Rows[0]["Result"].ToString());
        }
    }
}