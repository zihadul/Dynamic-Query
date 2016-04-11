using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.DAL;
using System.Text;
using VITL.Web.CDO.BLL;
using System.Web.Security;

public partial class Pages_CdoList_CommandoList : BasePage
{

    #region variables
    private const int pageDispCount = 10;
    private const int PageSize = 25;

    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
                return 0;
            return Convert.ToInt32(ViewState["CurrentPage"].ToString());
        }
        set { ViewState["CurrentPage"] = value; }
    }

    private int TotalRec
    {
        get
        {
            if (ViewState["TotalRec"] == null)
                return 0;
            return Convert.ToInt32(ViewState["TotalRec"].ToString());
        }
        set { ViewState["TotalRec"] = value; }
    }
    private int UnitId
    {
        get
        {
            if (ViewState["UnitId"] == null)
                return 0;
            return Convert.ToInt32(ViewState["UnitId"].ToString()); //
        }
        set { ViewState["UnitId"] = value; }
    }
    //private int PageSize
    //{
    //    get
    //    {
    //        if (ViewState["PageSize"] == null)
    //            return 0;
    //        return Convert.ToInt32(ViewState["PageSize"].ToString()); //
    //    }
    //    set { ViewState["PageSize"] = value; }
    //}


    private bool PrintMode
    {
        get
        {
            if (ViewState["PrintMode"] == null)
                return false;
            else
                return Convert.ToBoolean(ViewState["PrintMode"].ToString());
        }
        set { ViewState["PrintMode"] = value; }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPrefix();
            LoadRank();
            LoadUnit();
            LoadArms();
            LoadTrade();
            LoadServiceStatus();

            if (User.IsInRole("operator")||User.IsInRole("admin"))
            {
                pnlApproval.Visible = false;
                gv.Columns[0].Visible = false;
               
            }
            BindData();
        }
        if (Request.QueryString["printmode"] != null)
        {
            if (Request.QueryString["printmode"] == "y")
            {
                lblSearchResult.Visible = false;
                litPagingSummary.Visible = false;
                pnlFilter.Visible = false;
                pnlApproval.Visible = false;
                gv.Columns[14].Visible = false;
                gv.Columns[0].Visible = false;
                PrintMode = true;
                BindData();
            }
        }
        managePaging();
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
    private void LoadUnit()
    {
        ddlUnit.Items.Clear();
        ddlUnit.Items.Add(new ListItem("All", "0"));
        ddlUnit.DataSource = new bllUnit().GetList();
        ddlUnit.DataBind();
    }
    private void LoadArms()
    {
        ddlArms.Items.Clear();
        ddlArms.Items.Add(new ListItem("All", "0"));
        ddlArms.DataSource = new bllArms().GetList();
        ddlArms.DataBind();
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
        ddlServiceStatus.Items.Clear();
        ddlServiceStatus.Items.Add(new ListItem("All", "0"));
        ddlServiceStatus.DataSource = new bllServiceStatus().GetList();
        ddlServiceStatus.DataBind();
    }



    private void BindData()
    {
        plcPaging.Controls.Clear();
        lblSearchResult.Text = "";
        DataTable dt = new DataTable();

        string Criteria = "";
        if (Request.QueryString["printmode"] != null)
        {
            Criteria = Session["Criteria"].ToString();

        }
        else
        {
            Criteria = GetCriteria();
            Session["Criteria"] = Criteria;
        }
        if (!User.IsInRole("SuperAdmin"))
        {
        DataTable CommonDt = new bllCommon().GetSystemUserByUserName(User.Identity.Name);
      
        if (CommonDt.Rows.Count > 0)
        {
            string userId = CommonDt.Rows[0]["UserId"].ToString();
           string unit =CommonDt.Rows[0]["CdoUnitId"].ToString();
           UnitId = Convert.ToInt32(unit);
        }
        
            dt = new bllBasicInfo().GetBySearchParameter(CurrentPage * PageSize, PageSize, Criteria, PrintMode, UnitId);
        }
        else
        {
            dt = new bllBasicInfo().GetBySearchParameterForSuperAdmin(CurrentPage * PageSize, PageSize, Criteria, PrintMode);
        }

        gv.DataSource = dt;
        gv.DataBind();

        if (dt.Rows.Count > 0)
        {
            TotalRec = Convert.ToInt32(dt.Rows[0]["TotalRecords"].ToString());
        }
        else
        {
            lblSearchResult.Text = "No record found.";
            litPagingSummary.Text = "";
            TotalRec = 0;
        }

        if (TotalRec <= 500)
        {

            plcPaging.Visible = false;
        }
        else
        {
            plcPaging.Visible = true;
        }
    }


    private string GetCriteria()
    {
        string Criteria = "";


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
        if (tbxName.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "Name like '%" + tbxName.Text.Trim() + "%'";
            else Criteria += " And Name like '%" + tbxName.Text.Trim() + "%'";
        }
        if (tbxArmyNo.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
            else Criteria += " And ArmyNo like '%" + tbxArmyNo.Text.Trim() + "%'";
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

        if (ddlServiceStatus.SelectedValue != "0")
        {
            if (Criteria == "") Criteria = "ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
            else Criteria += " And ServiceStatusId=" + ddlServiceStatus.SelectedValue.ToString();
        }

        //if (Criteria == "") Criteria = "Approved='True'";
        //else Criteria += " And Approved='True'";
        return Criteria;
    }
    protected void gv_RowsDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        DataRowView drview = e.Row.DataItem as DataRowView;
        LinkButton deleteLinkBtn = (LinkButton)e.Row.FindControl("btnDelete");
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (User.IsInRole("operator"))
            {
                deleteLinkBtn.Visible = false; 

            }
            

        }
       
    }


    protected void btnFilter_Click(object sender, EventArgs e)
    {
        plcPaging.Controls.Clear();
        CurrentPage = 0;
        BindData();
        managePaging();
    }

    protected void btnDelete_OnCommand(object sender, CommandEventArgs e)
    {
        try
        {
            string id = e.CommandArgument.ToString();
            int del = new bllBasicInfo().Delete(id);
            MessageController.Show("Delete Sucessfully.", MessageType.Information, Page);
            BindData();
            managePaging();
        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        BindData();
    }

    #region ManagePaging

    protected void managePaging()
    {
        if (TotalRec > 0)
        {
            // Variable declaration
            int numberOfPages;
            int numberOfRecords = TotalRec;
            int currentPage = CurrentPage;
            StringBuilder strSummary = new StringBuilder();
            // If number of records is more then the page size (specified in global variable)
            // Just to check either gridview have enough records to implement paging
            if (numberOfRecords > PageSize)
            {
                // Calculating the total number of pages
                numberOfPages = (int)Math.Ceiling((double)numberOfRecords / (double)PageSize);
            }
            else
            {
                numberOfPages = 1;
            }
            // Creating a small summary for records.
            strSummary.Append("Displaying <b>");
            // Creating X f X Records
            int floor = (currentPage * PageSize) + 1;
            strSummary.Append(floor.ToString());
            strSummary.Append("</b>-<b>");
            int ceil = ((currentPage * PageSize) + PageSize);
            //let say you have 26 records and you specified 10 page size, 
            // On the third page it will return 30 instead of 25 as that is based on PageSize
            // So this check will see if the ceil value is increasing the number of records. Consider numberOfRecords
            if (ceil > numberOfRecords)
            {
                strSummary.Append(numberOfRecords.ToString());
            }
            else
            {
                strSummary.Append(ceil.ToString());
            }
            // Displaying Total number of records Creating X of X of About X records.
            strSummary.Append("</b> of About <b>");
            strSummary.Append(numberOfRecords.ToString());
            strSummary.Append("</b> Commando</br>");
            litPagingSummary.Text = strSummary.ToString();
            if (numberOfPages == 1)
                return;
            //Variable declaration 
            //these variables will used to calculate page number display
            int pageShowLimitStart = 1;
            int pageShowLimitEnd = 1;
            // Just to check, either there is enough pages to implement page number display logic.
            if (pageDispCount > numberOfPages)
            {
                pageShowLimitEnd = numberOfPages;
                // Setting the end limit to the number of pages. Means show all page numbers
            }
            else
            {
                if (currentPage > 4)
                // If page index is more then 4 then need to less the page numbers from start and show more on end.
                {
                    //Calculating end limit to show more page numbers
                    pageShowLimitEnd = currentPage + (int)(Math.Floor((decimal)pageDispCount / 2));
                    //Calculating Start limit to hide previous page numbers
                    pageShowLimitStart = currentPage - (int)(Math.Floor((decimal)pageDispCount / 2));
                }
                else
                {
                    //Simply Displaying the 10 pages. no need to remove / add page numbers
                    pageShowLimitEnd = pageDispCount;
                }
            }
            // Since the pageDispCount can be changed and limit calculation can cause < 0 values 
            // Simply, set the limit start value to 1 if it is less
            if (pageShowLimitStart < 1)
                pageShowLimitStart = 1;
            //Dynamic creation of link buttons
            //of course if the page is the 1st page, then there is no need of First or Previous
            if (currentPage > 0)
            {
                // First Link button to display with paging
                LinkButton objLbFirst = new LinkButton();
                objLbFirst.Click += new EventHandler(objLb_Click);
                objLbFirst.Text = "First";
                objLbFirst.ID = "lb_FirstPage";
                objLbFirst.CommandName = "pgChange";
                objLbFirst.EnableViewState = true;
                objLbFirst.CommandArgument = "1";
                //Previous Link button to display with paging
                LinkButton objLbPrevious = new LinkButton();
                objLbPrevious.Click += new EventHandler(objLb_Click);
                objLbPrevious.Text = "Previous";
                objLbPrevious.ID = "lb_PreviousPage";
                objLbPrevious.CommandName = "pgChange";
                objLbPrevious.EnableViewState = true;
                objLbPrevious.CommandArgument = currentPage.ToString();
                plcPaging.Controls.Add(objLbFirst);
                plcPaging.Controls.Add(new LiteralControl("&nbsp;&nbsp;")); // Just to give some space 
                plcPaging.Controls.Add(objLbPrevious);
                plcPaging.Controls.Add(new LiteralControl("&nbsp;&nbsp;"));
            }
            //Adding control in a place holder
            // Creatig page numbers based on the start and end limit variables.
            for (int i = pageShowLimitStart; i <= pageShowLimitEnd; i++)
            {
                if ((Page.FindControl("lb_" + i.ToString()) == null) && i <= numberOfPages)
                {
                    LinkButton objLb = new LinkButton();
                    objLb.Click += new EventHandler(objLb_Click);
                    objLb.Text = i.ToString();
                    objLb.ID = "lb_" + i.ToString();
                    objLb.CommandName = "pgChange";
                    objLb.EnableViewState = true;
                    objLb.CommandArgument = i.ToString();
                    if ((currentPage + 1) == i)
                    {
                        objLb.Enabled = false;
                        objLb.CssClass = "activePagination";
                    }
                    plcPaging.Controls.Add(objLb);
                    plcPaging.Controls.Add(new LiteralControl("&nbsp;&nbsp;"));
                }
            }
            // Last Link button to display with paging
            //of course if the page is the last page, then there is no need of last or next
            if ((currentPage + 1) != numberOfPages)
            {
                LinkButton objLbLast = new LinkButton();
                objLbLast.Click += new EventHandler(objLb_Click);
                objLbLast.Text = "Last";
                objLbLast.ID = "lb_LastPage";
                objLbLast.CommandName = "pgChange";
                objLbLast.EnableViewState = true;
                objLbLast.CommandArgument = numberOfPages.ToString();
                // Next Link button to display with paging
                LinkButton objLbNext = new LinkButton();
                objLbNext.Click += new EventHandler(objLb_Click);
                objLbNext.Text = "Next";
                objLbNext.ID = "lb_NextPage";
                objLbNext.CommandName = "pgChange";
                objLbNext.EnableViewState = true;
                objLbNext.CommandArgument = (currentPage + 2).ToString();
                // Adding Control to the place holder
                plcPaging.Controls.Add(objLbNext);
                plcPaging.Controls.Add(new LiteralControl("&nbsp;&nbsp;"));
                plcPaging.Controls.Add(objLbLast);
            }
        }
    }

    private void objLb_Click(object sender, EventArgs e)
    {
        plcPaging.Controls.Clear();
        LinkButton objlb = (LinkButton)sender;
        CurrentPage = (int.Parse(objlb.CommandArgument.ToString()) - 1);
        gv.PageIndex = CurrentPage;
        BindData();
        managePaging();
    }

    #endregion

    protected void btnSave_OnClick(object sender, EventArgs e)
    {
        if (ddlApprovedby.SelectedValue.ToString() == "0")
        {
            MessageController.Show("Select Approval Type", MessageType.Error, Page);
            return;
        }
        foreach (GridViewRow gr in gv.Rows)
        {
            // int id = Convert.ToInt32(gv.DataKeys[gr.RowIndex].Value);

            string armyNo = gv.DataKeys[gr.RowIndex].Value.ToString();
            CheckBox chkbx = (CheckBox)gr.FindControl("chkSelect");
            Label lblModifiedDate = (Label)gr.FindControl("lblModifiedDate");

            DateTime modifiedDate = Convert.ToDateTime(lblModifiedDate.Text);

            if (chkbx.Checked && ddlApprovedby.SelectedItem.Text.Trim() == "Approved")
            {
                new bllBasicInfo().ApproveCmdInfo(armyNo, modifiedDate, true);
                MessageController.Show("Approved Successfully.", MessageType.Information, Page);
            }
            else if (chkbx.Checked && ddlApprovedby.SelectedItem.Text.Trim() == "UnApproved")
            {
                new bllBasicInfo().ApproveCmdInfo(armyNo, modifiedDate, false);
                MessageController.Show("UnApproved Successfully.", MessageType.Information, Page);
            }
            chkbx.Checked = false;
        }
        BindData();
        managePaging();
    }
}