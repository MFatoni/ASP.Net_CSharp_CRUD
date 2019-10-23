<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <link rel="stylesheet" href="assets/fontawesome/css/all.css"/>
    <style>
        html,body {height:100%}
        .container-fluid-form {width: 100%;position: relative;display: flex;align-items: center;min-height: 100%}
        .signin {display: flex;align-items: center;height: 100%;width:100%;position:absolute}
        .signinform {width:250px;padding: 20px;margin:0px auto;background: #edeeef;border-radius: 5px;}
        .signinform table {width:100%;}
        .full2 input[type=submit]{background-color: grey;border: none;color: white;padding: 5px;width:100%;border-radius: 5px}
        .full2 input[type=submit]:hover {background-color: #77787a}
        .full3 input {width:100%;margin: 10px 0px;height: 30px;padding: 5px;box-sizing: border-box;border-radius: 5px;border: none}
        .center {text-align:center;}
    </style>
</head>
<body>
<div class="container-fluid-form grey">
    <div class="signin">
		<div class="signinform">
            <form id="form1" runat="server">
                <div class="center">
					<span class="fa fa-users" style="font-size: 50px"></span>
				</div>
                <table>
                    <tr><td class="full3"><asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" TextMode="SingleLine"></asp:TextBox><br /></td></tr>
                    <tr><td class="full3"><asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" TextMode="Password"></asp:TextBox><br /><br /></td></tr>
                    <tr><td><hr style="height: 1px;border: none;background-color: grey"/><br/></td></tr>
                    <tr><td class="full2"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td></tr>
                    <tr><td style="font-size: 11px"><br/><div class="center">Belum Punya Akun ? <a href="regist.aspx" style="text-decoration:none">Daftar Disini</a></div></td></tr>
                </table>
            </form>
        </div>
	</div>
</div>
</body>
</html>
