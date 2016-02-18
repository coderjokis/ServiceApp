using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class ServiceClients
    {
        public string ClientID { get; set; }
        public string ClientName { get; set; }
        public List<string> AuthorizedContacts { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }

        public ServiceClients(){}
        public ServiceClients(string clientID, string clientName, string phone, string address)
        {
            this.ClientID = clientID;
            this.ClientName = clientName;
            this.Phone = phone;
            this.Address = address;   
        }
        public ServiceClients(List<string> authorizedContacts) : this()
        {
            AuthorizedContacts = new List<string>(authorizedContacts);
        }
    }
}