<%@ Page Language="C#" AutoEventWireup="true" Inherits="AddEditUser" CodeFile="AddEditUser.aspx.cs"
    ValidateRequest="false" MasterPageFile="~/MasterPages/MasterPage.master" Title="Edit User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" Width="100%">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep_1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        User Name:
                                    </label>
                                    <div class="col-md-3 marginLeft">
                                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 marginLeft">
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="Please enter 'User Name'." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        E-mail:
                                    </label>
                                    <div class="col-md-3 marginLeft">
                                        <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2 marginLeft">
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                            ErrorMessage="Please enter 'E-mail'." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid E-mail"
                                            ValidationGroup="EmailValidation" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2">
                                        Assign Role:
                                    </label>
                                    <div class="col-md-3 marginLeft">
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="lbxAssignRole" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-2 marginLeft">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lbxAssignRole"
                                            ErrorMessage="Please select 'Role'." ToolTip="Role is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                            ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="'Password' and 'Confirmation Password' must match."
                                            ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </div>
                                </div>
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"
                                    Visible="false"></asp:TextBox>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"
                                    Visible="false"></asp:TextBox>
                                <asp:TextBox ID="Question" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="Answer" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <div class="form-group">
                                    <div class="col-md-2 col-md-offset-1">
                                        <asp:Button ID="btnAddEditUser" runat="server" OnClick="btnAddEditUser_Click" Text="Create User"
                                            EnableViewState="False" ValidationGroup="CreateUserWizard1" CssClass="btn btn-success" />
                                        <asp:Button ID="Button1" runat="server" Text="Back" CausesValidation="false" CssClass="btn btn-success"
                                            PostBackUrl="~/Pages/Security/UserAdministration.aspx" />
                                    </div>
                                </div>
                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
