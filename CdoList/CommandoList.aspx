<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="CommandoList.aspx.cs" Inherits="Pages_CdoList_CommandoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
    <script type="text/javascript" language="javascript">
        function checkAll(Checkbox) {
            var GridVwHeaderChckbox = document.getElementById("<%=gv.ClientID %>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pnlFilter">
                <div class="form-containers">
                    <fieldset class="scheduler-border">
                        <legend class="scheduler-border">Search Criteria</legend>
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Prefix:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlPrefix" DataValueField="PrefixID"
                                    DataTextField="PrefixName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Army No:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxArmyNo" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Rank:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlRank" DataValueField="RankId"
                                    DataTextField="RankName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Name
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxName" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Unit:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlUnit" DataValueField="UnitId"
                                    DataTextField="UnitName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Arms:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlArms" DataValueField="ArmsId"
                                    DataTextField="ArmsName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Trade:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlTrade" DataValueField="TradeId"
                                    DataTextField="TradeName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Mobile:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxMobile" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                TBL Account:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxTBLAccount" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Service Status:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlServiceStatus" DataValueField="ServiceStatusId"
                                    DataTextField="ServiceStatus" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-3 col-md-2 mrgn-top">
                                <asp:Button runat="server" ID="btnFilter" OnClick="btnFilter_Click" Text="Search"
                                    CssClass="btn btn-design" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </asp:Panel>
            <div class=" col-md-12">
                <asp:Panel ID="pnlApproval" runat="server" DefaultButton="btnSave">
                    <div class="row">
                        <div class="form-group">
                            <div class=" col-md-12">
                                <div class="col-md-9">
                                </div>
                                <div class="col-md-2 rght-aline">
                                    <asp:DropDownList CssClass="form-control" ID="ddlApprovedby" runat="server">
                                        <asp:ListItem Text="All" Value="0" />
                                        <asp:ListItem Text="Approved" Value="1" />
                                        <asp:ListItem Text="UnApproved" Value="2" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-1 ">
                                    <div class="">
                                        <asp:Button CssClass="btn" ID="btnSave" runat="server" Text="Apply" OnClick="btnSave_OnClick" />
                                        <%--OnClick="btnSave_OnClick" />--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="category-content">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Literal runat="server" ID="litPagingSummary" />
                        <asp:Label runat="server" ID="lblSearchResult"></asp:Label>
                        <asp:GridView ID="gv" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" OnPageIndexChanging="gv_PageIndexChanging"
                            Class="table table-bordered" SkinID="SampleGridView" OnRowDataBound="gv_RowsDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkAll" runat="server" onclick="checkAll(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="Check_Click(this)" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                                            <asp:LinkButton SkinID="lnkBtnDelete" ID="btnDelete" runat="server" OnCommand="btnDelete_OnCommand"
                                                OnClientClick="return confirm('Clicking ok will delete this record permanently.')"
                                                CommandArgument='<%# Eval("ArmyNo") %>' />
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="250" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <asp:Panel runat="server" ID="plcPaging" CssClass="paginationArea2" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
