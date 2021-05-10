using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyBook.BusinessObject;

namespace EasyBook
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["SelectedSeat"] = "";


            System.Web.HttpContext.Current.Session["mydata"] = "1";
            string showid = System.Web.HttpContext.Current.Session["mydata"].ToString();

        }
        [System.Web.Services.WebMethod]
        public static string loadAllSeats()
        {
          
            string dt = CGeneralBOFactory.CreateGeneralDataBO().getSeatStatus("1");
            return dt;

        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string UpdateSeatStatus(string showid, string seatId, string isPaid = null)
        {

        
            bool temp = CGeneralBOFactory.CreateGeneralDataBO().updateSeatStatus(showid, seatId, isPaid);
            return temp + "";
        }
        [System.Web.Services.WebMethod]
        public static string getShowDetails()
        {
            
            string dt = CGeneralBOFactory.CreateGeneralDataBO().getShowDetails("1");
            return dt;
        }
        protected void payment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx", true);
        }

    }
}