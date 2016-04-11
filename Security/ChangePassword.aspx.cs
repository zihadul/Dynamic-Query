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

public partial class ChangePassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Login.aspx", true);

        if (!(User.IsInRole("SuperAdmin") || User.IsInRole("Admin") || User.IsInRole("Moderator") || User.IsInRole("Operator")))
        {
            if (Common.SessionInfo == null)
                Common.SessionInfo = new VITL.Web.CDO.BDO.bdoSessionInfo();

            Common.SessionInfo.RedirectURL = Request.Url.ToString();
            Response.Redirect("~/Login.aspx", true);
        }
    }
}
