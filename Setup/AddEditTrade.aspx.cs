using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditTrade : System.Web.UI.Page
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
        DataTable dt = new bllTrade().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxName.Text = dt.Rows[0]["TradeName"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            InsertUpdate();
            Clear();
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void InsertUpdate()
    {
        Trade objTrade = new Trade();
        objTrade.TradeId = ID;
        objTrade.TradeName = tbxName.Text;
        objTrade.Description = tbxDescription.Text;
        new bllTrade().InsertUpdate(objTrade);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }
    private void Clear()
    {
        tbxName.Text = "";
        tbxDescription.Text = "";
    }
}