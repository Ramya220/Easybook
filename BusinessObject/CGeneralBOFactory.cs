using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EasyBook.BusinessObject
{
    public abstract class CGeneralBOFactory
    {
        public static IGeneralDataBO CreateGeneralDataBO()
        {
            return new GeneralBO();
        }
    }
}