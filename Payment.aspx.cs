using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyBook.BusinessObject;

namespace EasyBook
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public string PayAmount(string showid, string seatId, string isPaid)
        {
            
            bool val = CGeneralBOFactory.CreateGeneralDataBO().updateSeatStatus(showid, seatId, isPaid);
            
            return val + "";
        }
    }
}