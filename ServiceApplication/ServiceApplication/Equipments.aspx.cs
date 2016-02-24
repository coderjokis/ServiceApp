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
using ServiceApplication.Models;
using System.Globalization;

namespace ServiceApplication
{
    public partial class Equipments : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        Equipment equipment = new Equipment();
        DataSet dsResult;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGVEquipments();
            }
        }

        private void LoadGVEquipments()
        {
            dsResult = myDal.ExecuteProcedure("spGetEquipmentInfo");
            Equipment getEQ = new Equipment();
            getEQ.getEQResult(dsResult);
            gvEquipment.DataSource = getEQ.EquipList;
            //gvEquipment.DataSource = myDal.ExecuteProcedure("spGetEquipmentInfo");
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
            //myDal.ExecuteProcedure("spGetEquipmentInfo");
            string sProc;

            if(txtEquipID.Text == "New")
            {
                sProc = "spAddEquipment";
            }
            else
            {
                myDal.AddParam("EquipmentID", txtEquipID.Text);
                sProc = "spUpdateEQuipmentInfo";
                
            }
            myDal.ExecuteProcedure(sProc);
            LoadGVEquipments();
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
                        //dsResult = new DataSet();
                        //myDal.AddParam("EquipmentID", EquipmentID);
                        //dsResult = myDal.ExecuteProcedure("spGetEquipmentInfo");
                        //DataRow dr = dsResult.Tables[0].Rows[0];
                        ////if(DateTime.TryParse(dr["InstallDate"].ToString(),out myDate));
                        //equipment = new Equipment(
                        //int.Parse(dr["EquipmentID"].ToString()),
                        //dr["ItemType"].ToString(),
                        //dr["Description"].ToString(),
                        //dr["LocationName"].ToString(),
                        //DateTime.Parse(dr["InstallDate"].ToString()),
                        //int.Parse(dr["ClientValue"].ToString()),
                        //int.Parse(dr["FarFoxValue"].ToString()),
                        //dr["ContactName"].ToString());
                        
                        PopulateEQEditControls();
                        break;
                }
            }
            LoadGVEquipments();
        }

        private void PopulateEQEditControls()
        {
            txtEditEquipID.Text = equipment.EquipmentID.ToString();
            txtEditEquipNameType.Text = equipment.ItemType;
            txtEditEquipDescription.Text = equipment.Description;
            txtEditInstallDate.Text = equipment.InstallDate.ToString();
            txtEditFValue.Text = equipment.FarFoxVAlue.ToString();
            txtEditCValue.Text = equipment.ClientValue.ToString();
            txtEditLocation.Text = equipment.LocationName;
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