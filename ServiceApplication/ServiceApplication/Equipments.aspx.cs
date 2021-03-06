﻿using System;
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
        string ItemID;
        DAL myDal = new DAL();
        Equipment eResult = new Equipment();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGVEquipments();               
            }
        }

        private void LoadGVEquipments()
        {
            Equipment getEQ = new Equipment();
            getEQ.getEQResult();
            gvEquipment.DataSource = getEQ.EquipList;
            gvEquipment.DataBind();
        }

        protected void btnAddEQ_Click(object sender, EventArgs e)
        {
            pnlEquip.Visible = true;
            txtEquipID.Text = "New";
            ddlType.SelectedValue=null;
            //txtEquipDescription.Text = "";
            txtFValue.Text = "";
            txtCValue.Text = "";
            txtNewLocation.Text = "";
            pnlAddLocation.Visible = false;
            pnlEditEquipment.Visible = false;
        }

        protected void btnSaveEQ_Click(object sender, EventArgs e)
        {
           // myDal.AddParam("Description", txtEquipDescription.Text);
           // myDal.AddParam("InstallDate", txtInstallDate.Text);
            myDal.AddParam("ItemID", ddlType.SelectedIndex.ToString());
            myDal.AddParam("FarFoxValue", txtFValue.Text);
            myDal.AddParam("ClientValue", txtCValue.Text);
            myDal.AddParam("LocationID", ddlLocation.SelectedIndex.ToString());
            string sProc;

            if(txtEquipID.Text == "New")
            {
                sProc = "spAddEquipment";
                pnlEquip.Visible = true;
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
            ddlType.SelectedValue = null;
            //txtEquipDescription.Text = "";
            ddlLocation.DataTextField = "";
            txtCValue.Text = "";
            txtFValue.Text = "";
        }

        protected void btnAddLocation_Click(object sender, EventArgs e)
        {
            txtNewLocation.Text = "";
            pnlAddLocation.Visible = true;
            pnlEquip.Visible = false;
            pnlEditEquipment.Visible = false;
            txtItemInputID.Text = "New";
        }

        protected void btnSaveLocation_Click(object sender, EventArgs e)
        {
            myDal.AddParam("LocationName", txtNewLocation.Text);
            myDal.ExecuteProcedure("spAddLocation");
            gvLocation.DataBind();
            //pnlAddLocation.Visible = false;
            txtNewLocation.Text = "";
        }

        protected void btnCancelLoc_Click(object sender, EventArgs e)
        {
            CancelLocItemInput();
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

                        eResult = eResult.getEquipItem(EquipmentID);
                        
                        PopulateEQEditControls();
                        break;
                }
            }
            pnlEquip.Visible = false;
            //LoadGVEquipments();
        }     

        private void PopulateEQEditControls()
        {
            txtEditEquipID.Text = eResult.equipment.EquipmentID.ToString();
            ddlEditEquipNameType.SelectedValue=eResult.equipment.ItemID.ToString();
            //txtEditEquipDescription.Text = eResult.equipment.Description;
            //txtEditInstallDate.Text = eResult.equipment.InstallDate;
            txtEditFValue.Text = eResult.equipment.FarFoxVAlue.ToString();
            txtEditCValue.Text = eResult.equipment.ClientValue.ToString();
            ddlEditLocation.SelectedValue = eResult.equipment.LocationID.ToString();
        }

        protected void btnSaveEditEquipment_Click(object sender, EventArgs e)
        {
            eResult = eResult.getEquipItem(txtEditEquipID.Text);
            if (ddlEditEquipNameType.SelectedValue!=null)
            {
                eResult.equipment.ItemID = ddlEditEquipNameType.SelectedIndex;
            }
            
            eResult.equipment.ItemType = ddlEditEquipNameType.SelectedItem.Text;
            //eResult.equipment.Description=txtEditEquipDescription.Text;
            eResult.equipment.LocationID = ddlEditLocation.SelectedIndex;
            //eResult.equipment.InstallDate=txtEditInstallDate.Text;
            eResult.equipment.FarFoxVAlue=double.Parse(txtEditFValue.Text);
            eResult.equipment.ClientValue=double.Parse(txtEditCValue.Text);
            eResult.equipment.LocationName= ddlEditLocation.SelectedItem.Text;
            eResult.UpdateTableEQ();
            //gvEquipment.DataBind();
            //myDal.AddParam("EquipmentID", txtEquipID.Text);
            //myDal.AddParam("Description", txtEditEquipDescription.Text);
            //myDal.AddParam("InstallDate", txtEditInstallDate.Text);
            //myDal.AddParam("ItemType", txtEditEquipNameType.Text);

            //myDal.ExecuteProcedure("spUpdateEQuipmentInfo");
            LoadGVEquipments();
            //gvEquipment.DataBind();
            pnlEditEquipment.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEditEquipID.Text = "";
            ddlEditEquipNameType.DataTextField = "";
            //txtEditEquipDescription.Text = "";
            //txtEditInstallDate.Text = "";
            txtEditFValue.Text = "";
            txtEditCValue.Text = "";
            ddlEditLocation.DataTextField = "";
            pnlEditEquipment.Visible = false;
        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            myDal.AddParam("ItemType", txtAddNewItem.Text);

            if (txtItemInputID.Text=="New")
            {
                myDal.ExecuteProcedure("spAddItem");
                
            }
            else
            {
                myDal.AddParam("ItemID", txtItemInputID.Text);
                myDal.ExecuteProcedure("spUpdateItem");
            }
            gvItem.DataBind();
            txtAddNewItem.Text = "";
        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
            CancelLocItemInput();
        }

        private void CancelLocItemInput()
        {
            pnlAddLocation.Visible = false;
            txtNewLocation.Text = "";
            txtAddNewItem.Text = "";
        }

        protected void gvItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                int rowID = Convert.ToInt32(e.CommandArgument);
                gvItem.SelectedIndex = rowID;
                ItemID = gvItem.SelectedDataKey.Value.ToString();
                string cmd = e.CommandName;

                switch (cmd)
                {
                    case "EditItem":
                        myDal.AddParam("ItemID", ItemID);
                        DataSet dsItem = new DataSet();
                        dsItem=myDal.ExecuteProcedure("spGetItem");
                        txtItemInputID.Text = dsItem.Tables[0].Rows[0]["ItemID"].ToString();
                        txtAddNewItem.Text = dsItem.Tables[0].Rows[0]["ItemType"].ToString();
                        break;
                }
            }
        }
    }
}