<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserDetails.aspx.cs" Inherits="Pages_Security_UserDetails" Title="User Details" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <table cellspacing="1" cellpadding="0" border="0" align="center" bgcolor="gray">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="3" border="0" width="100%" bgcolor="#ffffff">
                    <tr class="BoxTitle">
                        <td align="center" colspan="2">
                            Account Details
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            User Name:
                        </td>
                        <td>
                            <asp:TextBox ID="tbxUserName" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Role:
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAssignRole" AutoPostBack="true">
                            </asp:DropDownList>
                            <%-- <asp:DropDownList runat="server" ID="ddlAssignRole" AutoPostBack="true" OnSelectedIndexChanged="ddlAssignRole_SelectedIndexChanged">
                            </asp:DropDownList>--%>
                        </td>
                    </tr>
                    <%--<tr runat="server" id="trOrg">
                        <td align="right">
                            Organization:
                        </td>
                        <td style="width: 189px">
                            <asp:LinkButton ID="lbAll" runat="server" OnClick="lbAll_Click">Select All</asp:LinkButton>
                            <asp:LinkButton ID="lbNone" runat="server" OnClick="lbNone_Click">Deselect All</asp:LinkButton>
                            <asp:CheckBoxList RepeatColumns="2" RepeatDirection="Horizontal" runat="server" ID="cblOrganization">
                            </asp:CheckBoxList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td align="right">
                            Email:
                        </td>
                        <td>
                            <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="tbxEmail"
                                ErrorMessage="Please enter 'E-mail'." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address"
                                ControlToValidate="tbxEmail" ValidationGroup="CreateUserWizard1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid 
                            email address</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        </td>
                        <td>
                            <asp:Button ID="btnSave" Text="Save" ValidationGroup="CreateUserWizard1" runat="server"
                                OnClick="btnSave_Click" />&nbsp;&nbsp;
                            <asp:HyperLink ID="hlkBack" SkinID="hlkButton" runat="server" NavigateUrl="~/Pages/Security/UserAdministration.aspx"
                                Text="Back" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
