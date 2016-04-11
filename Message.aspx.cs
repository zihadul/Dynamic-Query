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
using VIT.ExceptionManager;

public partial class Pages_Message : BasePage
{

    public string SourceURL
    {
        get { return (string)ViewState["SourceURL"]; }
        set { ViewState["SourceURL"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        if (Request.QueryString["MID"] != null)
            lblMessage.Text = Server.HtmlDecode(Request.QueryString["MID"].ToString());
    }

    
}