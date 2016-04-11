<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="LoggedInUsers.aspx.cs" Inherits="Pages_Security_LoggedInUsers"
    Title="Currently Logged in Users" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <table cellspacing="5" cellpadding="0" border="0" width="100%" align="center">
        <tr>
            <td class="HBlanktd">
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gv" runat="server" DataKeyNames="UserName" AutoGenerateColumns="False"
                    AllowPaging="false" SkinID="SampleGridView"  Class="table table-bordered" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblUserName" Text='<%# DataBinder.Eval(Container.DataItem, "UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Organization">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblStoreCode" Text='<%# DataBinder.Eval(Container.DataItem, "OrganizationName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblEmail" Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Unit">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRole" Text='<%# DataBinder.Eval(Container.DataItem, "UnitName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblRole" Text='<%# DataBinder.Eval(Container.DataItem, "RoleName") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Logout">
                            <ItemTemplate>
                                <asp:Button ID="btnLogOut" runat="server" CommandArgument='<%# Eval("UserName") %>'
                                    Text="Logout" OnCommand="btnLogOut_Command" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
