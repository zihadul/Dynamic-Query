using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using VITL.Web.CDO.BDO;
using VITL.Web.CDO.BLL;


public partial class Pages_Security_UserDetails : BasePage
{
    bllUserManagement objUserManagement = new bllUserManagement();
    bdoUser objbdoUser = new bdoUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Login.aspx", true);

        if (!(User.IsInRole("SuperAdmin")))
        {
            if (Common.SessionInfo == null)
                Common.SessionInfo = new VITL.Web.CDO.BDO.bdoSessionInfo();

            Common.SessionInfo.RedirectURL = Request.Url.ToString();
            Response.Redirect("~/Login.aspx", true);
        }

        if (!IsPostBack)
        {
            BindRole();
            BindOrganization();

            if (Request.QueryString["UN"] != null && Request.QueryString["UN"].ToString().Length > 0)
                LoadControls();
        }
    }

    private void BindRole()
    {
        ddlAssignRole.DataSource = Roles.GetAllRoles();
        ddlAssignRole.DataBind();
    }
    private void BindOrganization()
    {
        //cblOrganization.DataSource = new bllOrganization().GetList();
        //cblOrganization.DataTextField = "OrgCode";
        //cblOrganization.DataValueField = "OrgID";
        //cblOrganization.DataBind();
    }


    //protected void ddlAssignRole_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlAssignRole.SelectedItem.Text.ToLower() == "operator")
    //        trOrg.Visible = true;
    //    else
    //        trOrg.Visible = false;
    //}


    private void LoadControls()
    {
       

        MembershipUser mu = Membership.GetUser(EncryptDecrypt.EncryptDecryptString(Request.QueryString["UN"].ToString()));
            tbxUserName.Text = mu.UserName;
            //tbxOrganization.Text = objbdoUser.OrganizationName;
            ddlAssignRole.SelectedValue = Roles.GetRolesForUser(mu.UserName)[0].ToString();
            tbxEmail.Text = mu.Email;              
            //if (Roles.IsUserInRole(mu.UserName, "Operator"))
            //{
            //    DataTable dt = null;
            //    dt = new bllUser().GetUserOrganization(mu.ProviderUserKey.ToString());
            //    foreach (DataRow dr in dt.Rows)
            //    {
            //        foreach (ListItem li in cblOrganization.Items)
            //        {
            //            if (li.Value == dr["OrgID"].ToString())
            //            {
            //                li.Selected = true;
            //                break;
            //            }
            //        }
            //    }
            //    trOrg.Visible = true;
            //}
            //else
               // trOrg.Visible = false;
    }
   

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MembershipUser mu = Membership.GetUser(EncryptDecrypt.EncryptDecryptString(Request.QueryString["UN"].ToString()));
        mu.Email = tbxEmail.Text;

        Membership.UpdateUser(mu);

       // new bllUser().InsertUserOrganization(mu.ProviderUserKey.ToString(), getSelectedOrganizationsTable());

        Roles.RemoveUserFromRoles(mu.UserName, Roles.GetRolesForUser(mu.UserName));

        // Insert role
        Roles.AddUserToRole(tbxUserName.Text, ddlAssignRole.SelectedValue);

        new bllUserManagement().InsertAudit("Security", "Updated user", "User Name: " + tbxUserName.Text, User.Identity.Name);


        Response.Redirect("UserAdministration.aspx");
    }

   
}
