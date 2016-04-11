using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;


public partial class Pages_CdoList_CommandoView : BasePage
{

    string ArmyNo
    {
        set { ViewState["ArmyNo"] = value; }
        get
        {
            try
            {
                return ViewState["ArmyNo"].ToString();
            }
            catch
            {
                return string.Empty;
            }
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ArmyNo"] != null)
        {
            ArmyNo = Request.QueryString["ArmyNo"].ToString();
            //Populate(armyNo);
            BindData();
        }
        else
        {
            Response.Redirect("~/Pages/CdoList/CommandoList.aspx", true);
        }
        if (Request.QueryString["printmode"] != null)
        {
            if (Request.QueryString["printmode"] == "y")
            {
                printModeNamePln.Visible = true;
            }
        }
        
    }

    private void BindData()
    {
        DataTable dt = new bllBasicInfo().SearchCommandoByStuBaNo(ArmyNo);
        lbPrefix.Text = dt.Rows[0]["PrefixName"].ToString();
        if (lbPrefix.Text == "")
        {
            lbPrefix.Text = "N/A";
        }
        lbName.Text = dt.Rows[0]["Name"].ToString();
        if (lbName.Text == "")
        {
            lbName.Text = "N/A";
        }
        lbRank.Text = dt.Rows[0]["RankName"].ToString();
        if (lbRank.Text == "")
        {
            lbRank.Text = "N/A";
        }
        lblRankAndName.Text = lbRank.Text + " " + lbName.Text;
        lbService.Text = dt.Rows[0]["ServiceStatus"].ToString();
        if (lbService.Text == "")
        {
            lbService.Text = "N/A";
        }
        lbTrade.Text = dt.Rows[0]["TradeName"].ToString();
        if (lbTrade.Text == "")
        {
            lbTrade.Text = "N/A";
        }
        lbArms.Text = dt.Rows[0]["ArmsName"].ToString();
        if (lbArms.Text == "")
        {
            lbArms.Text = "N/A";
        }
        lbArmyNo.Text = dt.Rows[0]["ArmyNo"].ToString();
        if (lbArmyNo.Text == "")
        {
            lbArmyNo.Text = "N/A";
        }
        lbContact.Text = dt.Rows[0]["Contact"].ToString();
        if (lbContact.Text == "")
        {
            lbContact.Text = "N/A";
        }
        lbUnit.Text = dt.Rows[0]["UnitName"].ToString();
        if (lbUnit.Text == "")
        {
            lbUnit.Text = "N/A";
        }
        lbAccount.Text = dt.Rows[0]["TBLSalaryAccount"].ToString();
        if (lbAccount.Text == "")
        {
            lbAccount.Text = "N/A";
        }
        if (dt.Rows[0]["IsApproved"].ToString() == "False")
        {
            lbStatus.Text = "Unapproved";
        }
        else
        {
            lbStatus.Text = "Approved";
        }
        if (dt.Rows[0]["Image"].ToString() != "")
        {
            Img.ImageUrl = "~/UserFile/Photos/" + dt.Rows[0]["Image"].ToString();
        }
        else
        {
            Img.ImageUrl = "~/App_Themes/Olive/images/NoImage.gif";
        }
        DataTable dtMsn = new bllMSNInfo().GetMSNInfoByArmyNo(ArmyNo);
        if (dtMsn.Rows.Count > 0)
        {
            gvMSN.DataSource = dtMsn;
            gvMSN.DataBind();
        }
        else
        {
            fsMsn.Visible = false;
        }
        DataTable dtDisState = new bllDiscipStateInfo().GetDiscipStateInfoByArmyNo(ArmyNo);
        if (dtDisState.Rows.Count > 0)
        {
            gvDiscState.DataSource = dtDisState;
            gvDiscState.DataBind();
        }
        else
        {
            fsDiscState.Visible = false;
        }

        DataTable dtMedical = new bllMedicalInfo().GetMedicalInfoByArmyNo(ArmyNo);
        if (dtMedical.Rows.Count > 0)
        {
        gvMedical.DataSource = dtMedical;
        gvMedical.DataBind();
        }
        else
        {
            fsMedical.Visible = false;
        }

        DataTable dtApr = new bllAPRInfo().GetAPRInfoByArmNo(ArmyNo);
        if (dtApr.Rows.Count > 0)
        {
        gvApr.DataSource = dtApr;
        gvApr.DataBind();
        }
        else
        {
            fsApr.Visible = false;
        }

        DataTable dtSpQual = new bllSpecialQualityInfo().GetSpecialQualityInfoByArmyNo(ArmyNo);
        if (dtSpQual.Rows.Count > 0)
        {
        gvSq.DataSource = dtSpQual;
        gvSq.DataBind();
        }
        else
        {
            fsSq.Visible = false;
        }

        DataTable dtCourse = new bllCourseInfo().GetCourseInfoByArmyNo(ArmyNo);
        if (dtCourse.Rows.Count > 0)
        {
        gvCourse.DataSource = dtCourse;
        gvCourse.DataBind();
        }
        else
        {
            fsCourse.Visible = false;
        }

        DataTable dtCadre = new bllCadreInfo().GetCadreInfoByArmyNo(ArmyNo);
        if (dtCadre.Rows.Count > 0)
        {
        gvCadre.DataSource = dtCadre;
        gvCadre.DataBind();
        }
        else
        {
            fsCadre.Visible = false;
        }

        DataTable dtCmdService = new bllCommandoServiceInfo().GetCommandoServiceInfoByArmyNo(ArmyNo);
        if (dtCmdService.Rows.Count > 0)
        {
        gvCmdService.DataSource = dtCmdService;
        gvCmdService.DataBind();
        }
        else
        {
            fsCmdService.Visible = false;
        }

        DataTable dtNok = new bllNOKInfo().GetNOKInfoByArmyNo(ArmyNo);
        if (dtNok.Rows.Count > 0)
        {
        gvNok.DataSource = dtNok;
        gvNok.DataBind();
        }
        else
        {
            fsNok.Visible = false;
        }
    }
}