<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testform1.aspx.cs" Inherits="ztaconfigGUI.testform1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 30px;
        }
        .auto-style3 {
            height: 30px;
            width: 348px;
        }
        .auto-style4 {
            width: 348px;
        }
        .auto-style5 {
            height: 30px;
            width: 152px;
        }
        .auto-style6 {
            width: 152px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p></p>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="110px" ImageUrl="~/images/logo-mpg.jpg" Width="110px" />
                    </td>
                    <td class="auto-style2">MindPoint Group Zero Trust Architecture<br />
                        Attribute Editor<br />
                        <br />
                        Use this tool to update the attributes of user and non-user entities that demonstrates entitlement provisioning.</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label2" runat="server" Text="Enter Entity UPN: "></asp:Label>
                        </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Style="margin-bottom: 0px" Width="260px"></asp:TextBox></td>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" Text="Find" />
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2">userPrincipialName</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" Width="260px"></asp:TextBox>
                    </td>
                    <td class="auto-style5"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style2">sAAMAccountName</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" Width="260px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">departmentNumber</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server" Width="260px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="Button2" runat="server" Text="Button" />
                        <asp:Button ID="Button3" runat="server" Text="Button" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
