using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class index : System.Web.UI.Page
    {
        public object CommandArgument { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["username"] != "21232f297a57a5a743894a0e4a801fc3")
            { 
                Response.Redirect("index.aspx");
            }
            else
            {
                tampilkanData();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into dataMahasiswa values (@Nama, @NPM, @Kelas, @Jurusan)", con);
            cmd.Parameters.AddWithValue("Nama", Nama.Text);
            cmd.Parameters.AddWithValue("NPM", NPM.Text);
            cmd.Parameters.AddWithValue("Kelas", Kelas.Text);
            cmd.Parameters.AddWithValue("Jurusan", Jurusan.Text);
            string qry = "select * from dataMahasiswa where NPM='" + NPM.Text + "';";
            SqlCommand cmd1 = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd1.ExecuteReader();
            if (sdr.Read())
            {
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Correct", "alert('NPM Telah Ada Mohon Isi Data Ulang')", true);
            }
            else
            {
                con.Close(); con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('Input Data berhasil');window.location='homepage.aspx'; </script>");
            }
        }


        private void tampilkanData()
        {
            DataTable dt = this.getDataMahasiswa(0);
            gvMahasiswa.DataSource = dt;
            gvMahasiswa.DataBind();
        }

        private DataTable getDataMahasiswa(int id_Mahasiswa)
        {
            SqlConnection koneksi = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            koneksi.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = koneksi;
            if (id_Mahasiswa == 0)
            {
                command.CommandText = "select * from dataMahasiswa";
            }
            SqlDataReader reader = null;
            reader = command.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(reader);
            koneksi.Close();
            return dt;
        }

        protected void gvMahasiswa_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string jenisCommand = e.CommandName;
            if (String.Compare(jenisCommand.ToUpper(), "HAPUS", true) == 0)
            {
                string id = (e.CommandArgument.ToString());
                bool isSukses = deleteMahasiswa(id);
                if (isSukses == true)
                {
                    Response.Write("<script> alert('Sukses');window.location='homepage.aspx'; </script>");
                }
                else
                {
                    Response.Write("<script> alert('Gagal');window.location='homepage.aspx'; </script>");
                }
            }
            fillgvMahasiswa();
        }


        private bool deleteMahasiswa(string id)
        {
            SqlConnection koneksi = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            koneksi.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = koneksi;
            command.CommandText = "delete from dataMahasiswa where NPM = @NPM";
            command.Parameters.AddWithValue("@NPM", id);
            command.ExecuteNonQuery();
            koneksi.Close();
            return true;
        }

        private void fillgvMahasiswa()
        {
            DataTable dt = this.getDataMahasiswa(0);
            gvMahasiswa.DataSource = dt;
            gvMahasiswa.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("update dataMahasiswa set Nama=@Nama, NPM= @NPM, Kelas= @Kelas, Jurusan= @Jurusan where NPM = @Ubah", con);
            cmd.Parameters.AddWithValue("Nama", Nama1.Text);
            cmd.Parameters.AddWithValue("NPM", NPM1.Text);
            cmd.Parameters.AddWithValue("Kelas", Kelas1.Text);
            cmd.Parameters.AddWithValue("Jurusan", Jurusan1.Text);
            cmd.Parameters.AddWithValue("Ubah", Ubah.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script> alert('Berhasil Update');window.location='homepage.aspx'; </script>");
        }
    }
}