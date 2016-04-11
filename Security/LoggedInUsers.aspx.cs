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
using System.Collections.Generic;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Security_LoggedInUsers : BasePage
{
    private int UnitId
    {
        get
        {
            if (ViewState["UnitId"] == null)
                return 0;
            return Convert.ToInt32(ViewState["UnitId"].ToString()); //
        }
        set { ViewState["UnitId"] = value; }
    }
    bllUserManagement objUserManagement = new bllUserManagement();
    List<bdoUser> objbdoUser = new List<bdoUser>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Login.aspx", true);

        //if (!(User.IsInRole("SuperAdmin")))
        //{
        //    if (Common.SessionInfo == null)
        //        Common.SessionInfo = new VITL.Web.CDO.BDO.bdoSessionInfo();

        //    Common.SessionInfo.RedirectURL = Request.Url.ToString();
        //    Response.Redirect("~/Login.aspx", true);
        //}


        if (Request.QueryString["printmode"] == "y")
            gv.Columns[gv.Columns.Count - 1].Visible = false;

        BindData();
    }

    protected void BindData()
    {

       // if (Application["user"] == null) return;

        //DataTable objAllUsers = objUserManagement.GetList(0, 0, "", "");
        //List<bdoUser> objLoggedInUsers = new List<bdoUser>();
        //List<String> users = Application["user"] as List<String>;


        //List<bdoUser> objAllUsers2 = GetMappedObject(objAllUsers);

        //foreach (DataRow objUser in objAllUsers.Rows)
        //{  
        //    for (int i = 0; i < users.Count; i++)
        //    {
        //        if (users[i].ToLower() == objUser[""].ToString().ToLower())
        //        {                   
        //            objLoggedInUsers.Add(objAllUsers2);
        //            break;
        //        }
        //    }
        //}

        //gv.DataSource = objLoggedInUsers;
        //gv.DataBind();     

        //DataTable CommonDt = new bllCommon().GetSystemUserByUserName(User.Identity.Name);

        //if (CommonDt.Rows.Count > 0)
        //{
        //    string userId = CommonDt.Rows[0]["UserId"].ToString();
        //    string unit = CommonDt.Rows[0]["CdoUnitId"].ToString();
        //    UnitId = Convert.ToInt32(unit);
        //}
        if (Application["user"] == null) return;

        //List<bdoUser> objAllUsers = objUserManagement.GetList(0, 0, "", "");
        DataTable dt = new bllUser().GetListForSupperAdmin();

        //List<bdoUser> objAllUsers = new List<bdoUser>();
        //foreach (DataRow dr in dt.Rows)
        //{   dr.
        //    objAllUsers.Add(dr);
        //}
        List<bdoUser> objLoggedInUsers = new List<bdoUser>();
        
        List<String> users = Application["user"] as List<String>;

        foreach (DataRow dr in dt.Rows)
        {

            for (int i = 0; i < users.Count; i++)
            {
                if (users[i].ToLower() == dr[0].ToString().ToLower())
                {
                    bdoUser obUser = new bdoUser();
                    obUser.UserName = dr[0].ToString();
                    obUser.Email = dr[2].ToString();
                    obUser.RoleName = dr[5].ToString();
                    obUser.UnitName = dr[7].ToString();
                    objLoggedInUsers.Add(obUser);
                  
                    break;
                }
            }
        }

        gv.DataSource = objLoggedInUsers;
        gv.DataBind();
    }
    protected void btnLogOut_Command(object sender, CommandEventArgs e)
    {
        if (Application["user"] != null)
        {
            List<String> users = Application["user"] as List<String>;
            users.Remove(e.CommandArgument.ToString());
            Application["user"] = users;
        }
        
        BindData();
    }
}