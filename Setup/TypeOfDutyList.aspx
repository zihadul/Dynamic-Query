<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="TypeOfDutyList.aspx.cs" Inherits="Pages_Setup_TypeOfDutyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="comon-container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-xs-6 col-sm-2 col-md-2 mrgn-btm10px">
                        <asp:Button ID="btnRank" runat="server" Text="Add New" PostBackUrl="~/Pages/Setup/AddEditTypeOfDuty.aspx"
                            CssClass="btn add-nwbtn" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" SkinID="SampleGridView"
                            Class="table table-bordered" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging"
                            PageSize="20" DataKeyNames="TypeOfDutyId" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="TypeOfDuty" HeaderText="Type Of Duty" HeaderStyle-HorizontalAlign="Center">
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-HorizontalAlign="Center">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:ImageButton SkinID="ButtonEdit" runat="server" Text="Edit" ID="btnEdit" PostBackUrl='<%# String.Concat("~/Pages/Setup/AddEditTypeOfDuty.aspx?ID=", Eval("TypeOfDutyId")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle CssClass="ItemStyle" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton SkinID="ButtonDelete" ID="btnDelete" runat="server" Text="Delete"
                                            CommandArgument='<%# Eval("TypeOfDutyId") %>' OnClientClick="return confirm('Pressing OK will delete this record. Do you want to continue?')"
                                            OnCommand="btnDelete_Command"></asp:ImageButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="GridCellStyle" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
