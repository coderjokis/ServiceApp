using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL_Project;

namespace ServiceApplication
{
    public class Contacts
    {
        DAL myDal = new DAL();
        public int ContactID { get; set; }
        public string ContactName { get; set; }
        public Contacts()
        {
        }
        public Contacts(string contactName)
        {
            this.ContactName = contactName;
        }
        public void addContacts(int clientID,string contact)
        {
            myDal.AddParam("ClientID", clientID.ToString());
            myDal.AddParam("ContactName", contact);
            myDal.ExecuteProcedure("spAddContact");
        }
    }
    
}