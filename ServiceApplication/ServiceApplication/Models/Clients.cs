﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class Clients
    {
        public int ClientID { get; set; }
        public string ClientName { get; set; }
        public string AuthorizeContacts { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }

        public Clients(){}
        public Clients(int clientID, string clientName, string authorizedContacts, string phone, string address)
        {
            this.ClientID = clientID;
            this.ClientName = clientName;
            this.AuthorizeContacts = authorizedContacts;
            this.Phone = phone;
            this.Address = address;
        }
    }
}