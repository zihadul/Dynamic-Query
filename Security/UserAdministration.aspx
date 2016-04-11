<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="UserAdministration.aspx.cs" Inherits="Pages_Security_UserAdministration"
    Title="User Administration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <table cellspacing="5" cellpadding="0" border="0" width="100%" align="center">
        <tr>
            <td align="left">
                <asp:Button ID="btnAddNew" runat="server" CssClass="btn add-nwbtn" Text="Add New" PostBackUrl="~/Pages/Security/CreateNewUser.aspx"
                    OnClick="btnAddNew_Click" /><br /><br />
            </td>
        </tr>
        <tr>
            <td class="HBlanktd">
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Literal runat="server" ID="litPagingSummary" />
                        <div class="HorzSpace">
                        </div>
                        <asp:GridView ID="gv" runat="server" DataKeyNames="UserName" AutoGenerateColumns="False"
                            PageSize="10" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound"
                            OnRowCreated="gv_RowCreated" OnSorting="gv_Sorting" SkinID="SampleGridView"
                            Class="table table-bordered" Width="100%">
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
                                <asp:TemplateField HeaderText="Unit">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUnit" Text='<%# DataBinder.Eval(Container.DataItem, "UnitName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" CssClass="GridCellStyle" />
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblEmail" Text='<%# DataBinder.Eval(Container.DataItem, "Email") %>'></asp:Label>
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
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnReset" PostBackUrl='<%# String.Concat("~/Pages/Security/ResetPassword.aspx?un=", EncryptDecrypt.EncryptString(Eval("UserName").ToString()))%>'
                                            SkinID="ButtonReset" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("AddEditUser.aspx?UN=", Eval("UserName").ToString()) %>' />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("UserName") %>' OnClientClick="return confirm('Pressing OK will delete this record. Do you want to continue?')"
                                            OnCommand="btnDelete_Command"></asp:Button>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                                </asp:TemplateField>
                               <%-- <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnViewDetails" runat="server"  Text="Edit" SkinID="lnkBtnEdit"
                                             PostBackUrl='<%# String.Concat("~/Pages/Security/CreateNewUser.aspx?un=", EncryptDecrypt.EncryptString(Eval("UserName").ToString()))%>'></asp:Button>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" SkinID="lnkBtnDelete" Text="Delete" OnClientClick="return confirm('Pressing OK will delete this record. Do you want to continue?')"
                                            OnCommand="btnDelete_Command" CommandArgument='<%# Eval("UserName")%>'></asp:Button>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                        <center>
                            <asp:Panel runat="server" ID="plcPaging" CssClass="paginationArea" />
                        </center>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
