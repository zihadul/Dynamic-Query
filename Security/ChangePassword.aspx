<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Change Password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="container">
        <table cellspacing="0" cellpadding="0" border="0" align="center">
            <tr>
                <td>
                    <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/Default.aspx"
                        SkinID="SampleChangePassword">
                    </asp:ChangePassword>
                </td>
            </tr>
        </table>
        <%--<div class="change-password-content">
       <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-4 col-sm-push-3 col-md-push-4">
               <div class="Chng-paswrd-main-content">
                   <div class="change-paswrd-header">
                      Change Your Pasword
                   </div>
                   <div class="chnge-pswrd-form">
                       <div class="row">
                           <div class="col-xs-5 col-sm-4 col-md-4">
                              Password
                           </div>
                           <div class="col-xs-7 col-sm-8 col-md-8">
                               <asp:TextBox runat="server" TextMode="Password" ID="TextBox2" class="form-control txtbx" placeholder="Password"/>                                
                           </div><br /><br />
                           <div class="col-xs-5 col-sm-4 col-md-4">
                             New Password
                           </div>
                           <div class="col-xs-7 col-sm-8 col-md-8">
                               <asp:TextBox runat="server" TextMode="Password" ID="TextBox1" class="form-control txtbx" placeholder="New Password"/>                                
                           </div><br /> <br />
                           <div class="col-xs-5 col-sm-4 col-md-4">
                                ConfirmPassword
                           </div>
                           <div class="col-xs-7 col-sm-8 col-md-8">
                               <asp:TextBox runat="server" TextMode="Password" ID="TextBox3" class="form-control txtbx" placeholder="ConfirmPassword"/>                                
                           </div><br />
                           <div class="cngpswrd-btn-contnet">
                                 <div class="col-xs-7 col-sm-7 col-md-7">
                                     <asp:Button runat="server" ID="Cngpswrdbtn" Text="Change Password" CssClass="btn btn-design chng-pswrd-btns" />
                                 </div>  
                                 <div class="col-xs-5 col-sm-5 col-md-5">
                                   <asp:Button runat="server" ID="Button1" Text="Cancel" CssClass="btn btn-design" />
                                 </div>  
                            </div>
                       </div>                                 
                  </div>
               </div>
          </div>
       </div>
    </div>--%>
    </div>
</asp:Content>
