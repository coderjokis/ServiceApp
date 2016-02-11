using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServiceApplication
{
    public partial class Equipments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            txtEquipID.Text = "New";
            pnlAddLocation.Visible = false;
        }

        protected void btnEditEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            pnlAddLocation.Visible = false;
        }

        protected void btnSaveEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = false;
            ClearFields();
        }

        

        protected void btnCancelEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = false;
            ClearFields();
        }
        private void ClearFields()
        {
            txtEquipID.Text = "";
            txtEquipNameType.Text = "";
            txtEquipDescription.Text = "";
            txtLocation.Text = "";
            txtValue.Text = "";
        }

        protected void btnAddLocation_Click(object sender, EventArgs e)
        {
            pnlAddLocation.Visible = true;
            pnlEquip.Visible = false;
        }

        protected void btnSaveLocation_Click(object sender, EventArgs e)
        {
            pnlAddLocation.Visible = false;
            txtNewLocation.Text = "";
        }

        protected void btnCancelLoc_Click(object sender, EventArgs e)
        {
            pnlAddLocation.Visible = false;
            txtNewLocation.Text = "";
        }
    }
}