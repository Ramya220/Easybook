using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using EasyBook.DataAccessLayer;

namespace EasyBook.BusinessObject
{
    public class GeneralBO : IGeneralDataBO
    {
        public string ValidateUser(long num, string pass, string mail)
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.ValidateUser(num, pass,mail);
        }
        public DataTable Getlocationlist()
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.Getlocationlist();
        }
        public string getSeatStatus(string showid)
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.getSeatStatus(showid);
        }
        public bool updateSeatStatus(string showid, string seatId, string isPaid)
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.updateSeatStatus(showid, seatId, isPaid);
        }
        public string getShowDetails(string showid)
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.getShowDetails(showid);
        }
        public DataTable Getimagelist(int location)
        {
            CGeneralDAC datalayer = new CGeneralDAC();
            return datalayer.Getimagelist(location);
        }
        
    }
}