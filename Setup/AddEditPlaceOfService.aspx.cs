using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using System.Data;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditPlaceOfService : System.Web.UI.Page
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
        DataTable dt = new bllPlaceOfService().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxPlaceOfService.Text = dt.Rows[0]["PlaceOfService"].ToString();
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
        bdoPlaceOfService objPlaceOfService = new bdoPlaceOfService();
        objPlaceOfService.PlaceOfServiceId = ID;
        objPlaceOfService.PlaceOfService = tbxPlaceOfService.Text;
        objPlaceOfService.Description = tbxDescription.Text;
        new bllPlaceOfService().InsertUpdate(objPlaceOfService);
        new bllAudit().Insert("Setup", "InsertUpdate Place Of Service", "Place Of Service: " + tbxPlaceOfService.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }

    private void clear()
    {
        tbxPlaceOfService.Text = "";
        tbxDescription.Text = "";
    }
}