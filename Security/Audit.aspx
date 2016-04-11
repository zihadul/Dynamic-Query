<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="Audit.aspx.cs" Inherits="Pages_Security_Audit"
    Title="Audit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <table cellspacing="5" cellpadding="0" border="0" width="100%" align="center" >
        <tr>
            <td align="left" class="SearchPanel">
                <asp:Panel runat="server" ID="pnlSearch">
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Criteria</legend>
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkModule" runat="server" Text="By Module" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlModule" CssClass="form-control">
                                       <asp:ListItem>CDO</asp:ListItem>
                                        <asp:ListItem>Setup</asp:ListItem>
                                        <asp:ListItem>Security</asp:ListItem>
                                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chkAction"  runat="server" Text="By Action" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxAction" CssClass="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chkLog" runat="server" Text="By Log" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxLog" CssClass="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chkUser" runat="server" Text="By User" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlUser" CssClass="form-control" DataTextField="UserName" />&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                <asp:ImageButton runat="server" ID="btnSearch" ImageUrl="~/App_Themes/Olive/images/search.png " OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="HBlanktd" align="right">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Literal runat="server" ID="litPagingSummary" />
                <div class="HorzSpace" />
                <asp:GridView ID="gv" runat="server" DataKeyNames="user" AutoGenerateColumns="False"
                    PageSize="<%$ appSettings:GridViewPageSize %>" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" AllowSorting="true"
                    OnRowDataBound="gv_RowDataBound" OnSorting="gv_Sorting" Width="100%"  Class="table table-bordered" SkinID="SampleGridView">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <asp:Label ID="lblSerial" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" CssClass="GridCellStyle" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ModuleName" HeaderText="Module Name" SortExpression="ModuleName">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Log" HeaderText="Log" SortExpression="Log">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="actiondate" HeaderText="Date" SortExpression="actiondate">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="user" HeaderText="User" SortExpression="[user]">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <center>
                    <asp:Panel runat="server" ID="plcPaging" CssClass="paginationArea" />
                </center>
            </td>
        </tr>
    </table>
</asp:Content>
