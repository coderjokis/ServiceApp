using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class Inventory
    {
        public int InventoryID { get; set; }
        public List<Item> InventoryItem { get; set; }
    }
}