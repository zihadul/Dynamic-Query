using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;

public partial class Pages_Setup_AddEditGrade : System.Web.UI.Page
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
        DataTable dt = new bllGrade().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxMarkFrom.Text = dt.Rows[0]["MarkFrom"].ToString();
            tbxMarkTo.Text = dt.Rows[0]["MarkTo"].ToString();
            tbxPointValue.Text = dt.Rows[0]["LatterGrade"].ToString();
            tbxLatterGrade.Text = dt.Rows[0]["GradePointValue"].ToString();
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

        new bllGrade().InsertUpdate(ID, tbxLatterGrade.Text ,Convert.ToDecimal(tbxPointValue.Text),Convert.ToDecimal(tbxMarkFrom.Text),Convert.ToDecimal(tbxMarkTo.Text), tbxDescription.Text);
        new bllAudit().Insert("Setup", "InsertUpdate Grade", "Grade: " + tbxLatterGrade.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }
    private void Clear()
    {
        tbxMarkFrom.Text ="";
        tbxMarkTo.Text = "";
        tbxPointValue.Text = "";
        tbxLatterGrade.Text ="";
        tbxDescription.Text = "";
    }
}