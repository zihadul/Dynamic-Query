using System;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Threading;
using VITL.Web.CDO.BLL;

public partial class Pages_Security_ResetPassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        lblMessage.Text = "";

        if (!IsPostBack)
        {

            Literal lit_PageHeader = Page.Master.FindControl("lit_PageHeader") as Literal;
            if (lit_PageHeader != null)
                lit_PageHeader.Text = "Reset Password";


            if (Request.QueryString["un"] != null)
                UserDataBind();
            else
            {
                Response.Redirect("UserAdministration.aspx", false);
            }
        }
    }


    private void UserDataBind()
    {
        txtUserName.Text = EncryptDecrypt.DecryptString(Request.QueryString["un"]);

        MembershipUser user = Membership.GetUser(txtUserName.Text);
       
        if (user == null)
        {
            if (Common.SessionInfo.RedirectURL != null && Common.SessionInfo.RedirectURL != "")
                    Response.Redirect(Common.SessionInfo.RedirectURL, false);
                else
                    Response.Redirect("UserAdministration.aspx", false);
        }

        txtUserName.BorderStyle = BorderStyle.None;
        txtUserName.Enabled = false;
        txtEmail.Text = user.Email;
        //txtEmail.BorderStyle = BorderStyle.None;
        //txtEmail.Enabled = false;

        string UserRole = Roles.GetRolesForUser(txtUserName.Text)[0];

        if (UserRole.IndexOf("Applicant") > -1)
            btnList.PostBackUrl = "~/Pages/Security/ApplicantList.aspx";


    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Validate("User");
        if (!IsValid) return;


            if (Request.QueryString["un"] != null)
            {
                MembershipUser user = Membership.GetUser(txtUserName.Text);
               
                if (user == null)
                {
                    if (!string.IsNullOrEmpty(Common.SessionInfo.RedirectURL))
                        Response.Redirect(Common.SessionInfo.RedirectURL, false);
                    else
                        Response.Redirect("UserAdministration.aspx", false);

                }

                // Update Email
                user.Email = txtEmail.Text;
                Membership.UpdateUser(user);
               
                string oldPassword = user.ResetPassword(); //user.GetPassword();
                if (oldPassword.Length > 0 && Password.Text.Length > 0)
                {
                    if (user.ChangePassword(oldPassword, Password.Text))
                    {
                        new bllAudit().Insert("Security", "Reset Password", "User:" + txtUserName.Text, User.Identity.Name);
                       
                        MessageController.Show("Password has been reset.", MessageType.Information, this);
                    }
                }
            }
    }
}


