using DAL_Project;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServiceApplication
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllInfo();
            }   
        }

        private void LoadAllInfo()
        {
            DAL myDal = new DAL(); 
            gvShowAll.DataSource = myDal.ExecuteProcedure("spLoadAllInfo");
            gvShowAll.DataBind();
        }

    }
}