using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;

namespace ServiceApplication
{
    public partial class Equipments : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGVEquipments();
            }
        }

        private void LoadGVEquipments()
        {
            gvEquipment.DataSource = myDal.ExecuteProcedure("spGetEquipment");
            gvEquipment.DataBind();
        }

        protected void btnAddEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            txtEquipID.Text = "New";
            txtEquipNameType.Text = "";
            txtEquipDescription.Text = "";
            txtValue.Text = "";
            txtNewLocation.Text = "";
            pnlAddLocation.Visible = false;
        }

        protected void btnEditEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            pnlAddLocation.Visible = false;
        }

        protected void btnSaveEQ_Click(object sender, EventArgs e)
        {
            myDal.AddParam("Description", txtEquipDescription.Text);
            myDal.ExecuteProcedure("spGetEquipment");

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
            txtNewLocation.Text = "";
            pnlAddLocation.Visible = true;
            pnlEquip.Visible = false;
        }

        protected void btnSaveLocation_Click(object sender, EventArgs e)
        {
            myDal.AddParam("LocationName", txtNewLocation.Text);
            myDal.ExecuteProcedure("spAddLocation");
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