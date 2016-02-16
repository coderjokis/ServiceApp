using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data.SqlClient;

namespace ServiceApplication
{
    public partial class Clients : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadClients();
            LoadDropDownClient();
            LoadContacts();
        }

        private void LoadDropDownClient()
        {
            ddlClients.DataSource = myDal.ExecuteProcedure("spLoadDDLClient");
            ddlClients.DataValueField = "ClientID";
            ddlClients.DataTextField = "ClientName";
            ddlClients.DataBind(); 
        }

        private void LoadContacts()
        {
            txtClientID.Text = ClientID;
            txtClientName.Text = txtClientName.Text;
            txtAddContacts.Text = Contacts.Text;
            txtPhone.Text = txtPhone.Text;
            txtAddress.Text = txtAddress.Text;
            gvClients.DataSource = myDal.ExecuteProcedure("spGetAllClientsInfo");
            gvClients.DataBind();
        }

        private void LoadClients()
        {
            gvClients.DataSource = myDal.ExecuteProcedure("spGetAllClientsInfo");
            gvClients.DataBind();
        }

        protected void btnAddClient_Click(object sender, EventArgs e)
        {
            pnlClient.Visible = true;
            txtClientID.Text = "New";
            txtClientName.Text = "";
            Contacts.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
        }

        protected void btnSaveClient_Click(object sender, EventArgs e)
        {
            myDal.AddParam("ClientName", txtClientName.Text);
            myDal.AddParam("Contacts", Contacts.Text);
            myDal.AddParam("PhoneNumber", txtPhone.Text);
            myDal.AddParam("Address", txtAddress.Text);
            string sProc;

            if(txtClientID.Text == "New")
            {
                sProc = "spAddClient";
            }
            else
            {
                sProc = "spEditClient";
                myDal.AddParam("ClientID", txtClientID.Text);
                pnlClient.Visible = true;
                pnlContacts.Visible = false;
            }
            myDal.ExecuteProcedure(sProc);
            pnlClient.Visible = false;
            ClearFields();
        }

        protected void btnCancelClient_Click(object sender, EventArgs e)
        {
            pnlClient.Visible = false;
            ClearFields();
        }

        private void ClearFields()
        {
            txtClientID.Text = "";
            txtClientName.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
        }

        protected void btnSaveContact_Click(object sender, EventArgs e)
        {
            myDal.ExecuteProcedure("spAddContact");
            myDal.AddParam("ClientID", txtClientID.Text);
            myDal.AddParam("ContactName", txtAddContacts.Text);
            pnlContacts.Visible = false;
        }

        protected void btnCncelContact_Click(object sender, EventArgs e)
        {
            pnlContacts.Visible = false;
        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            Contacts.Text = "";
            txtAddContacts.Text = "";
            pnlContacts.Visible = true;
            pnlClient.Visible = false;
        }

        protected void gvClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowID = Convert.ToInt32(e.CommandArgument);
            gvClients.SelectedIndex = rowID;
            string ClientID = gvClients.SelectedDataKey.Value.ToString();
            string cmd = e.CommandName;

            switch (cmd)
            {
                case "Edit":
                    EditClient(ClientID,
                               gvClients.SelectedRow.Cells[2].Text,
                               gvClients.SelectedRow.Cells[3].Text,
                               gvClients.SelectedRow.Cells[4].Text,
                               gvClients.SelectedRow.Cells[5].Text);
                    break;
            }
        }

        private void EditClient(string ClientID, string ClientName, string Contacts, string PhoneNumber, string Address)
        {
            txtClientID.Text = ClientID;
            txtClientName.Text = ClientName;
            txtPhone.Text = PhoneNumber;
            txtAddress.Text = Address;
        }
    }
}