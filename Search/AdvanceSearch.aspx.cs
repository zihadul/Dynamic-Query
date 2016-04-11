using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using System.Data;
using System.Collections;

public partial class Pages_CdoList_AdvanceSearch : System.Web.UI.Page
{
    private string Criteria
    {
        get
        {
            if (ViewState["Criteria"] == null)
                return string.Empty;
            return ViewState["Criteria"].ToString();
        }
        set { ViewState["Criteria"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Year();
            LoadMedicalCategory();
            LoadPrefix();
            LoadRank();
            LoadArms();
            LoadUnit();
            LoadTrade();
            LoadServiceStatus();
            LoadMsn();
            LoadDiscipState();
            LoadOffenceType();
            LoadTypeOfDuty();
            LoadRelation();
            LoadExpertise();
            LoadDisablity();
            LoadPnsmntAwrd();
            LoadCourse();
            LoadCadre();
            LoadTypeofDuty();
            LoadPlaceofService();
        }
    }

    protected void Year()
    {
        for (int i = 2000; i <= 2025; i++)
        {
            if (i == 2000)
                ddlYear.Items.Add("All");
            else
                ddlYear.Items.Add(i.ToString());
        }
        //ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;
    }

    private void LoadMedicalCategory()
    {
        ddlMedicalCategory.Items.Clear();
        ddlMedicalCategory.Items.Add(new ListItem("All", "0"));
        ddlMedicalCategory.DataSource = new bllMedicalCategory().GetList();
        ddlMedicalCategory.DataBind();
    }
    private void LoadPrefix()
    {
        ddlPrefix.Items.Clear();
        ddlPrefix.Items.Add(new ListItem("All", "0"));
        ddlPrefix.DataSource = new bllPrefix().GetList();
        ddlPrefix.DataBind();
    }

    private void LoadRank()
    {
        ddlRank.Items.Clear();
        ddlRank.Items.Add(new ListItem("All", "0"));
        ddlRank.DataSource = new bllRank().GetList();
        ddlRank.DataBind();
    }

    private void LoadArms()
    {
        ddlArms.Items.Clear();
        ddlArms.Items.Add(new ListItem("All", "0"));
        ddlArms.DataSource = new bllArms().GetList();
        ddlArms.DataBind();
    }

    private void LoadUnit()
    {
        ddlUnit.Items.Clear();
        ddlUnit.Items.Add(new ListItem("All", "0"));
        ddlUnit.DataSource = new bllUnit().GetList();
        ddlUnit.DataBind();
    }
    private void LoadTrade()
    {
        ddlTrade.Items.Clear();
        ddlTrade.Items.Add(new ListItem("All", "0"));
        ddlTrade.DataSource = new bllTrade().GetList();
        ddlTrade.DataBind();
    }

    private void LoadServiceStatus()
    {
        //ddlServiceStatus.Items.Clear();
        //ddlServiceStatus.Items.Add(new ListItem("Select", "0"));
        //ddlServiceStatus.DataSource = new bllServiceStatus().GetList();
        //ddlServiceStatus.DataBind();
    }
    private void LoadMsn()
    {
        ddlMsn.Items.Clear();
        ddlMsn.Items.Add(new ListItem("All", "0"));
        ddlMsn.DataSource = new bllMSN().GetList();
        ddlMsn.DataBind();
    }
    private void LoadDiscipState()
    {
        ddlDiscipState.Items.Clear();
        ddlDiscipState.Items.Add(new ListItem("All", "0"));
        ddlDiscipState.DataSource = new bllDiscipState().GetList();
        ddlDiscipState.DataBind();
    }

    private void LoadOffenceType()
    {
        ddlOffenceType.Items.Clear();
        ddlOffenceType.Items.Add(new ListItem("All", "0"));
        ddlOffenceType.DataSource = new bllOffence().GetList();
        ddlOffenceType.DataBind();
    }

    private void LoadTypeOfDuty()
    {
        //ddlTypeOfDuty.Items.Clear();
        //ddlTypeOfDuty.Items.Add(new ListItem("All", "0"));
        //ddlTypeOfDuty.DataSource = new bllTypeOfDuty().GetList();
        //ddlTypeOfDuty.DataBind();
    }
    private void LoadRelation()
    {
        ddlRelation.Items.Clear();
        ddlRelation.Items.Add(new ListItem("All", "0"));
        ddlRelation.DataSource = new bllRelation().GetList();
        ddlRelation.DataBind();
    }


    private void LoadPnsmntAwrd()
    {
        ddlPnsmntAwrd.Items.Clear();
        ddlPnsmntAwrd.Items.Add(new ListItem("All", "0"));
        ddlPnsmntAwrd.DataSource = new bllPanishmentAwarded().GetList();
        ddlPnsmntAwrd.DataBind();
    }

    private void LoadCourse()
    {
        ddlCourse.Items.Clear();
        ddlCourse.Items.Add(new ListItem("All", "0"));
        ddlCourse.DataSource = new bllCourse().GetList();
        ddlCourse.DataBind();
    }

    private void LoadCadre()
    {
        ddlCadre.Items.Clear();
        ddlCadre.Items.Add(new ListItem("All", "0"));
        ddlCadre.DataSource = new bllCadre().GetList();
        ddlCadre.DataBind();
    }

    private void LoadPlaceofService()
    {
        ddlPlaceofService.Items.Clear();
        ddlPlaceofService.Items.Add(new ListItem("All", "0"));
        ddlPlaceofService.DataSource = new bllPlaceOfService().GetList();
        ddlPlaceofService.DataBind();
    }

    private void LoadTypeofDuty()
    {
        //ddlTypeOfDuty.Items.Clear();
        //ddlTypeOfDuty.Items.Add(new ListItem("All", "0"));
        //ddlTypeOfDuty.DataSource = new bllTypeOfDuty().GetList();
        //ddlTypeOfDuty.DataBind();
    }



    private void LoadExpertise()
    {
        DataTable dt = new bllSpecialQuality().GetList();
        foreach (DataRow dr in dt.Rows)
        {
            ListItem item = new ListItem();
            item.Text = dr["SpecialQualityName"].ToString();
            item.Value = dr["SpecialQualityId"].ToString();
            //item.Selected = Convert.ToBoolean(sdr["IsSelected"]);
            chkExpertise.Items.Add(item);
        }
    }


    private void LoadDisablity()
    {
        DataTable dt = new bllDisablity().GetList();
        foreach (DataRow dr in dt.Rows)
        {
            ListItem item = new ListItem();
            item.Text = dr["Diablity"].ToString();
            item.Value = dr["DisablityId"].ToString();
            //item.Selected = Convert.ToBoolean(sdr["IsSelected"]);
            cbxDisability.Items.Add(item);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //LoadCriteria(); 
        Session["AdvanceSearchCriteria"] = SearchCriteria();
        //LoadData();
        // Session["AdvanceSearch"] = Criteria;
        Response.Redirect("~/Pages/Search/AdvanceSearchResultList.aspx");
    }

    private string SearchCriteria()
    {
        Criteria = "";

        if (ddlPrefix.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "PrefixID=" + ddlPrefix.SelectedValue.ToString();
            else Criteria += "PrefixID=" + ddlPrefix.SelectedValue.ToString();
        }

        if (ddlRank.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "RankId=" + ddlRank.SelectedValue.ToString();
            else Criteria += " And RankId=" + ddlRank.SelectedValue.ToString();
        }
        if (tbxArmyNo.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
            else Criteria += " And ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
        }
        if (tbxName.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "Name like '%" + tbxName.Text.Trim() + "%'";
            else Criteria += " And Name like '%" + tbxName.Text.Trim() + "%'";
        }
        if (ddlUnit.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "UnitId=" + ddlUnit.SelectedValue.ToString();
            else Criteria += " And UnitId=" + ddlUnit.SelectedValue.ToString();
        }
        if (ddlArms.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "ArmsId=" + ddlArms.SelectedValue.ToString();
            else Criteria += " And ArmsId=" + ddlArms.SelectedValue.ToString();
        }

        if (ddlTrade.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "TradeId=" + ddlTrade.SelectedValue.ToString();
            else Criteria += " And TradeId=" + ddlTrade.SelectedValue.ToString();
        }
        if (tbxMobile.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "Contact like '%" + tbxMobile.Text.Trim() + "%'";
            else Criteria += " And Contact like '%" + tbxMobile.Text.Trim() + "%'";
        }
        if (tbxTBLAccount.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "TBLSalaryAccount like '%" + tbxTBLAccount.Text.Trim() + "%'";
            else Criteria += " And TBLSalaryAccount like '%" + tbxTBLAccount.Text.Trim() + "%'";
        }

        //if (ddlServiceStatus.SelectedValue != "0")
        //{
        //    if (Criteria == "") Criteria = "ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
        //    else Criteria += " And ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
        //}

        //New added..........

        if (ddlMsn.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "MSNId=" + ddlMsn.SelectedValue.ToString();
            else Criteria += " And MSNId=" + ddlMsn.SelectedValue.ToString();
        }
      
        if (Common.IsDate(tbxMsnFromDate.Text))
        {
            if (Criteria == "") Criteria = "MSNFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxMsnFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MSNFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxMsnFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxMsnToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxMsnToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "MSNToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MSNToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        //if (tbxMsnStartDateFrom.Text.Trim() != "" && tbxMsnStartDateTo.Text.Trim() != "")
        //{
        //    if (Criteria == "") Criteria = "MSNFromDate BETWEEN " + Convert.ToDateTime(tbxMsnStartDateFrom.Text).ToString("yyyy-MM-dd") + " AND " + Convert.ToDateTime(tbxMsnStartDateTo.Text).ToString("yyyy-MM-dd");
        //    else Criteria += " And MSNFromDate BETWEEN " + Convert.ToDateTime(tbxMsnStartDateFrom.Text).ToString("yyyy-MM-dd") + " AND " + Convert.ToDateTime(tbxMsnStartDateTo.Text).ToString("yyyy-MM-dd");
        //}


        if (tbxChargeSection.Text.Trim() != "" && tbxChargeSection.Text.Trim() != ",")
        {
            if (Criteria == "") Criteria = "ChargeSection like '%" + tbxChargeSection.Text.Trim() + "%'";
            else Criteria += " And ChargeSection like '%" + tbxChargeSection.Text.Trim() + "%'";
        }

        if (ddlDiscipState.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "DescipStateId=" + ddlDiscipState.SelectedValue.ToString();
            else Criteria += " And DescipStateId=" + ddlDiscipState.SelectedValue.ToString();
        }

        if (ddlOffenceType.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "OffenceTypeId=" + ddlOffenceType.SelectedValue.ToString();
            else Criteria += " And OffenceTypeId=" + ddlOffenceType.SelectedValue.ToString();
        }

        if (ddlPnsmntAwrd.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "PunishmentAwardedId=" + ddlPnsmntAwrd.SelectedValue.ToString();
            else Criteria += " And PunishmentAwardedId=" + ddlPnsmntAwrd.SelectedValue.ToString();
        }


        if (ddlMedicalCategory.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "MedicalCategoryId=" + ddlMedicalCategory.SelectedValue.ToString();
            else Criteria += " And MedicalCategoryId=" + ddlMedicalCategory.SelectedValue.ToString();
        }

        string DisablityId = "";
        foreach (ListItem li in cbxDisability.Items)
        {
            if (li.Selected)
            {
                if (DisablityId == "")
                {
                    DisablityId = "DisablityId IN (" + li.Value + ")";
                }
                else
                {
                    DisablityId = DisablityId.Substring(0, DisablityId.Length - 1);
                    DisablityId += ", " + li.Value + ")";
                    // DisablityId += " OR DisablityId=" + li.Value;
                }
            }
        }

        if (DisablityId != "")
        {
            if (Criteria == "") Criteria = DisablityId;
            else Criteria += " And " + DisablityId;
        }

        if (Common.IsDate(tbxMCFromDate.Text))
        {
            if (Criteria == "") Criteria = "MIFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxMCFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MIFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxMCFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxMCToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxMCToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "MIToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MIToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        //if (tbxMarking.Text.Trim() != "")
        //{
        //    if (Criteria == "") Criteria = "APRMarks like '%" + tbxMarking.Text.Trim() + "%'";
        //    else Criteria += " And APRMarks like '%" + tbxMarking.Text.Trim() + "%'";
        //}


        if (tbxAPRMarksFrom.Text != "" && tbxAPRMarksFrom.Text != ",")
        {
            if (Criteria == "") Criteria = "APRMarks BETWEEN " + tbxAPRMarksFrom.Text.Trim() + " AND " + tbxAPRMarksTo.Text.Trim();
            else Criteria += " And APRMarks BETWEEN " + tbxAPRMarksFrom.Text.Trim() + " AND " + tbxAPRMarksTo.Text.Trim();
        }

        if (ddlYear.SelectedItem.Text != "All")
        {
            if (Criteria == "") Criteria = "Year=" + ddlYear.SelectedItem.Text;
            else Criteria += " And Year=" + ddlYear.SelectedItem.Text;
        }

        string SpecialQualityId = "";
        foreach (ListItem li in chkExpertise.Items)
        {
            if (li.Selected)
            {
                if (SpecialQualityId == "")
                {
                    SpecialQualityId = "SpecialQualityId IN (" + li.Value + ")";
                }
                else
                {
                    SpecialQualityId = SpecialQualityId.Substring(0, SpecialQualityId.Length - 1);
                    SpecialQualityId += ", " + li.Value + ")";
                }
            }
        }

        if (SpecialQualityId != "")
        {
            if (Criteria == "") Criteria = SpecialQualityId;
            else Criteria += " And " + SpecialQualityId;
        }

        if (ddlCourse.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "CourseId=" + ddlCourse.SelectedValue.ToString();
            else Criteria += " And CourseId=" + ddlCourse.SelectedValue.ToString();
        }
        if (Common.IsDate(tbxCourseFromDate.Text))
        {
            if (Criteria == "") Criteria = "CourseFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxCourseFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And CourseFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxCourseFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxCourseToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxCourseToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "CourseToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And CourseToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        if (ddlCadre.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "CadreId=" + ddlCadre.SelectedValue.ToString();
            else Criteria += " And CadreId=" + ddlCadre.SelectedValue.ToString();
        }
        if (Common.IsDate(tbxCadreFromDate.Text))
        {
            if (Criteria == "") Criteria = "CadreFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxCadreFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And CadreFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxCadreFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxCadreToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxCadreToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "CadreToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And CadreToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        if (ddlPlaceofService.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "PlaceOfServiceId=" + ddlPlaceofService.SelectedValue.ToString();
            else Criteria += " And PlaceOfServiceId=" + ddlPlaceofService.SelectedValue.ToString();
        }
        if (Common.IsDate(tbxPSFromDate.Text))
        {
            if (Criteria == "") Criteria = "SrvFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxPSFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And SrvFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxPSFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxPSToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxPSToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "SrvToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And SrvToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        //if (ddlTypeOfDuty.SelectedValue != "0")
        //{
        //    if (Criteria == "") Criteria = "TypeOfDutyId=" + ddlTypeOfDuty.SelectedValue.ToString();
        //    else Criteria += " And TypeOfDutyId=" + ddlTypeOfDuty.SelectedValue.ToString();
        //}

        if (tbxNOKName.Text.Trim() != "" && tbxNOKName.Text.Trim() != ",")
        {
            if (Criteria == "") Criteria = "NOKName like '%" + tbxNOKName.Text.Trim() + "%'";
            else Criteria += " And NOKName like '%" + tbxNOKName.Text.Trim() + "%'";
        }

        if (ddlRelation.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "NOKRelationId=" + ddlRelation.SelectedValue.ToString();
            else Criteria += " And NOKRelationId=" + ddlRelation.SelectedValue.ToString();
        }

        if (tbxNOKContact.Text.Trim() != "" && tbxNOKContact.Text.Trim() != ",")
        {
            if (Criteria == "") Criteria = "NOKContact like '%" + tbxNOKContact.Text.Trim() + "%'";
            else Criteria += " And NOKContact like '%" + tbxNOKContact.Text.Trim() + "%'";
        }

        return Criteria;
    }



    //private void LoadData()
    //{
    //    string Criteria = "";
    //    Criteria = SearchCriteria();

    //    DataTable dtAdvanceSearch = new bllBasicInfo().GetByAdvanceSearchParameter(0, 50, Criteria, false);

    //    Hashtable hTable = new Hashtable();
    //    ArrayList duplicateList = new ArrayList();

    //    foreach (DataRow drow in dtAdvanceSearch.Rows)
    //    {
    //        if (hTable.Contains(drow["ArmyNo"]))
    //            duplicateList.Add(drow);
    //        else
    //            hTable.Add(drow["ArmyNo"], string.Empty);
    //    }
    //    foreach (DataRow dRow in duplicateList)
    //        dtAdvanceSearch.Rows.Remove(dRow);
    //    dtAdvanceSearch.AcceptChanges();

    //    Session["AdvanceSearch"] = dtAdvanceSearch;
    //}


    private void LoadCriteria()
    {
        int PrefixID = 0;
        int RankId = 0;
        string ArmyNo = string.Empty;
        string Name = string.Empty;
        int UnitId = 0;
        int ArmsId = 0;
        int TradeId = 0;
        string Contact = string.Empty;
        string TBLSalaryAccount = string.Empty;
        int ServiceStatusId = 0;

        int MSNId = 0;
        DateTime MsnFromDate = DateTime.MinValue;
        DateTime MsnToDate = DateTime.MinValue;

        string ChargeSection = string.Empty;
        int DescipStateId = 0;
        int OffenceTypeId = 0;
        int PunishmentAwardedId = 0;

        int MedicalCategoryId = 0;

        string TypeofDisability = "";
        string TypeofDisabilityText = "";
        string APRYear = "";
        string Marks = "";
        string SpecialQuality = "";
        string SpecialQualityText = "";


        if (ddlPrefix.SelectedValue != "0")
        {
            PrefixID = Convert.ToInt32(ddlPrefix.SelectedValue);
            if (Criteria == "") Criteria = "PrefixID=" + ddlPrefix.SelectedValue.ToString();
            else Criteria += "PrefixID=" + ddlPrefix.SelectedValue.ToString();
        }

        if (ddlRank.SelectedValue != "0")
        {
            RankId = Convert.ToInt32(ddlRank.SelectedValue);
            if (Criteria == "") Criteria = "RankId=" + ddlRank.SelectedValue.ToString();
            else Criteria += " And RankId=" + ddlRank.SelectedValue.ToString();
        }
        if (tbxArmyNo.Text.Trim() != "")
        {
            ArmyNo = tbxArmyNo.Text.Trim();
            if (Criteria == "") Criteria = "ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
            else Criteria += " And ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
        }
        if (tbxName.Text.Trim() != "")
        {
            Name = tbxName.Text.Trim();
            if (Criteria == "") Criteria = "Name like '%" + tbxName.Text.Trim() + "%'";
            else Criteria += " And Name like '%" + tbxName.Text.Trim() + "%'";
        }
        if (ddlUnit.SelectedValue != "0")
        {
            UnitId = Convert.ToInt32(ddlUnit.SelectedValue);
            if (Criteria == "") Criteria = "UnitId=" + ddlUnit.SelectedValue.ToString();
            else Criteria += " And UnitId=" + ddlUnit.SelectedValue.ToString();
        }
        if (ddlArms.SelectedValue != "0")
        {
            ArmsId = Convert.ToInt32(ddlArms.SelectedValue);
            if (Criteria == "") Criteria = "ArmsId=" + ddlArms.SelectedValue.ToString();
            else Criteria += " And ArmsId=" + ddlArms.SelectedValue.ToString();
        }

        if (ddlTrade.SelectedValue != "0")
        {
            TradeId = Convert.ToInt32(ddlTrade.SelectedValue);
            if (Criteria == "") Criteria = "TradeId=" + ddlTrade.SelectedValue.ToString();
            else Criteria += " And TradeId=" + ddlTrade.SelectedValue.ToString();
        }
        if (tbxMobile.Text.Trim() != "")
        {
            Contact = tbxMobile.Text.Trim();
            if (Criteria == "") Criteria = "Contact like '%" + tbxMobile.Text.Trim() + "%'";
            else Criteria += " And Contact like '%" + tbxMobile.Text.Trim() + "%'";
        }
        if (tbxTBLAccount.Text.Trim() != "")
        {
            TBLSalaryAccount = tbxTBLAccount.Text.Trim();
            if (Criteria == "") Criteria = "TBLSalaryAccount like '%" + tbxTBLAccount.Text.Trim() + "%'";
            else Criteria += " And TBLSalaryAccount like '%" + tbxTBLAccount.Text.Trim() + "%'";
        }

        //if (ddlServiceStatus.SelectedValue != "0")
        //{
        //    ServiceStatusId = Convert.ToInt32(ddlServiceStatus.SelectedValue);

        //    if (Criteria == "") Criteria = "ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
        //    else Criteria += " And ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
        //}

        //New added..........

        if (ddlMsn.SelectedValue != "0")
        {
            MSNId = Convert.ToInt32(ddlMsn.SelectedValue);
            if (Criteria == "") Criteria = "MSNId=" + ddlMsn.SelectedValue.ToString();
            else Criteria += " And MSNId=" + ddlMsn.SelectedValue.ToString();
        }
        if (Common.IsDate(tbxMsnFromDate.Text))
        {
            if (Criteria == "") Criteria = "MSNFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxMsnFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MSNFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxMsnFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }

        if (Common.IsDate(tbxMsnToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxMsnToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "MSNToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MSNToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }
        //if (tbxMsnFromDate.Text.Trim() != "" && tbxMsnToDate.Text.Trim() != "")
        //{
        //    MsnFromDate = Convert.ToDateTime(tbxMsnFromDate.Text);
        //    MsnToDate = Convert.ToDateTime(tbxMsnToDate.Text);
        //    // Criteria += " FromDate date between: " + tbxMsnFromDate.Text + " And " + tbxMsnToDate.Text + ", "; 
        //}

        if (tbxChargeSection.Text.Trim() != "" && tbxChargeSection.Text.Trim() != ",")
        {
            ChargeSection = tbxChargeSection.Text.Trim();
            if (Criteria == "") Criteria = "ChargeSection like '%" + tbxChargeSection.Text.Trim() + "%'";
            else Criteria += " And ChargeSection like '%" + tbxChargeSection.Text.Trim() + "%'";
        }

        if (ddlDiscipState.SelectedValue != "0")
        {
            DescipStateId = Convert.ToInt32(ddlDiscipState.SelectedValue);
            if (Criteria == "") Criteria = "DescipStateId=" + ddlDiscipState.SelectedValue.ToString();
            else Criteria += " And DescipStateId=" + ddlDiscipState.SelectedValue.ToString();
        }

        if (ddlOffenceType.SelectedValue != "0")
        {
            OffenceTypeId = Convert.ToInt32(ddlOffenceType.SelectedValue);
            if (Criteria == "") Criteria = "OffenceTypeId=" + ddlOffenceType.SelectedValue.ToString();
            else Criteria += " And OffenceTypeId=" + ddlOffenceType.SelectedValue.ToString();
        }

        if (ddlPnsmntAwrd.SelectedValue != "0")
        {
            PunishmentAwardedId = Convert.ToInt32(ddlPnsmntAwrd.SelectedValue);
            if (Criteria == "") Criteria = "PunishmentAwardedId=" + ddlPnsmntAwrd.SelectedValue.ToString();
            else Criteria += " And PunishmentAwardedId=" + ddlPnsmntAwrd.SelectedValue.ToString();
        }


        if (ddlMedicalCategory.SelectedValue != "0")
        {
            MedicalCategoryId = Convert.ToInt32(ddlMedicalCategory.SelectedValue);
            if (Criteria == "") Criteria = "MedicalCategoryId=" + ddlMedicalCategory.SelectedValue.ToString();
            else Criteria += " And MedicalCategoryId=" + ddlMedicalCategory.SelectedValue.ToString();
        }

        foreach (ListItem li in cbxDisability.Items)
        {
            if (li.Selected)
            {
                TypeofDisability += li.Value + ",";
                TypeofDisabilityText += li.Text + ",";
            }
        }

        if (TypeofDisability != "")
        {
            TypeofDisability = TypeofDisability.Substring(0, TypeofDisability.Length - 1);
            TypeofDisabilityText = TypeofDisabilityText.Substring(0, TypeofDisabilityText.Length - 1);
            Criteria += " TypeofDisability: " + TypeofDisabilityText + ", ";
        }

        if (Common.IsDate(tbxMCFromDate.Text))
        {
            if (Criteria == "") Criteria = "MIFromDate >=  convert(datetime, '" + Convert.ToDateTime(tbxMCFromDate.Text).ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MIFromDate >= convert(datetime, '" + Convert.ToDateTime(tbxMCFromDate.Text).ToString("yyyy-MM-dd") + "')";
        }
        if (Common.IsDate(tbxMCToDate.Text))
        {
            DateTime dtTo = Convert.ToDateTime(tbxMCToDate.Text);
            dtTo = dtTo.AddDays(1);
            if (Criteria == "") Criteria = "MIToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
            else Criteria = Criteria + " And MIToDate <convert(datetime,'" + dtTo.ToString("yyyy-MM-dd") + "')";
        }

        if (ddlYear.SelectedItem.Text != "")
        {
            APRYear = ddlYear.SelectedItem.Text;
            if (Criteria == "") Criteria = "Year=" + ddlYear.SelectedItem.Text;
            else Criteria += " And Year=" + ddlYear.SelectedItem.Text;
        }

        //if (tbxMarking.Text.Trim() != "")
        //{
        //    Marks = tbxMarking.Text.Trim();
        //    if (Criteria == "") Criteria = "Marks like '%" + tbxMarking.Text.Trim() + "%'";
        //    else Criteria += " And Marks like '%" + tbxMarking.Text.Trim() + "%'";
        //}

        foreach (ListItem li2 in chkExpertise.Items)
        {
            if (li2.Selected)
            {
                SpecialQuality += li2.Value + ",";
                SpecialQualityText += li2.Text + ",";
            }
        }

        if (SpecialQuality != "")
        {
            SpecialQuality = SpecialQuality.Substring(0, SpecialQuality.Length - 1);
            SpecialQualityText = SpecialQualityText.Substring(0, SpecialQualityText.Length - 1);
            Criteria += " SpecialQuality: " + SpecialQualityText + ", ";
        }
    }
}