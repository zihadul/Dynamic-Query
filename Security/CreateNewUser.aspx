<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreateNewUser.aspx.cs" Inherits="CreateNewUser" Title="Create New User" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlContent" runat="server">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div>
                            <asp:ValidationSummary runat="server" ValidationGroup="CreateUserWizard1" />
                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            User Type:<span class="required">*</span>
                        </label>
                        <div class="col-md-6">
                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlAssignRole" AutoPostBack="true"
                                Width="200">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            CDO Unit: <span style="color: Red;">*</span>
                        </label>
                       <div class="col-md-6">
                            <asp:DropDownList ID="ddlCdoUnit" CssClass="form-control" runat="server" DataTextField="UnitName" DataValueField="UnitId"
                                 Width="200" AppendDataBoundItems="true">
                                <asp:ListItem Text="" Value="" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCdoUnit"
                                Display="Dynamic" ErrorMessage="Please select 'MP Unit'." ToolTip="MP Unit is required."
                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            User Name:<span class="required">*</span>
                        </label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control" ID="tbxUserName" runat="server" Width="200"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="UserNameRequired" runat="server"
                                ControlToValidate="tbxUserName" ErrorMessage="Enter 'User Name'." ToolTip="User Name is required."
                                ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            E-mail:<span class="required">*</span>
                        </label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control" ID="tbxEmail" runat="server" Width="200"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="EmailRequired" runat="server" ControlToValidate="tbxEmail"
                                ErrorMessage="Enter 'E-mail'." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1"
                                runat="server" ErrorMessage="Invalid E-mail" ValidationGroup="CreateUserWizard1"
                                ControlToValidate="tbxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            Password:<span class="required">*</span>
                        </label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control" ID="Password" runat="server" TextMode="Password"
                                Width="200"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="PasswordRequired" runat="server"
                                ControlToValidate="Password" ErrorMessage="Enter 'Password'." ToolTip="Password is required."
                                ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="CreateUserWizard1"
                                ID="Regex1" runat="server" ControlToValidate="Password" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"
                                ErrorMessage="Password must contain: Minimum 6 characters atleast 1 Alphabet and 1 Number"
                                ForeColor="Red" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            Confirm Password:<span class="required">*</span>
                        </label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control" ID="ConfirmPassword" runat="server" TextMode="Password"
                                Width="200"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="ConfirmPasswordRequired" runat="server"
                                ControlToValidate="ConfirmPassword" ErrorMessage="Enter 'Confirm Password'."
                                ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="'Password' and 'Confirmation Password' must match."
                                ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <asp:Button CssClass="btn btn-success" ID="Button2" runat="server" Text="Create User"
                                ValidationGroup="CreateUserWizard1" OnClick="btnCreate_Click" />
                            <asp:LinkButton SkinID="lnkBtnBack" ID="Button3" runat="server" CausesValidation="false"
                                PostBackUrl="~/Pages/Security/UserAdministration.aspx" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
