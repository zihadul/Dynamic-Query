using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditPrefix : System.Web.UI.Page
{

    int ID
    {
        set { ViewState["ID"] = value; }
        get
        {
            try
            {
                return Convert.ToInt32(ViewState["ID"].ToString());
            }
            catch
            {
                return 0;
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                ID = Convert.ToInt32(Request.QueryString["ID"].ToString());
            }

            if (ID > 0)
                Populate();
        }
    }

    protected void Populate()
    {
        DataTable dt = new bllPrefix().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxPrefix.Text = dt.Rows[0]["PrefixName"].ToString();
            
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            InsertUpdate();
            clear();
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void InsertUpdate()
    {
        ArmyPrerfix objPrefix = new ArmyPrerfix();
        objPrefix.PrefixID = ID;
        objPrefix.PrefixName = tbxPrefix.Text;
        new bllPrefix().InsertUpdate(objPrefix);
        new bllAudit().Insert("Setup", "InsertUpdate Prefix", "Prefix: " + tbxPrefix.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }

    private void clear()
    {
      tbxPrefix.Text = "";
    }


     

}