using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditCourse : System.Web.UI.Page
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
        DataTable dt = new bllCourse().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxCourse.Text = dt.Rows[0]["Course"].ToString();
            tbxCode.Text = dt.Rows[0]["code"].ToString();
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
        bdoCourse objCourse = new bdoCourse();
        objCourse.CourseId = ID;
        objCourse.Course = tbxCourse.Text;
        objCourse.code = tbxCode.Text;
        objCourse.Description = tbxDescription.Text;
        new bllCourse().InsertUpdate(objCourse);
        new bllAudit().Insert("Setup", "InsertUpdate Course", "Course Title: " + tbxCourse.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }

    private void clear()
    {
        tbxCourse.Text="";
        tbxCode.Text = "";
        tbxDescription.Text = "";

    }
}