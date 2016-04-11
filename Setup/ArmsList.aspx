<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="ArmsList.aspx.cs" Inherits="Pages_Setup_ArmsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="comon-container">
        <asp:Panel runat="server" ID="pnlFilter">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Search Criteria</legend>
                <div class="row">
                    <div class="col-md-6 col-sm-8 col-xs-12">
                        <div class="col-md-2 col-sm-3 col-xs-4">
                            <label>
                                Arms :
                            </label>
                        </div>
                        <div class="col-md-6 col-sm-3 col-xs-4">
                            <asp:TextBox CssClass="form-control" ID="tbxArms" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                            <div class="">
                                <asp:ImageButton runat="server" ID="btnSearch" SkinID="SearchButton" ImageAlign="left"
                                    class="btnSearch-img2" OnClick="btnFilter_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </asp:Panel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-xs-6 col-sm-2 col-md-2 mrgn-btm10px">
                        <asp:Button ID="btnRank" runat="server" Text="Add New" PostBackUrl="~/Pages/Setup/AddEditArms.aspx"
                            CssClass="btn add-nwbtn" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <asp:Literal runat="server" ID="litPagingSummary" />
                        <asp:Label runat="server" ID="lblSearchResult"></asp:Label>
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" SkinID="SampleGridView"
                            Class="table table-bordered" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging"
                            PageSize="20" DataKeyNames="ArmsId" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="ArmsName" HeaderText="Arms"></asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description"></asp:BoundField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton SkinID="lnkBtnEdit" ID="btnEdit" runat="server" PostBackUrl='<%# String.Concat("~/Pages/Setup/AddEditArms.aspx?ID=", Eval("ArmsId")) %>' />
                                        <asp:LinkButton SkinID="lnkBtnDelete" ID="LinkButton1" runat="server" OnCommand="btnDelete_Command"
                                            OnClientClick="return confirm('Clicking ok will delete this record permanently.')"
                                            CommandArgument='<%# Eval("ArmsId") %>' />
                                    </ItemTemplate>
                                    <ItemStyle CssClass="GridCellStyle" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel runat="server" ID="plcPaging" CssClass="paginationArea" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
