using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditRelation : System.Web.UI.Page
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
        DataTable dt = new bllRelation().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxRelation.Text = dt.Rows[0]["Relation"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();
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
        bdoRelation objRelation = new bdoRelation();
        objRelation.RelationId = ID;
        objRelation.Relation = tbxRelation.Text;
        objRelation.Description = tbxDescription.Text;
        new bllRelation().InsertUpdate(objRelation);
        new bllAudit().Insert("Setup", "InsertUpdate Relation", "Relation: " + tbxRelation.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }

    private void clear()
    {
        tbxRelation.Text = "";
        tbxDescription.Text = " ";
    }


}