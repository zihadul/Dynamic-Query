<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="GeneralSettings.aspx.cs" Inherits="Pages_Security_GeneralSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" Runat="Server">
<div class="col-md-10">
        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-md-12">
                    <asp:ValidationSummary ID="ValidationSummary" ValidationGroup="GroupGeneralSetting"
                        runat="server" />
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-6 col-md-2">
                    Max File Size (KB):<span style="color: red">*</span>
                </label>
                <div class="col-xs-6 col-md-3">
                    <asp:TextBox ID="tbxMaxFileSize" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="Input maximum file size." ValidationGroup="GroupGeneralSetting" ControlToValidate="tbxMaxFileSize">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Invalid maximum file size."
                        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="GroupGeneralSetting" ControlToValidate="tbxMaxFileSize">*</asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Maximum file size cannot be 0."
                        Operator="NotEqual" ValueToCompare="0" Display="Dynamic" ValidationGroup="GroupGeneralSetting" ControlToValidate="tbxMaxFileSize">*</asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-6 col-md-2">
                    Max Image Size (KB):<span style="color: red">*</span>
                </label>
                <div class="col-xs-6 col-md-3">
                    <asp:TextBox ID="tbxMaxImageSize" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="Input maximum file size." ValidationGroup="GroupGeneralSetting" ControlToValidate="tbxMaxImageSize">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Invalid maximum file size."
                        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="GroupGeneralSetting" ControlToValidate="tbxMaxImageSize">*</asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Maximum image size cannot be 0." ValidationGroup="GroupGeneralSetting"
                        Operator="NotEqual" ValueToCompare="0" Display="Dynamic" ControlToValidate="tbxMaxImageSize">*</asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-6 col-md-9 col-md-offset-2">
                    <asp:Button CssClass="btn btn-success" ID="btnSave1" runat="server" ValidationGroup="GroupGeneralSetting"
                        Text="Save" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

