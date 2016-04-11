using System;
using System.Data;
using System.Threading;
using System.Web.Security;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.DAL;

public partial class CreateNewUser : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!Page.User.IsInRole("SuperAdmin") && !Page.User.IsInRole("Admin") && !Page.User.IsInRole("Moderator") && !Page.User.IsInRole("Operator"))
                Response.Redirect("~/Default.aspx", true);
            BindRole();
            LoadCdoUnit();
            Access();
            if (Request.QueryString["un"] != null)
                UserDataBind();

        }
    }
    private void UserDataBind()
    {
        tbxUserName.Text = EncryptDecrypt.DecryptString(Request.QueryString["un"]);

        MembershipUser user = Membership.GetUser(tbxUserName.Text);

        if (user == null)
        {
            if (Common.SessionInfo.RedirectURL != null && Common.SessionInfo.RedirectURL != "")
                Response.Redirect(Common.SessionInfo.RedirectURL, false);
            else
                Response.Redirect("UserAdministration.aspx", false);
        }
        tbxEmail.Text = user.Email;
        ddlAssignRole.SelectedItem.Text = Roles.GetRolesForUser(tbxUserName.Text)[0];
        
       


    }
    private void Access()
    {
        DataTable dt = new bllCommon().GetSystemUserByUserName(User.Identity.Name);

        if (dt.Rows.Count > 0)
        {
            string userId = dt.Rows[0]["UserId"].ToString();
            if (User.IsInRole("Admin"))
            {
                int unitId = Convert.ToInt32(dt.Rows[0]["CdoUnitId"]);
                ddlCdoUnit.SelectedValue = unitId.ToString();
                ddlCdoUnit.Enabled = false;
            }
        }
    }


    private void BindRole()
    {
        // DataTable dt = new bllCommon().GetSystemUserByUserName(tbxUserName.Text);
        if (User.IsInRole("SuperAdmin"))
        {
            ddlAssignRole.Items.Add("SuperAdmin");
            ddlAssignRole.Items.Add("Admin");
            ddlAssignRole.Items.Add("Moderator");
            ddlAssignRole.Items.Add("Operator");
        }
        if (User.IsInRole("Admin"))
        {
            ddlAssignRole.Items.Add("Moderator");
            ddlAssignRole.Items.Add("Operator");
        }
        if (User.IsInRole("Moderator"))
        {
            ddlAssignRole.Items.Add("Operator");
        }
    }

    private void LoadCdoUnit()
    {
        ddlCdoUnit.Items.Clear();
        ddlCdoUnit.Items.Add(new ListItem("Select", "0"));
        ddlCdoUnit.DataSource = new bllUnit().GetList();
        ddlCdoUnit.DataBind();
    }




    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["un"] != null)
            {
                tbxUserName.Text = EncryptDecrypt.DecryptString(Request.QueryString["un"]);
                MembershipUser user = Membership.GetUser(tbxUserName.Text);
                user.Email = tbxEmail.Text;
                Membership.UpdateUser(user);
            }
            else
            {
                MembershipCreateStatus mcs;
                Membership.CreateUser(tbxUserName.Text, Password.Text, tbxEmail.Text, "Email", tbxEmail.Text, true, out mcs);
                //Membership.UpdateUser(tbxUserName.Text, Password.Text, tbxEmail.Text, "Email", tbxEmail.Text, true, out mcs);
                if (mcs != MembershipCreateStatus.Success)
                {
                    // MessageController.Show(mcs.ToString(), MessageType.Error, this);
                    MessageController.Show("Duplicate User Name. This User Name has already been used.", MessageType.Error, this);
                    return;
                }
            }
            if (ddlAssignRole.SelectedValue != "SystemAdmin")
            {
                DataTable dt = new bllCommon().GetSystemUserByUserName(tbxUserName.Text);
                //new dalMPUnit().UserMPUnitMapping(Guid.Parse(dt.Rows[0]["UserId"].ToString()),
                //    int.Parse(lbxMPUnit.SelectedValue.ToString()), Common.SessionInfo.UserName, tbxMobile.Text);

                new bllCdoUnit().UserCdoUnitMapping(Guid.Parse(dt.Rows[0]["UserId"].ToString()), Convert.ToInt32(ddlCdoUnit.SelectedValue), "");
            }

            // Insert role
            Roles.AddUserToRole(tbxUserName.Text, ddlAssignRole.SelectedValue);
            new bllAudit().Insert("Security", "Create User", "User Name: " + tbxUserName.Text.ToUpper(), User.Identity.Name); 
            MessageController.Show("User created successfully for " + tbxUserName.Text.ToUpper() + ".", MessageType.Information, Page);
            ClarForm();

        }
        catch (Exception ex)
        {
            // MessageController.Show("Duplicate UserName. This username has already been used.", MessageType.Error, this);
        }
    }


    private void ClarForm()
    {
        tbxUserName.Text = "";
        tbxEmail.Text = "";
        ddlCdoUnit.SelectedIndex = 0;
    }
}