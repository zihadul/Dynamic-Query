<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="CdoInfo.aspx.cs" Inherits="Pages_CdoSetup_CdoInfo"
    Title="TDB: Add New Commando" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/ComBasicInfo.ascx" TagPrefix="ComBasicInfo" TagName="BacicInfo" %>
<%@ Register Src="~/UserControls/ComMSN.ascx" TagPrefix="ComMSN" TagName="msn" %>
<%@ Register Src="~/UserControls/ComDiscipState.ascx" TagPrefix="disp" TagName="comDisp" %>
<%@ Register Src="~/UserControls/MedicalInfo.ascx" TagPrefix="MediclInfo" TagName="mdcal" %>
<%@ Register Src="~/UserControls/APR.ascx" TagPrefix="uc" TagName="apr" %>
<%@ Register Src="~/UserControls/SpecialQualification.ascx" TagPrefix="uc" TagName="SpecialQualification" %>
<%--<%@ Register Src="~/UserControls/ComInfo/Expertise.ascx" TagPrefix="Expertise" TagName="exprts" %>--%>
<%@ Register Src="~/UserControls/Course.ascx" TagPrefix="uc" TagName="course" %>
<%@ Register Src="~/UserControls/Cadre.ascx" TagPrefix="uc" TagName="cadre" %>
<%@ Register Src="~/UserControls/CmndService.ascx" TagPrefix="uc" TagName="service" %>
<%@ Register Src="~/UserControls/NOK.ascx" TagPrefix="uc" TagName="nok" %>
<%@ Register Src="~/UserControls/Remark.ascx" TagPrefix="Remarks" TagName="Remarks" %>
<%--<%@ Register Src="~/UserControls/FinalSubmission.ascx" TagPrefix="uc" TagName="submission" %>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="namePnl" CssClass="name-content" runat="server">
                <div class="basicInfoNamePlt">
                    <asp:Label ID="tbxRnk" runat="server" Text=""></asp:Label>
                    <asp:Label ID="tbxName" runat="server" Text=""></asp:Label>
                    <asp:Label ID="tbxArmsNo" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>
            <asp:HiddenField ID="hfldTerrID" runat="server" />
            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" OnActiveTabChanged="tabProductInfo_ActiveTabChanged"
                AutoPostBack="True">
                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Basic Info">
                    <ContentTemplate>
                        <ComBasicInfo:BacicInfo ID="CobBacInfo" runat="server" />
                        <div class="col-xs-3 col-sm-2 col-md-1 margin-top-reset colmd-offset">
                            <asp:Button ID="Button1" runat="server" Text="Reset" OnClick="OnBtnReset_Click" CssClass="btn btn-design" />
                        </div>
                        <div class="col-xs-7 col-sm-3 col-md-2 margin-top20px btnsave cmn-left">
                            <asp:Button ID="btnSave" runat="server" Text="Save & Continue" OnClick="OnBtnSave_Click"
                                CssClass="btn btn-design " ValidationGroup="cmdbasic" />
                        </div>
                        <div class="col-xs-5 col-sm-2 col-md-1 margin-top20px cmn-left2">
                            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-design" OnClick="btnNext_Click" />
                        </div>
                        <br />
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="MSN">
                    <ContentTemplate>
                        <ComMSN:msn ID="comMsn" runat="server" />
                        <asp:Panel ID="btnPanel" runat="server" class="btnPnl">
                            <div class="col-xs-12 col-sm-3 col-md-3 margin-topLeft">
                                <asp:Button ID="btnPre" Text="Previous" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12
                        col-sm-4 col-md-3 cmn-left3 margin-top7px">
                                <asp:Button ID="Button2" Text="Save
                        & Continue" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn" OnClick="btnSaveMSN_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-1 btnNext
                        cmn-left4 margin-top7px">
                                <asp:Button ID="Button3" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Discip State">
                    <ContentTemplate>
                        <disp:comDisp ID="dipState" runat="server" />
                        <asp:Panel ID="Panel1" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button4" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left5 margin-top7px">
                                <asp:Button ID="Button5" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnSaveDiscipState_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2
                        col-md-1 btnNext cmn-left6 margin-top7px">
                                <asp:Button ID="Button6" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Medical Info">
                    <ContentTemplate>
                        <MediclInfo:mdcal ID="mdcl" runat="server" />
                        <asp:Panel ID="Panel2" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button7" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button8" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnMedicalInfoSave_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2
                        col-md-1 btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button9" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="APR">
                    <ContentTemplate>
                        <uc:apr ID="AprInfr" runat="server" />
                        <asp:Panel ID="Panel3" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button10" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button11" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnAPRSave_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-1
                        btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button12" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="Special Qualification">
                    <ContentTemplate>
                        <uc:SpecialQualification ID="SpecialQualification" runat="server" />
                        <asp:Panel ID="Panel4" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button13" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button14" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnSpecialQualificationSave_Click" />
                            </div>
                            <div class="col-xs-12
                        col-sm-2 col-md-1 btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button15" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel8" runat="server" HeaderText="Course">
                    <ContentTemplate>
                        <uc:course ID="cors" runat="server" />
                        <asp:Panel ID="Panel5" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button16" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button17" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnCourseSave_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2
                        col-md-1 btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button18" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel9" runat="server" HeaderText="Cadre">
                    <ContentTemplate>
                        <uc:cadre ID="cdre" runat="server" />
                        <asp:Panel ID="Panel6" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button19" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button20" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnCadreSave_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2
                        col-md-1 btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button21" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel10" runat="server" HeaderText="Commando Service">
                    <ContentTemplate>
                        <uc:service ID="service" runat="server" />
                        <asp:Panel ID="Panel7" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft2">
                                <asp:Button ID="Button22" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button23" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnCommandoServiceSave_Click" />
                            </div>
                            <div class="col-xs-12
                        col-sm-2 col-md-1 btnNext cmn-left8 margin-top7px">
                                <asp:Button ID="Button24" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel11" runat="server" HeaderText="NOK">
                    <ContentTemplate>
                        <uc:nok ID="nok1" runat="server" />
                        <asp:Panel ID="Panel8" runat="server" class="btnPnl">
                            <div class="col-xs-12 col-sm-3
                        col-md-2 margin-topLeft">
                                <asp:Button ID="Button25" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left9 margin-top7px">
                                <asp:Button ID="Button26" Text="Save & Continue" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnNOKSave_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-2 col-md-1
                        btnNext cmn-left4 margin-top7px">
                                <asp:Button ID="Button27" Text="Next" CausesValidation="false" runat="server" CssClass="btn btn-design addnwbtn"
                                    OnClick="btnNext_Click" />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel7" runat="server" HeaderText="Remarks">
                    <ContentTemplate>
                        <Remarks:Remarks ID="rmk" runat="server" />
                        <asp:Panel ID="Panel9" runat="server" class="btnPnl2">
                            <div class="col-xs-12
                        col-sm-3 col-md-2 margin-topLeft">
                                <asp:Button ID="Button28" Text="Previous" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design addnwbtn" OnClick="btnPre_Click" />
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-3 cmn-left7 margin-top7px">
                                <asp:Button ID="Button29" Text="Save & Finish" CausesValidation="false" runat="server"
                                    CssClass="btn btn-design
                        addnwbtn" OnClick="btnRemarksSave_Click" />
                            </div>
                            <%--<div class="col-xs-12 col-sm-2
                        col-md-1 btnNext cmn-left3"> <asp:Button ID="btnFinish" Text="Finish" CausesValidation="false"
                        runat="server" CssClass="btn btn-design addnwbtn" OnClick="btnFinish_Click" /> </div>--%>
                        </asp:Panel>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearfix margin-top10 btnSaveAll">
        <asp:Button ID="btnSubmission" runat="server" Text="Save All" Font-Names="verdana"
            CssClass="btn btn-design" OnClick="btnSaveAll_Click" />
    </div>
</asp:Content>
