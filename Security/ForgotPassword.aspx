<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" Title="Forgot Password" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cphMainContent">
    <table cellspacing="0" cellpadding="0" border="0" align="center">
        <tr>
            <td>
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" SkinID="SamplePasswordRecovery">
                    <MailDefinition From="info@vintageitltd.com" IsBodyHtml="True" Priority="High" Subject="Your Password">
                    </MailDefinition>                    
                </asp:PasswordRecovery>
            </td>
        </tr>
    </table>
</asp:Content>
