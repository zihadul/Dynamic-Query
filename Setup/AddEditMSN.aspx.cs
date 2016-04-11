using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using System.Data;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditMSN : System.Web.UI.Page
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
            LoadMSNGroup();
            LoadCountry();
        }
    }

    protected void Populate()
    {
        DataTable dt = new bllMSN().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["MsnName"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();
            ddlCountry.SelectedIndex =Convert.ToInt32( dt.Rows[0]["CountryId"]);
            ddlMSNGroup.SelectedIndex = Convert.ToInt32(dt.Rows[0]["MNSGroupId"]);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ddlCountry.SelectedValue) > 0 && Convert.ToInt32(ddlMSNGroup.SelectedValue) > 0)
            {
                InsertUpdate();
                Clear();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void InsertUpdate()
    {
        MSN objMSN = new MSN();
        objMSN.MsnId = ID;
        objMSN.MsnName = tbxName.Text;
        objMSN.Description = tbxDescription.Text;
        objMSN.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
        objMSN.MNSGroupId = Convert.ToInt32(ddlMSNGroup.SelectedValue);
        new bllMSN().InsertUpdate(objMSN);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }
    private void Clear()
    {
        tbxName.Text = "";
        tbxDescription.Text = "";
    }
    private void LoadMSNGroup()
    {
        ddlMSNGroup.Items.Clear();
        ddlMSNGroup.Items.Add(new ListItem("Select", "0"));
        ddlMSNGroup.DataSource = new bllMNSGroup().GetList();
        ddlMSNGroup.DataBind();
    }
    private void LoadCountry()
    {
        ddlCountry.Items.Clear();
        ddlCountry.Items.Add(new ListItem("Select", "0"));
        ddlCountry.DataSource = new bllCountry().GetList();
        ddlCountry.DataBind();
    }
   
}