<%@ Page Title="Search Result" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="SearchResultList.aspx.cs" Inherits="Pages_Search_SearchResultList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="category-content">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Literal runat="server" ID="litPagingSummary" />
                        <asp:Label runat="server" ID="lblSearchResult"></asp:Label>
                        <asp:GridView ID="gv" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" OnPageIndexChanging="gv_PageIndexChanging"
                            Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Serial">
                                    <ItemTemplate>
                                        <%# Eval("Row_Number") %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="center" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prefix">
                                    <ItemTemplate>
                                        <%# Eval("PrefixName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Army No">
                                    <ItemTemplate>
                                        <%# Eval("ArmyNo")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rank">
                                    <ItemTemplate>
                                        <%# Eval("RankName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%# Eval("Name")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit">
                                    <ItemTemplate>
                                        <%# Eval("UnitName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arms">
                                    <ItemTemplate>
                                        <%# Eval("ArmsName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Trade">
                                    <ItemTemplate>
                                        <%# Eval("TradeName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact">
                                    <ItemTemplate>
                                        <%# Eval("Contact")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TBL Account">
                                    <ItemTemplate>
                                        <%# Eval("TBLSalaryAccount")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Service Status">
                                    <ItemTemplate>
                                        <%# Eval("ServiceStatus")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ModifiedDate" Visible="false">
                                    <ItemTemplate>
                                        <%# Eval("ModifiedDate")%>
                                        <asp:Label ID="lblModifiedDate" runat="server" Text='<%# Eval("ModifiedDate")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <div class="btn-group">
                                            <%--<asp:LinkButton SkinID="lnkBtnEdit" ID="btnEdit" 
                                            PostBackUrl='<%# String.Concat("AddEditLesson.aspx?ID=", Eval("LessonId").ToString()) %>'
                                                runat="server" />--%>
                                            <asp:LinkButton SkinID="lnkBtnView" ID="btnView" runat="server" PostBackUrl='<%# String.Concat("~/Pages/CdoList/CommandoView.aspx?ArmyNo=", Eval("ArmyNo").ToString()) %>' />
                                            <asp:LinkButton SkinID="lnkBtnEdit" ID="btnEdit" runat="server" PostBackUrl='<%# String.Concat("~/Pages/CdoSetup/CdoInfo.aspx?ArmyNo=", Eval("ArmyNo").ToString()) %>' />
                                            <%--  <asp:LinkButton SkinID="lnkBtnDelete" ID="btnDelete" runat="server" OnCommand="btnDelete_OnCommand"
                                                    OnClientClick="return confirm('Clicking ok will delete this record permanently.')"
                                                    CommandArgument='<%# Eval("ArmyNo") %>' />--%>
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="250" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:Panel runat="server" ID="plcPaging" CssClass="paginationArea" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
