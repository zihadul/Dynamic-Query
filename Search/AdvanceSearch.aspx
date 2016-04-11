<%@ Page Title="Advance Search" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="AdvanceSearch.aspx.cs" Inherits="Pages_CdoList_AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="form-containers">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">General Information</legend>
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
                            Name:
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
                    </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">MSN</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                MSN Name:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlMsn" DataValueField="MsnId"
                                    DataTextField="MsnName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                From Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxMsnFromDate" runat="server" SkinID="SkinPrice" CssClass="form-control" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender1"
                                    TargetControlID="tbxMsnFromDate" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                To Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxMsnToDate" runat="server" SkinID="SkinPrice" CssClass="form-control" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender2"
                                    TargetControlID="tbxMsnToDate" />
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Discip State</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Charge Section:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxChargeSection"  runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Discip State:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlDiscipState" DataValueField="DiscipStateId"
                                    DataTextField="DiscipStateName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Offence Type:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlOffenceType" DataValueField="OffenceId"
                                    DataTextField="OffenceName" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Punishment Awarded:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlPnsmntAwrd" AutoPostBack="True"
                                    DataValueField="PunishmentAwardedId" DataTextField="Name" AppendDataBoundItems="True" />
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Medical Info</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Medical Category:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlMedicalCategory"
                                    DataValueField="MedicalCategoryId" DataTextField="MedicalCategoryName" AutoPostBack="True"
                                    AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                From Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxMCFromDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender3"
                                    TargetControlID="tbxMCFromDate" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                To Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxMCToDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender4"
                                    TargetControlID="tbxMCToDate" />
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="col-xs-3 col-sm-1 col-md-1 mrgn-toptxt">
                                Type of Disability:
                            </div>
                            <div class="col-xs-9 col-sm-6 col-md-8 mrgn-top">
                                <asp:CheckBoxList ID="cbxDisability" RepeatColumns="3" RepeatDirection="Vertical"
                                    RepeatLayout="Table" Width="100%" runat="server">
                                </asp:CheckBoxList>
                                <%--<asp:CheckBoxList ID="cbxDisability" runat="server" Width="100%">
                                    </asp:CheckBoxList>--%>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">APR</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Marks between:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxAPRMarksFrom" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-8 col-sm-1 col-md-1 mrgn-toptxt">
                                and:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxAPRMarksTo" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Year:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                                <%-- <asp:TextBox CssClass="form-control" Width="50%" ID="TextBox7" runat="server"></asp:TextBox>--%>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Special Qualification</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-12 col-sm-10 col-md-9 mrgn-toptxt">
                                <%--<asp:CheckBoxList ID="chkExpertise" runat="server" Width="100%">
                                    </asp:CheckBoxList>--%>
                                <asp:CheckBoxList ID="chkExpertise" RepeatColumns="3" RepeatDirection="Vertical"
                                    RepeatLayout="Table" Width="100%" runat="server">
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Course</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Course Name:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCourse" DataValueField="CourseId"
                                    DataTextField="Course" AutoPostBack="True" AppendDataBoundItems="True" />
                                <%--<asp:TextBox CssClass="form-control" Width="100%" ID="TextBox11" runat="server"></asp:TextBox>--%>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                From Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxCourseFromDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender5"
                                    TargetControlID="tbxCourseFromDate" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                To Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxCourseToDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender6"
                                    TargetControlID="tbxCourseToDate" />
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Cadre</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Cadre Name:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCadre" DataValueField="CadreId"
                                    DataTextField="Cadre" AutoPostBack="True" AppendDataBoundItems="True" />
                                <%--<asp:TextBox CssClass="form-control" Width="100%" ID="TextBox16" runat="server"></asp:TextBox>--%>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                From Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxCadreFromDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender7"
                                    TargetControlID="tbxCadreFromDate" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                To Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxCadreToDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender8"
                                    TargetControlID="tbxCadreToDate" />
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Commando Service</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Place Of Service:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlPlaceofService" DataValueField="PlaceOfServiceId"
                                    DataTextField="PlaceOfService" AutoPostBack="True" AppendDataBoundItems="True" />
                                <%--<asp:TextBox CssClass="form-control" Width="100%" ID="TextBox24" runat="server"></asp:TextBox>--%>
                            </div>
                           <%-- <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Type of Duty:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlTypeOfDuty" DataValueField="TypeOfDutyId"
                                    DataTextField="TypeOfDuty" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>--%>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                From Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxPSFromDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender9"
                                    TargetControlID="tbxPSFromDate" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                To Date:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox ID="tbxPSToDate" runat="server" SkinID="SkinPrice" CssClass="form-control resize-txtbx" />
                                <ajaxToolkit:CalendarExtender runat="server" Format="dd-MMM-yyyy" ID="CalendarExtender10"
                                    TargetControlID="tbxPSToDate" />
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">NOK</legend>
                    <div class="form-containers">
                        <div class="row">
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                NOK Name:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxNOKName" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Relation:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlRelation" DataValueField="RelationId"
                                    DataTextField="Relation" AutoPostBack="True" AppendDataBoundItems="True" />
                            </div>
                            <div class="col-xs-4 col-sm-1 col-md-1 mrgn-toptxt">
                                Mobile No:
                            </div>
                            <div class="col-xs-8 col-sm-3 col-md-2 mrgn-top">
                                <asp:TextBox CssClass="form-control" Width="100%" ID="tbxNOKContact" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-xs-12 col-sm-12 col-md-12  advSearch2">
            <div class="col-md-2 searchBtn">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="form-control" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>
</asp:Content>
