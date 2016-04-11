<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Pages_Message"
    MasterPageFile="~/MasterPages/MasterPage.master" Title="Message" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cphMainContent" runat="Server">
    <table border="0" cellspacing="0" cellpadding="3" width="100%">
        <tr>
            <td>
                <asp:Panel runat="server" ID="pnlMessage" Visible="true">
                    <fieldset>
                        <legend>
                            <asp:Label ID="lblMessageTitle" runat="server" Text="Error" /></legend>
                        <asp:Label ID="lblMessage" runat="server" CssClass="msgError"></asp:Label>
                    </fieldset>
                </asp:Panel>
                <br />
                <br />
                <asp:Button ID="btnBack" runat="server" Text="Go Back" OnClientClick="history.go(-1); return false;" />
            </td>
        </tr>
    </table>
</asp:Content>
