<%@ Page Title="Reset password" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Pages_Security_ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:Panel ID="pnlContent" runat="server">
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="User" runat="server" />
        <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="true"></asp:Label>
        <div class="col-xs-4 col-sm-2 col-md-2 mrgn-toptxt">
            User Name:
        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 margin-top10 left-Margin">
            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-4 col-sm-2 col-md-2 mrgn-toptxt">
        Email:
        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 margin-top10 left-Margin">
        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-4 col-sm-2 col-md-2 mrgn-toptxt">
        New Password:<span class=required>*</span>
        </div>
        <div class="col-xs-8 col-sm-4 col-md-3 margin-top10 left-Margin">
        <asp:TextBox ID="Password" SkinID="SinglelineShortText" CssClass="form-control" runat="server"
            TextMode="Password"></asp:TextBox>
             </div>
        <div class="clearfix"></div>
        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
            ErrorMessage="Please enter 'New Password'." ToolTip="Password is required." ValidationGroup="User"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Password"
            ErrorMessage="Password length must be 5 or more" ValidationExpression="\w{5,255}"
            ValidationGroup="User">-</asp:RegularExpressionValidator>
            
        <div class="col-xs-4 col-sm-2 col-md-2 mrgn-toptxt">
        Confirm New Password:<span class=required>*</span>
         </div>
        <div class="col-xs-8 col-sm-4 col-md-3 margin-top10 left-Margin">
        <asp:TextBox ID="ConfirmPassword" SkinID="SinglelineShortText" CssClass="form-control"
            runat="server" TextMode="Password"></asp:TextBox>
            </div>
        <div class="clearfix"></div>
        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
            ErrorMessage="Please enter 'Confirm Password'." ToolTip="Confirm Password is required."
            ValidationGroup="User"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
            Operator="Equal" ValidationGroup="User" runat="server" ErrorMessage="Password and confirm password are not same">*</asp:CompareValidator>
            
         <div class="col-xs-8 col-sm-4 col-md-3 col-md-offset-2 col-sm-offset-4 left-Margin">
        <asp:Button ID="btnReset" CssClass="btn btn-design addnwbtn" CausesValidation="true" ValidationGroup="User" OnClientClick="return confirm('Pressing OK will reset the password of this user. Do you want to continue?')"
            runat="server" Text="Reset" OnClick="btnReset_Click" />&nbsp;
        <asp:Button ID="btnList" CssClass="btn btn-design addnwbtn" runat="server" CausesValidation="false" Text="Back" PostBackUrl="~/Pages/Security/UserAdministration.aspx" />
        </div>
    </asp:Panel>
    <ajaxToolkit:RoundedCornersExtender ID="rceContentArea" runat="server" BorderColor="#c1a669"
        Corners="Top" Radius="3" TargetControlID="pnlContent" />
</asp:Content>
