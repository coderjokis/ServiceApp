using ServiceApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServiceApplication
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dtEquipment_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            string cmd = e.CommandName;

            if (cmd == "AddToCart")
            {
                TextBox txt = (TextBox)e.Item.FindControl("txtDLQty");

                Inventory s = new Inventory();
                int inventoryQuantityAmount = s.GetItemInventory(id);
                int newInventoryAmount = inventoryQuantityAmount - int.Parse(txt.Text);

                if (newInventoryAmount > 0)
                {
                    // everything is good!
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "abc", "alert('There is not enough in our inventory!');", true);
                }
            }
        }
    }
}