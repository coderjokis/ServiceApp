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
    }
}