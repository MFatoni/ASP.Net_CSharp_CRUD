<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Mohammad Fatoni</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" media="screen" href="assets/style.css" />
    <link rel="stylesheet" href="assets/fontawesome/css/all.css"/>
    <style>
        html {
            background:#edeeef;
        }
        #popup {
        width: 100%;
        height: 100%;
        position: fixed;
        background: rgba(0,0,0,.7);
        top: 0;
        left: 0;
        z-index: 9999;
        visibility: hidden;
        }
        .window {
        width: 400px;
        height: 350px;
        background: #fff;
        border-radius: 10px;
        position: relative;
        padding: 10px;
        box-shadow: 0 0 5px rgba(0,0,0,.4);
        text-align: center;
        margin: 15% auto;
        }
        .window input {
            padding:5px;
            margin:2px;
            width:250px;
            border-radius:5px
        }
        .close-button {
        width: 20px;
        height: 20px;
        background: #000;
        border-radius: 50%;
        border: 3px solid #fff;
        display: block;
        text-align: center;
        color: #fff;
        text-decoration: none;
        position: absolute;
        top: -10px;
        right: -10px;
        }
        #popup:target {
        visibility: visible;
        }
        .menuHomepage {
            background:grey;
            height:40px;
            border-radius:5px
        }
        .kontenMenu {
            padding:10px
        }
        .kontenMenu > a{
            padding:13px;
            text-decoration:none;
            color:white;
        }
        .kontenMenu > a:hover{
            color:black;
        }
        .menuRight {
            position:absolute;
            top:5px;
            right:35px;
        }
        .tampilanData td,th {
            width: 1%;
            padding:10px
        }
        .tampilanData td > a {
            text-decoration:none;
            color:saddlebrown;
        }
        .tampilanData td > a:hover {
            color:red;
        }
        .tampilanData input {
            width:92%;
            height:30px;
            padding:0px 1%;
            border-radius:5px;
        }
        .container 
        {
            margin:0px 30px;
        }
        .submitHome {
            text-align:right;
            margin:10px;
        }
        .btnHome {
            padding:5px 15px
        }
        .center {
            text-align:center;
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="menuHomepage">
                <div class="kontenMenu">
                    <a href="homepage.aspx">BERANDA</a>
                    <div class="menuRight">
                        <asp:Button ID="btnLogout" class="btn btn-outline-light" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btnHome"/><br />
                    </div>
                </div>
            </div><br />
        
            <br /><div class="center"><h3>DATA MAHASISWA</h3></div><br /><hr /><br />
                <asp:GridView runat="server" AllowPaging="true" ID="gvMahasiswa" AutoGenerateColumns="false" OnRowCommand="gvMahasiswa_RowCommand" CssClass="tampilanData">
                    <Columns>
                        <asp:BoundField DataField="NPM" Visible="false" />
                        <asp:BoundField HeaderText="Nama" DataField="Nama"  />
                        <asp:BoundField HeaderText="NPM" DataField="NPM" />
                        <asp:BoundField HeaderText="Kelas" DataField="Kelas" />
                        <asp:BoundField HeaderText="Jurusan" DataField="Jurusan" />
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkDelete" CommandArgument='<%# Eval("NPM") %>' CommandName="hapus"
                                    runat="server" OnClientClick="return confirm('Apakah Anda yakin dihapus ?');">
                                    <center>Delete</center>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Update" >
                            <ItemTemplate >
                                <asp:LinkButton ID="Update" CommandArgument='<%# Eval("NPM") %>' CommandName="ubah"
                                    runat="server" href="#popup">
                                    <center>Edit</center>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView><br /><br />

            <br /><div class="center"><h3>INPUT DATA</h3></div><br /><hr />
            <div class="tampilanData">
                <table >
                    <tr>
                        <th>Nama</th>
                        <th>NPM</th>
                        <th>Kelas</th>
                        <th>Jurusan</th>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Nama" runat="server" placeholder="Nama"></asp:TextBox></td>
                        <td><asp:TextBox ID="NPM" runat="server" placeholder="NPM"></asp:TextBox></td>
                        <td><asp:TextBox ID="Kelas" runat="server" placeholder="Kelas"></asp:TextBox></td>
                        <td><asp:TextBox ID="Jurusan" runat="server" placeholder="Jurusan"></asp:TextBox></td>
                    </tr>
                </table><br />
            </div>
            <div class="submitHome"><asp:Button ID="btnInsert" runat="server" Text="INPUT" OnClick="btnInsert_Click" CssClass="btnHome"/></div>
		
		    <div id="popup">
			    <div class="window">
				    <a href="#" class="close-button" title="Close">X</a>
                    <h3>EDIT DATA</h3><hr /><br />
                    <p>Masukkan NPM data yang ingin dirubah</p><br /><asp:TextBox ID="Ubah" runat="server" placeholder="NPM"></asp:TextBox><br /><br />
                    <p>Input Data Dibawah Dengan Data Yang Benar</p><br />
                    <asp:TextBox ID="Nama1" runat="server" placeholder="Nama"></asp:TextBox><br />
                    <asp:TextBox ID="NPM1" runat="server" placeholder="NPM"></asp:TextBox><br />
                    <asp:TextBox ID="Kelas1" runat="server" placeholder="Kelas"></asp:TextBox><br />
                    <asp:TextBox ID="Jurusan1" runat="server" placeholder="Jurusan"></asp:TextBox><br /><br />
                    <asp:Button ID="btnUpdate" runat="server" Text="Submit" OnClick="btnUpdate_Click" CssClass="btnHome"/>
			    </div>
		    </div>
        </form>  
    </div>
    </body>
</html>

