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
        }

        protected void btnEditEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            
        }

        protected void btnSaveEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = false;
        }

        protected void btnCancelEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = false;
        }
    }
}