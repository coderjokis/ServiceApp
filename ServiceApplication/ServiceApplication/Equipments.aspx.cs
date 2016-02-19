using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ServiceApplication
{
    public partial class Equipments : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        Equipments equipment;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGVEquipments();
            }
        }

        private void LoadGVEquipments()
        {
            gvEquipment.DataSource = myDal.ExecuteProcedure("spGetEquipmentInfo");
            gvEquipment.DataBind();
        }

        protected void btnAddEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            txtEquipID.Text = "New";
            txtEquipNameType.Text = "";
            txtEquipDescription.Text = "";
            txtFValue.Text = "";
            txtCValue.Text = "";
            txtNewLocation.Text = "";
            pnlAddLocation.Visible = false;
        }

        //protected void btnEditEQ_Click(object sender, EventArgs e)
        //{
        //    pnlEquip.Visible = true;
        //    pnlAddLocation.Visible = false;
        //}

        protected void btnSaveEQ_Click(object sender, EventArgs e)
        {
            myDal.AddParam("ItemType", txtEquipNameType.Text);
            myDal.AddParam("Description", txtEquipDescription.Text);
            myDal.AddParam("InstallDate", txtInstallDate.Text);
            myDal.AddParam("FarFoxValue", txtFValue.Text);
            myDal.AddParam("ClientValue", txtCValue.Text);
            myDal.AddParam("LocationName", txtLocation.Text);
            myDal.ExecuteProcedure("spGetEquipmentInfo");
            string sProc;

            if(txtEquipID.Text == "New")
            {
                sProc = "spAddEquipment";
            }
            else
            {
                sProc = "spUpdateEQuipmentInfo";
                myDal.AddParam("EquipmentID", txtEquipID.Text);
            }
            myDal.ExecuteProcedure(sProc);
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
            txtCValue.Text = "";
            txtFValue.Text = "";
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

        protected void gvEquipment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowID = Convert.ToInt32(e.CommandArgument);
                gvEquipment.SelectedIndex = rowID;
                string EquipmentID = gvEquipment.SelectedDataKey.Value.ToString();
                string cmd = e.CommandName;

                switch (cmd)
                {
                    case "EditRow":
                        pnlEditEquipment.Visible = true;
                        ds = new DataSet();
                        myDal.AddParam("EquipmentID", EquipmentID);
                        ds = myDal.ExecuteProcedure("spGetEquipmentInfo");
                        DataRow dr = ds.Tables[0].Rows[0];
                        equipment = new Equipments(
                        dr["EquipmentID"].ToString(),
                        dr["ItemType"].ToString(),
                        dr["Description"].ToString(),
                        dr["InstallDate"].ToString(),
                        dr["FarFoxValue"].ToString(),
                        dr["ClientValue"].ToString(),
                        dr["LocationName"].ToString());

                        
                        break;
                }
            }
            LoadGVEquipments();
        }

        protected void btnSaveEditEquipment_Click(object sender, EventArgs e)
        {
            myDal.AddParam("EquipmentID", txtEquipID.Text);
            myDal.AddParam("Description", txtEditEquipDescription.Text);
            myDal.AddParam("InstallDate", txtEditInstallDate.Text);
            myDal.AddParam("ItemType", txtEditEquipNameType.Text);

            myDal.ExecuteProcedure("spUpdateEQuipmentInfo");
            LoadGVEquipments();
            pnlEditEquipment.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEditEquipID.Text = "";
            txtEditEquipNameType.Text = "";
            txtEditEquipDescription.Text = "";
            txtEditInstallDate.Text = "";
            txtEditFValue.Text = "";
            txtEditCValue.Text = "";
            txtEditLocation.Text = "";
            pnlEditEquipment.Visible = false;
        }
    }
}