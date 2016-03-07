using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data.SqlClient;
using ServiceApplication.Models;
using System.Data;

namespace ServiceApplication
{
    public partial class Clients : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        ServiceClients client;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadGVClients();
            }
            //LoadGVClients();
            //LoadCLients();
        }

        private void LoadDropDownClient()
        {
            ddlClients.DataSource = myDal.ExecuteProcedure("spLoadDDLClient");
            ddlClients.DataValueField = "ClientID";
            ddlClients.DataTextField = "ClientName";
            ddlClients.DataBind(); 
        }

        //private void LoadCLients()
        //{
        //    //txtClientID.Text = ClientID;
        //    //txtClientName.Text = txtClientName.Text;
        //    ////txtAddContacts.Text = Contacts.Text;
        //    //txtPhone.Text = txtPhone.Text;
        //    //txtAddress.Text = txtAddress.Text;
        //    gvClients.DataSource = myDal.ExecuteProcedure("spGetAllClientsInfo");
        //    gvClients.DataBind();
        //}

        private void LoadGVClients()
        {
            gvClients.DataSource = myDal.ExecuteProcedure("spGetAllClientsInfo");
            gvClients.DataBind();
        }

        protected void btnAddClient_Click(object sender, EventArgs e)
        {
            pnlContacts.Visible = false;
            pnlClient.Visible = true;
            txtClientID.Text = "New";
            txtClientName.Text = "";
            //Contacts.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
        }

        protected void btnSaveClient_Click(object sender, EventArgs e)
        {
            myDal.AddParam("ClientName", txtClientName.Text);
            //myDal.AddParam("Contacts", Contacts.Text);
            myDal.AddParam("PhoneNumber", txtPhone.Text);
            myDal.AddParam("Address", txtAddress.Text);
            string sProc;

            if(txtClientID.Text == "New")
            {
                sProc = "spAddClient";
                pnlClient.Visible = true;
                pnlEditClient.Visible = false;
            } 
            else
            {
                sProc = "spEditClient";
                myDal.AddParam("ClientID", txtClientID.Text);
                pnlEditClient.Visible = true;
                pnlContacts.Visible = false;
            }
            myDal.ExecuteProcedure(sProc);
            LoadGVClients();
            pnlEditClient.Visible = false;
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
            
            myDal.AddParam("ClientID", ddlClients.SelectedValue);
            myDal.AddParam("ContactName", txtAddContacts.Text);
            myDal.ExecuteProcedure("spAddContact");
            LoadGVClients();
            pnlContacts.Visible = false;
        }

        protected void btnCncelContact_Click(object sender, EventArgs e)
        {
            pnlContacts.Visible = false;
        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            LoadDropDownClient();
            //Contacts.Text = "";
            txtAddContacts.Text = "";
            pnlContacts.Visible = true;
            pnlClient.Visible = false;
            ddlClients.Enabled = false;
        }

        protected void gvClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowID = Convert.ToInt32(e.CommandArgument);
                gvClients.SelectedIndex = rowID;
                string ClientID = gvClients.SelectedDataKey.Value.ToString();
                string cmd = e.CommandName;

                switch (cmd)
                {
                    case "EditRow":
                        pnlEditClient.Visible = true;
                        ds = new DataSet();
                        myDal.AddParam("ClientID", ClientID);
                        ds = myDal.ExecuteProcedure("spGetAllClientsInfo");
                        DataRow dr = ds.Tables[0].Rows[0];
                        client = new ServiceClients(
                            dr["ClientID"].ToString(),
                            dr["ClientName"].ToString(),
                            dr["PhoneNumber"].ToString(),
                            dr["Address"].ToString());

                        //client.AuthorizedContacts.Add(dr["ContactName"].ToString());
                        client.AuthorizedContacts = new List<string>()
                    {
                        dr["ContactName"].ToString()
                    };
                        txtEditClientID.Text = client.ClientID;
                        txtEditClientName.Text = client.ClientName;
                        txtEditPhone.Text = client.Phone;
                        txtEditAddress.Text = client.Address;
                        break;
                }
            }
            
            LoadGVClients();
        }


        //private void LoadContactDDL()
        //{
        //    //no need to load ddl. contact selection will take place in equipment page
        //    //myDal.AddParam("ClientID", client.ClientID);
        //    ddlContacts.DataSource = myDal.ExecuteProcedure("spGetContactFromClient");
        //    ddlContacts.DataTextField = "ContactName";
        //    ddlContacts.DataValueField = "ContactID";
        //    ddlContacts.DataBind();
        //}

        protected void btnSaveEditClient_Click(object sender, EventArgs e)
        {
            myDal.AddParam("ClientID", txtEditClientID.Text);
            myDal.AddParam("ClientName", txtEditClientName.Text);
            //myDal.AddParam("ContactID", ddlEditContacts.SelectedValue);
            myDal.AddParam("PhoneNumber", txtEditPhone.Text);
            myDal.AddParam("Address", txtEditAddress.Text);
            myDal.ExecuteProcedure("spEditClient");
            LoadGVClients();
            pnlEditClient.Visible = false;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            txtEditClientID.Text = "";
            txtEditClientName.Text = "";
            txtEditPhone.Text = "";
            txtEditAddress.Text = "";
            pnlEditClient.Visible = false;
        }

        protected void gvClients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClients.PageIndex = e.NewPageIndex;
            LoadGVClients();
        }

        protected void rbtnNC_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnEC.Checked==true)
            {
                ddlClients.Enabled = true;
            }
            else
            {
                ddlClients.Enabled = false;
            }
        }
    }
}