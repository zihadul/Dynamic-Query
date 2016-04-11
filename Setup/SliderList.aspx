<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="SliderList.aspx.cs" Inherits="Pages_Setup_SliderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="comon-container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-xs-6 col-sm-2 col-md-2 mrgn-btm10px">
                        <asp:Button ID="btnRank" runat="server" Text="Add New" PostBackUrl="~/Pages/Setup/AddEditSlider.aspx"
                            CssClass="btn add-nwbtn" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <asp:Literal runat="server" ID="litPagingSummary" />
                        <asp:Label runat="server" ID="lblSearchResult"></asp:Label>
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" SkinID="SampleGridView"
                            Class="table table-bordered" AllowPaging="True"
                            PageSize="20" DataKeyNames="ID" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="ImageName" HeaderText="Image Name" HeaderStyle-HorizontalAlign="Center">
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-HorizontalAlign="Center">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ImageUrl='<%# String.Concat( "~/UserFile/Slider/",Eval("ImageName").ToString()) %>'
                                            runat="server" ID="btnImg" Width="100" Height="80" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton SkinID="lnkBtnEdit" ID="btnEdit" runat="server" PostBackUrl='<%# String.Concat("~/Pages/Setup/AddEditSlider.aspx?ID=", Eval("ID")) %>' />
                                        <asp:LinkButton SkinID="lnkBtnDelete" ID="LinkButton1" runat="server" OnCommand="btnDelete_Command"
                                            OnClientClick="return confirm('Clicking ok will delete this record permanently.')"
                                            CommandArgument='<%# Eval("ID") %>' />
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
