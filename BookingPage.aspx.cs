using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EasyBook.BusinessObject;
using System.Web.Services;
using System.Configuration;
using Newtonsoft.Json;

namespace EasyBook
{
    public partial class BookingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            GetLocationData();
        }
        public void GetLocationData()
        {
            
            DataTable locationlist = CGeneralBOFactory.CreateGeneralDataBO().Getlocationlist();
            ddlcountry.DataSource = locationlist;
            ddlcountry.DataTextField = "Location";
            ddlcountry.DataValueField = "id";
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("Plese select","-1"));

           
        }
        protected void changingselectedindex(object sender, System.EventArgs e)
        {
            int location = Convert.ToInt16(ddlcountry.SelectedValue);
            DataTable imagelist = CGeneralBOFactory.CreateGeneralDataBO().Getimagelist(location);
            if (imagelist.Rows.Count > 0)
            {
                datalist1.DataSource = imagelist;
                
                datalist1.DataBind();
            }
        }
        protected void DataList_ItemCommand(object source, System.EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");

            
        }
    }
}