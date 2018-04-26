<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>用户登录</title>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <asp:Login ID="Login1" runat="server"  BackColor="#eeeeee" BorderColor="silver" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Size="12px" ForeColor="#333333" Height="180px" Width="275px" OnAuthenticate="Login1_Authenticate1">
            <TitleTextStyle BackColor="#990000" Font-Bold="true" Font-Size="14px" ForeColor="White" />
            <InstructionTextStyle Font-Italic="true" ForeColor="Black" />
            <TextBoxStyle Font-Size="12px" />
            <LoginButtonStyle BackColor="White" BorderColor="#990000" BorderStyle="Solid" BorderWidth="1px" Font-Size="12px" ForeColor="black" />
        </asp:Login>
    </div>
</form>
</body>
</html>
