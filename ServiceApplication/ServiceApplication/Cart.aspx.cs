using ServiceApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;

namespace ServiceApplication
{
    public partial class Cart : System.Web.UI.Page
    {
        DAL myDal = new DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDownInvClient();
            }
        }

        private void LoadDataList()
        {

            dtEquipment.DataSource = myDal.ExecuteProcedure("spGetEquipmentInfo");
            dtEquipment.DataBind();
        }

        private void LoadDropDownContact()
        {
            myDal.AddParam("ClientID", ddlInvClient.SelectedIndex.ToString());
            ddlContact.DataSource = myDal.ExecuteProcedure("spLoadDDLContactbyClientID");
            ddlContact.DataValueField = "ContactID";
            ddlContact.DataTextField = "ContactName";
            ddlContact.DataBind();
        }

        private void LoadDropDownInvClient()
        {
            ddlInvClient.DataSource = myDal.ExecuteProcedure("spLoadDDLClient");
            ddlInvClient.DataValueField = "ClientID";
            ddlInvClient.DataTextField = "ClientName";
            ddlInvClient.DataBind();
        }

        protected void dtEquipment_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            string cmd = e.CommandName;

            if (cmd == "AddToCart")
            {
                Label lbl = (Label)e.Item.FindControl("lblMsg");
                TextBox txt = (TextBox)e.Item.FindControl("txtDLQty");
                if (int.Parse(txt.Text)>0)
                {
                    Inventory s = new Inventory(id, int.Parse(txt.Text), ddlInvClient.SelectedIndex);
                    //save it to database then display it.
                }
                else
                {
                    lbl.Text = "must be greater than 0";

                }


                ////int inventoryQuantityAmount = s.GetItemInventory(id);
                //int newInventoryAmount = inventoryQuantityAmount - int.Parse(txt.Text);

                //if (newInventoryAmount > 0)
                //{
                //    // everything is good!
                //}
                //else
                //{
                //    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "abc", "alert('There is not enough in our inventory!');", true);
                //}
            }
        }

        protected void btnSelectInvClient_Click(object sender, EventArgs e)
        {
            LoadDropDownContact();
        }

        protected void btnSelectContact_Click(object sender, EventArgs e)
        {
            LoadDataList();
        }
    }
}