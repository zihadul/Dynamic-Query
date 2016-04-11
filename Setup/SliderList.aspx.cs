using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using System.Data;

public partial class Pages_Setup_SliderList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGv();
        }

    }
    private void LoadGv()
    {
        gv.DataSource = new bllSlider().GetList();
        gv.DataBind();
    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        try
        {
            DataTable dt = new bllSlider().GetById(Convert.ToInt32(e.CommandArgument.ToString()));
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            new bllSlider().Delete(id);
            new bllAudit().Insert("Setup", "Delete Slider", "Image Name: " + dt.Rows[0]["ImageName"].ToString(), User.Identity.Name);
            LoadGv();
           
        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }

    }
}