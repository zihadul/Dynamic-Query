using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using VITL.Web.CDO.BLL;
using System.Web.Configuration;

public partial class Pages_Security_GeneralSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
        {
            Response.Redirect("~/Login.aspx", true);
        }

        if (!IsPostBack)
        {
            Literal lit_PageHeader = Page.Master.FindControl("lit_PageHeader") as Literal;
            if (lit_PageHeader != null)
                lit_PageHeader.Text = "General Settings";


            LoadSettings();
        }
    }


    private void LoadSettings()
    {

        tbxMaxFileSize.Text = ConfigurationManager.AppSettings["MaxUploadFileSize"].ToString();
        tbxMaxImageSize.Text = ConfigurationManager.AppSettings["MaxUloadImageSize"].ToString();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
            AppSettingsSection section = (AppSettingsSection)configuration.AppSettings;


            section.Settings["MaxUploadFileSize"].Value = tbxMaxFileSize.Text;

            section.Settings["MaxUloadImageSize"].Value = tbxMaxImageSize.Text;


            configuration.Save();
            MessageController.Show("Saved successfully.", MessageType.Information, Page);
            new bllAudit().Insert("Setup", "GeneralSettings Max File Size Insert", "Page Name:" + "GeneralSettings", User.Identity.Name);

        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }
    }
}