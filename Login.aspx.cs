using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using EasyBook.BusinessObject;

namespace EasyBook
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static byte[] Encrypt(byte[] data, byte[] key, byte[] iv)
        {
            using (Aes algo = Aes.Create())
            {
                using (ICryptoTransform encryptor = algo.CreateEncryptor(key, iv))
                {
                    return Crypt(data, encryptor);
                }
            }
        }

        static byte[] Decrypt(byte[] data, byte[] key, byte[] iv)
        {
            using (Aes algo = Aes.Create())
            {
                using (ICryptoTransform decryptor = algo.CreateDecryptor(key, iv))
                {
                    return Crypt(data, decryptor);
                }
            }
        }

        static byte[] Crypt(byte[] data, ICryptoTransform cryptor)
        {
            var ms = new MemoryStream();
            using (Stream cs = new CryptoStream(ms, cryptor, CryptoStreamMode.Write))
            {
                cs.Write(data, 0, data.Length);
            }
            return ms.ToArray();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mail = txtemail.Text;
            string pass = txtpass.Text;
            byte[] key = new byte[16];
            byte[] iv = new byte[16];
            for (int i = 0; i < 16; i++) key[i] = 0x20;
            for (int i = 0; i < 16; i++) iv[i] = 0x30;
            
            byte[] data = Encoding.ASCII.GetBytes(pass);
            byte[] encrypted = Encrypt(data, key, iv);

            StringBuilder hex = new StringBuilder(encrypted.Length * 2);
            foreach (byte b in encrypted)
                hex.AppendFormat("{0:x2}", b);
            string abc = hex.ToString();
            
            string _username;
            try
            {
                long num = long.Parse(mail);
                 _username = CGeneralBOFactory.CreateGeneralDataBO().ValidateUser(num , pass, mail = null);
              
            }
            catch (Exception ex)
            {
                 _username = CGeneralBOFactory.CreateGeneralDataBO().ValidateUser( 0, pass, mail);
                
            }


            if (_username != null)
            {
                
                Session["username"] = _username;
                Response.Redirect("BookingPage.aspx");
                Session.RemoveAll();
            }
            else
            {
                Label1.Text = "Invalid Credentials";
            }
        }
    }
}