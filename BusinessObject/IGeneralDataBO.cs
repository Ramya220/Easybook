using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace EasyBook.BusinessObject
{
    public interface IGeneralDataBO
    {
        string ValidateUser(long num, string abc, string mail);
        DataTable Getlocationlist();
        string getSeatStatus(string showid);
        bool updateSeatStatus(string showid, string seatid, string ispaid);
        string getShowDetails(string showid);
        DataTable Getimagelist(int location);
    }
}