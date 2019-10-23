using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Regist_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Data values (@Nama, @Email, @NoHP, @Password)", con);
            cmd.Parameters.AddWithValue("Nama", Nama.Text);
            cmd.Parameters.AddWithValue("Email", Email.Text);
            cmd.Parameters.AddWithValue("NoHP", NoHP.Text);
            cmd.Parameters.AddWithValue("Password", Password.Text);

            string qry = "select * from Data where Email='"+Email.Text+"';";
            SqlCommand cmd1 = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd1.ExecuteReader();
            if (sdr.Read())
            {
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Correct", "alert('Username Telah Ada Mohon Isi Data Ulang')", true);
            }
            else
            {
                con.Close();con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Pendaftaran Berhasil');window.location='index.aspx'; </script>");
            }
        }
    }
}