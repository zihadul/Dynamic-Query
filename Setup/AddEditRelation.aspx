<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="AddEditRelation.aspx.cs" Inherits="Pages_Setup_AddEditRelation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
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
                            <div class="col-xs-4 col-sm-3 col-md-2">
                                Relation:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-9 col-md-10">
                                <asp:TextBox ID="tbxRelation" runat="server" SkinID="LongText" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Relation" ControlToValidate="tbxRelation"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-4 col-sm-3 col-md-2">
                                Description:<font color="red">*</font>
                            </div>
                            <div class="col-xs-8 col-sm-9 col-md-10">
                                <asp:TextBox ID="tbxDescription" runat="server" SkinID="LongText" TextMode="MultiLine"
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Submit"
                                    runat="server" ErrorMessage="Enter Description." ControlToValidate="tbxDescription"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-xs-4 col-sm-3 col-md-2">
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-1">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save" ValidationGroup="Submit"
                                    OnClick="btnSave_Click" />
                            </div>
                            <div class="col-xs-4 col-sm-2 col-md-2 bakBtn">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Back" CausesValidation="false"
                                    PostBackUrl="~/Pages/Setup/RelationList.aspx" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
