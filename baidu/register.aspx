<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="reg">
    <table style="width: 450px; background-color:White">
            <tr>
                <td style="width: 100px; height: 36px;">
                </td>
                <td style="width: 350px; font-size: 20px; height: 36px;" align="left">
                    客户信息</td>
            </tr>
            <tr>
                <td style="width: 100px" align="right">
                    用户名：</td>
                <td style="width: 350px" align="left">
                    <asp:TextBox ID="TextBox1" runat="server" Width="139px"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="用户名已经使用" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True" Display="Dynamic"></asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 100px" align="right">
                    密码：</td>
                <td style="width: 350px" align="left">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px" align="right">
                    密码再次确认：</td>
                <td style="width: 350px" align="left">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                        ControlToValidate="TextBox3" ErrorMessage="密码不一致"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 350px;height:60px" align="left">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" Width="87px" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
