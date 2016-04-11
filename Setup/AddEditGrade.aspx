<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddEditGrade.aspx.cs" Inherits="Pages_Setup_AddEditGrade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" Runat="Server">
  <div class="comon-container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="defaultEntry" runat="server" DefaultButton="btnSave">
                    <div class="comn-mgn-btm">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Submit" />--%>
                                <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                                Marks From:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-10 col-md-11">
                                <asp:TextBox ID="tbxMarkFrom" runat="server" SkinID="LongText" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Marks From" ControlToValidate="tbxMarkFrom"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                                Mark To:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-10 col-md-11">
                                <asp:TextBox ID="tbxMarkTo" runat="server" SkinID="LongText" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Marks To." ControlToValidate="tbxMarkTo"></asp:RequiredFieldValidator>
                            </div>
                             <div class="col-xs-4 col-sm-2 col-md-1">
                               Point Value:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-10 col-md-11">
                                <asp:TextBox ID="tbxPointValue" runat="server" SkinID="LongText" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Point Value." ControlToValidate="tbxPointValue"></asp:RequiredFieldValidator>
                            </div>
                             <div class="col-xs-4 col-sm-2 col-md-1">
                                Latter Grade:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-10 col-md-11">
                                <asp:TextBox ID="tbxLatterGrade" runat="server" SkinID="LongText" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Latter Grade." ControlToValidate="tbxLatterGrade"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                                Description:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-10 col-md-11">
                                <asp:TextBox ID="tbxDescription" runat="server" TextMode="MultiLine" SkinID="LongText"
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Description." ControlToValidate="tbxDescription"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" ValidationGroup="Submit"
                                    OnClick="btnSave_Click" />
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-2 bakBtn">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Back" CausesValidation="false"
                                    PostBackUrl="~/Pages/Setup/GradeSetupList.aspx" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

