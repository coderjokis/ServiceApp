﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class Item
    {
        public int ItemID { get; set; }
        public string ItemType { get; set; }
        public string Description { get; set; }
        public int FarFoxValue { get; set; }
        public int ClientValue { get; set; }
        public string CurrentLocation { get; set; }
    }

}