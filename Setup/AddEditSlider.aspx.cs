using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;

public partial class Pages_Setup_AddEditSlider : System.Web.UI.Page
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

                Populate();
            }
            else
            {
                //btnRemoveDisplayImage.Visible = false;
                //btnImg.Visible = false;
            }
        }
    }

    protected void Populate()
    {
        DataTable dt = new bllSlider().GetById(ID);
        if (dt.Rows.Count > 0)
        {
            hdnAttachmentName.Value = dt.Rows[0]["ImageName"].ToString();
            lblImage.Text = dt.Rows[0]["ImageName"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();
           
        }
    }
    public void btnSave_Click(object sender, EventArgs e)
    {
        string displayImagePath = "";
        string strImageName = "";
        if (fileDisplayImage.HasFile)
        {
            string filExtention = "";
            filExtention = fileDisplayImage.FileName.Substring(fileDisplayImage.FileName.Length - 4);
            filExtention = filExtention.ToLower();
            if ((filExtention != ".gif") && (filExtention != ".jpg") && (filExtention != "jpeg") && (filExtention != ".bmp") && (filExtention != ".png"))
            {
                lblMessage.Text = "Please select gif/jpg/bmp/png image";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }
            strImageName = Guid.NewGuid().ToString().GetHashCode().ToString() + "-" + System.IO.Path.GetFileName(fileDisplayImage.FileName);
            displayImagePath = Server.MapPath("~/UserFile/Slider/") + strImageName;
            fileDisplayImage.SaveAs(displayImagePath);
        }


        new bllSlider().InsertUpdate(ID, strImageName, tbxDescription.Text);
        new bllAudit().Insert("Setup", "InsertUpdate Slider", "Image Name: " + strImageName, User.Identity.Name);
            lblMessage.ForeColor = System.Drawing.Color.Green;
            MessageController.Show(MessageCode._SaveSucceeded, MessageType.Information, Page);
            ClearAll();
        
    }


    public void ClearAll()
    {
        lblImage.Text = "";
        tbxDescription.Text = "";
    }
}