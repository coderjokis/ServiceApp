using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServiceApplication
{
    public partial class Clients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddClient_Click(object sender, EventArgs e)
        {
            pnlClient.Visible = true;
            txtClientID.Text = "New";
        }

        protected void btnEditClient_Click(object sender, EventArgs e)
        {
            pnlClient.Visible = true;
            pnlContacts.Visible = false;
        }

        protected void btnSaveClient_Click(object sender, EventArgs e)
        {
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
            pnlContacts.Visible = false;
        }

        protected void btnCncelContact_Click(object sender, EventArgs e)
        {
            pnlContacts.Visible = false;
        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            pnlContacts.Visible = true;
            pnlClient.Visible = false;
        }
    }
}