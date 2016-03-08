using DAL_Project;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ServiceApplication.Models
{
    public class ServiceClients
    {
        public ServiceClients sClient { get; set; }
        public string ClientID { get; set; }
        public string ClientName { get; set; }
        public Contacts AuthorizedContacts { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public List<ServiceClients> ClientList { get; set; }
        DAL myDal = new DAL();
        DataSet dsResult;

        public ServiceClients(){}
        public ServiceClients(string clientID, string clientName, string phone, string address)
        {
            this.ClientID = clientID;
            this.ClientName = clientName;
            this.Phone = phone;
            this.Address = address;
            //this.AuthorizedContacts = authorizedContacts;  
        }
        public ServiceClients(Contacts aContacts) : this()
        {
            //AuthorizedContacts = new List<Contacts>();
            //AuthorizedContacts.Add(aContacts);
        }
        public void getClientResult()
        {
            dsResult = myDal.ExecuteProcedure("spGetAllClientsInfo");
            ClientList = new List<ServiceClients>();
            DataSet ds = dsResult;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                ServiceClients c = new ServiceClients(
                 dr["ClientID"].ToString(),
                dr["ClientName"].ToString(),
                dr["PhoneNumber"].ToString(),
                dr["Address"].ToString()
                
                );

                //foreach (var item in dr[2].ToString())
                //{
                //    c = new ServiceClients(new Contacts());
                //};
            
                ClientList.Add(c);
            }
            ClientList.ToList();
        } 
    }
}