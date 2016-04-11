using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BDO;
using System.Data;
using VITL.Web.CDO.BLL;
using System.IO;
using Image = System.Drawing.Image;

public partial class Pages_CdoSetup_CdoInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["ArmyNo"] != null)
            {
                string armyNo = Request.QueryString["ArmyNo"].ToString();
                 namePnl.Visible = true;
                 DataTable dt = new bllBasicInfo().SearchCommandoByStuBaNo(armyNo);
                 tbxRnk.Text = dt.Rows[0]["RankName"].ToString();
                 tbxName.Text = dt.Rows[0]["Name"].ToString();
                 tbxArmsNo.Text = " (" + dt.Rows[0]["ArmyNo"].ToString() + ")";
            }
            else
            {
                Session["ArmyNo"] = null;
                 namePnl.Visible = false;
            }
        }
           MessageController.Clear(Page);   
    }

    //protected void Upload(object sender, EventArgs e)
    //{
    //    if (lblImage.Text != "")
    //    {
    //        Common.DeleteFile(Server.MapPath("~/Resources/UserFile/Main/" + lblImage.Text));
    //        Common.DeleteFile(Server.MapPath("~/Resources/UserFile/Thumbs/" + lblImage.Text));

    //    }
    //    string displayImagePath = "";
    //    String filExtention = Path.GetExtension(FileUpload1.FileName).ToLower();

    //    if ((filExtention != ".gif") && (filExtention != ".jpg") && (filExtention != ".jpeg") &&
    //        (filExtention != ".bmp") && (filExtention != ".png"))
    //    {
    //        MessageController.Show("Select valid image", MessageType.Error, Page);
    //        return;
    //    }
    //    Label1.Text ="Image Name: "+ FileUpload1.FileName;
    //    string strImageName = Guid.NewGuid().ToString().GetHashCode() + "_" +
    //                       Path.GetFileName(FileUpload1.FileName);
    //    displayImagePath = Server.MapPath("~/Resources/UserFile/Main/" + strImageName);
    //    FileUpload1.SaveAs(displayImagePath);
    //    Image1.ImageUrl = "~/Resources/UserFile/Main/" + strImageName;
    //    lblImage.Text = strImageName;
    //}


    protected void tabProductInfo_ActiveTabChanged(object sender, EventArgs e)
    {
        if (TabContainer1.ActiveTabIndex > 0)
        {
            string BaNo = Session["ArmyNo"] as string;
            if (BaNo == null)
            {
                MessageController.Show("First save basic information.", MessageType.Warning, Page);
                TabContainer1.ActiveTabIndex = 0;
                return;
            }

        }
    } 
   
    protected void OnBtnSave_Click(object sender, EventArgs e)
    {
       
        if (CobBacInfo.Save())
        {
            TabContainer1.ActiveTabIndex = 1;
        }
    }
    protected void OnBtnReset_Click(object sender, EventArgs e)
    {
        CobBacInfo.Clear();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            DataTable dt = new bllBasicInfo().SearchCommandoByStuBaNo(BaNo);
            if (dt.Rows.Count > 0)
            {
                TabContainer1.ActiveTabIndex++;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnPre_Click(object sender, EventArgs e)
    {
        TabContainer1.ActiveTabIndex--;
    }
    protected void btnSaveMSN_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (comMsn.SaveMNS())
            {
                TabContainer1.ActiveTabIndex = 2;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnSaveDiscipState_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (dipState.SaveDiscipState())
            {
                TabContainer1.ActiveTabIndex = 3;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnMedicalInfoSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (mdcl.Save())
            {
                TabContainer1.ActiveTabIndex = 4;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnAPRSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (AprInfr.Save())
            {
                TabContainer1.ActiveTabIndex = 5;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnSpecialQualificationSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (SpecialQualification.SaveSpecialQualification())
            {
                TabContainer1.ActiveTabIndex = 6;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnCourseSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (cors.InsertUpdateCourse())
            {
                TabContainer1.ActiveTabIndex = 7;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnCadreSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (cdre.InsertUpdateCadre())
            {
                TabContainer1.ActiveTabIndex = 8;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnCommandoServiceSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (service.InsertUpdateComService())
            {
                TabContainer1.ActiveTabIndex = 9;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnNOKSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (nok1.InsertUpdateNOK())
            {
                TabContainer1.ActiveTabIndex = 10;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnRemarksSave_Click(object sender, EventArgs e)
    {
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            if (rmk.InsertUpdateRemrk())
            {
                TabContainer1.ActiveTabIndex = 0;
                CobBacInfo.Clear();
                Session["ArmyNo"] = null;
            }
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        //TabContainer1.ActiveTabIndex = 0;
        //ClearAllGrid();
        CobBacInfo.Save();
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            comMsn.SaveMNS();
            dipState.SaveDiscipState();
            mdcl.Save();
            AprInfr.Save();
            SpecialQualification.SaveSpecialQualification();
            cors.InsertUpdateCourse();
            cdre.InsertUpdateCadre();
            service.InsertUpdateComService();
            nok1.InsertUpdateNOK();
            rmk.InsertUpdateRemrk();
            MessageController.Show("Saved successfully.", MessageType.Information, Page);
            TabContainer1.ActiveTabIndex = 0;
            CobBacInfo.Clear();
            ClearAllGrid();
            Session["ArmyNo"] = null;
            tbxRnk.Text = "";
            tbxName.Text = "";
           tbxArmsNo.Text = "";
           namePnl.Visible = false;
        }
    }

    protected void btnSaveAll_Click(object sender, EventArgs e)
    {
        
        CobBacInfo.Save();
        string BaNo = Session["ArmyNo"] as string;
        if (BaNo != null)
        {
            comMsn.SaveMNS();
            dipState.SaveDiscipState();
            mdcl.Save();
            AprInfr.Save();
            SpecialQualification.SaveSpecialQualification();
            cors.InsertUpdateCourse();
            cdre.InsertUpdateCadre();
            service.InsertUpdateComService();
            nok1.InsertUpdateNOK();
            rmk.InsertUpdateRemrk();
            MessageController.Show("Saved successfully.", MessageType.Information, Page);
            TabContainer1.ActiveTabIndex = 0;
            CobBacInfo.Clear();
            ClearAllGrid();
            Session["ArmyNo"] = null;
            tbxRnk.Text = "";
            tbxName.Text = "";
            tbxArmsNo.Text = "";
            namePnl.Visible = false;
        }
        else
        {
            MessageController.Show("First save basic information.", MessageType.Warning, Page);
        }
    }

    private void ClearAllGrid()
    {
        comMsn.ClearGrid();
        dipState.ClearGrid();
        mdcl.ClearGrid();
        AprInfr.ClearGrid();
        SpecialQualification.Clear();
        cors.ClearGrid();
        cdre.ClearGrid();
        service.ClearGrid();
        nok1.ClearGrid();
        rmk.ClearGrid();
    }
    //private string GetImage()
    //{
    //    //lblSearchResult.Text = "";
    //    string displayImagePath = "";
    //    if (fileupDisplayImagePath.HasFile)
    //    {
    //        String filExtention = Path.GetExtension(fileupDisplayImagePath.FileName).ToLower();

    //        if ((filExtention != ".gif") && (filExtention != ".jpg") && (filExtention != ".jpeg") &&
    //            (filExtention != ".bmp") && (filExtention != ".png"))
    //        {
    //            MessageController.Show("Select valid image", MessageType.Error, Page);
    //            return displayImagePath;
    //        }

    //        string strImageName = Guid.NewGuid().ToString().GetHashCode() + "_" +
    //                        Path.GetFileName(fileupDisplayImagePath.FileName);
    //        displayImagePath = Server.MapPath("~/Resources/UserFile/Main/" + strImageName);
    //        fileupDisplayImagePath.SaveAs(displayImagePath);
    //        Image image = Common.GetThumsImage(displayImagePath, 120, 120);
    //        displayImagePath = Server.MapPath("~/Resources/UserFile/Thumbs/" + strImageName);
    //        image.Save(displayImagePath);

    //        displayImagePath = strImageName;
    //        if (lblImage.Text != "")
    //        {
    //            Common.DeleteFile(Server.MapPath("~/Resources/UserFile/Main/" + lblImage.Text));
    //            Common.DeleteFile(Server.MapPath("~/Resources/UserFile/Thumbs/" + lblImage.Text));

    //        }
    //    }
    //    else
    //    {
    //        displayImagePath = lblImage.Text;
    //    }
    //    return displayImagePath;
    //}
}