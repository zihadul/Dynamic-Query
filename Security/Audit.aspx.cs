using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;
using System.Text;

public partial class Pages_Security_Audit : BasePage
{

    #region variables
    bllUserManagement objUserManagement = new bllUserManagement();

    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";
    public int PSize = 999999999;
    public static String tempCriteria = "";
    public static int i = 0;

    private SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Descending;
            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }
    const int pageDispCount = 10;
    int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
                return 0;

            return Convert.ToInt32(ViewState["CurrentPage"].ToString());
        }
        set { ViewState["CurrentPage"] = value; }

    }
    int TotalRec
    {
        get
        {
            if (ViewState["TotalRec"] == null)
                return 0;
            return Convert.ToInt32(ViewState["TotalRec"].ToString());
        }
        set { ViewState["TotalRec"] = value; }

    }
    int PageSize
    {
        get
        {
            if (ViewState["PageSize"] == null)
                return 0;
            return Convert.ToInt32(ViewState["PageSize"].ToString());
        }
        set { ViewState["PageSize"] = value; }

    }
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Login.aspx", true);

        if (!(User.IsInRole("SuperAdmin")))
        {
            if (Common.SessionInfo == null)
                Common.SessionInfo = new VITL.Web.CDO.BDO.bdoSessionInfo();

            Common.SessionInfo.RedirectURL = Request.Url.ToString();
            Response.Redirect("~/Login.aspx", true);
        }

        if (!IsPostBack)
        {
            ViewState["SortExpression"] = "";
            PageSize = gv.PageSize;

            ddlUser.DataSource = Membership.GetAllUsers();
            ddlUser.DataBind();

            if (Request.QueryString["pn"] != null)
                gv.PageIndex = Convert.ToInt16(Request.QueryString["pn"]);
            if (Request.QueryString["printmode"] == null)
                BindData();    

        }

        if (Request.QueryString["printmode"] == null)
            managePaging();


        if (Request.QueryString["printmode"] != null)
        {
            if (Request.QueryString["printmode"] == "y")
            {
                pnlSearch.Visible = false;
                gv.AllowPaging = false;
                gv.PageSize = PSize;
                PageSize = PSize;
                BindData();
            }
        }
    }


    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblSerial = (Label)e.Row.FindControl("lblSerial");
            lblSerial.Text = i.ToString();
            i++;
        }
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        BindData();
    }

    protected void gv_Sorting(object sender, GridViewSortEventArgs e)
    {
        plcPaging.Controls.Clear();
        string sortExpression = e.SortExpression;
        ViewState["SortExpression"] = sortExpression;
        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            BindData(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            BindData(sortExpression, ASCENDING);
        }
        managePaging();

    }

    #endregion


    #region custom Methods
    private string GetCriteria()
    {
        string Criteria = "";

        if (chkModule.Checked)
            Criteria = "ModuleName='" + ddlModule.SelectedItem.Text + "' ";

        if (chkUser.Checked)
        {
            if (Criteria == "") Criteria = "[user]='" + ddlUser.SelectedItem.Text + "' ";
            else Criteria = Criteria + " and [user]='" + ddlUser.SelectedItem.Text + "' ";
        }

        if (chkAction.Checked)
        {
            if (Criteria == "") Criteria = "Action like '%" + tbxAction.Text + "%' ";
            else Criteria = Criteria + " And Action like '%" + tbxAction.Text + "%' ";
        }

        if (chkLog.Checked)
        {
            if (Criteria == "") Criteria = "Log like '%" + tbxLog.Text + "%' ";
            else Criteria = Criteria + " And Log like '%" + tbxLog.Text + "%' ";
        }
        tempCriteria = Criteria;
        return Criteria;

    }

    //protected void BindData()
    //{
    //    DataView dv = objUserManagement.GetAudit().DefaultView;

    //    dv.RowFilter = GetCriteria();

    //    gv.DataSource = dv.ToTable();
    //    gv.DataBind();
    //}



    //add bindData

    private void BindData()
    {
        i = CurrentPage * PageSize + 1;
        string Criteria = "";
        if (Request.QueryString["printmode"] != null)
        {
            Criteria = tempCriteria;

        }
        else
        {
            Criteria = GetCriteria();

        }
        if (Criteria.Trim() != "") Criteria = " Where " + Criteria;


        DataView dv = objUserManagement.GetAudit(Criteria, CurrentPage * gv.PageSize, gv.PageSize, ViewState["SortExpression"].ToString(), "DESC").DefaultView;
        gv.DataSource = dv.ToTable();
        gv.DataBind();

        if (dv.ToTable().Rows.Count > 0)
            TotalRec = Convert.ToInt32(dv.ToTable().Rows[0]["TotalRecords"].ToString());
        else
        {
            TotalRec = 0;
            litPagingSummary.Text = "";
        }
    }

    private void BindData(string sortExpression, string direction)
    {
        i = CurrentPage * PageSize + 1;
        string Criteria = "";
        if (Request.QueryString["printmode"] != null)
        {
            Criteria = tempCriteria;

        }
        else
        {
            Criteria = GetCriteria();

        }
        if (Criteria.Trim() != "") Criteria = " Where " + Criteria;
        DataView dv = objUserManagement.GetAudit(Criteria, CurrentPage * gv.PageSize, gv.PageSize, sortExpression, direction).DefaultView;
        gv.DataSource = dv.ToTable();
        gv.DataBind();

        if (dv.ToTable().Rows.Count > 0)
            TotalRec = Convert.ToInt32(dv.ToTable().Rows[0]["TotalRecords"].ToString());
        else
        {
            TotalRec = 0;
            litPagingSummary.Text = "";
        }
    }

    private void BindAndSort()
    {
        plcPaging.Controls.Clear();
        CurrentPage = 0;
        if (ViewState["SortExpression"] != null)
        {
            if (GridViewSortDirection == SortDirection.Ascending)
                BindData(ViewState["SortExpression"].ToString(), ASCENDING);
            else
                BindData(ViewState["SortExpression"].ToString(), DESCENDING);
        }
        else
            BindData();
        managePaging();
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
        BindAndSort();
    }
    #endregion

    #region Paging

    /// <summary>
    /// To create rows in grid.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row != null && e.Row.RowType == DataControlRowType.Header)
            {
                //if (ViewState["SortExpression"] != null)
                //Common.SetGvColoumnSortDirection(gv, e, ViewState["SortExpression"].ToString());
            }
            else if (e.Row.RowType == DataControlRowType.Pager)
                e.Row.Visible = false;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    /// <summary>
    /// To change page index by clicking link button.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    void objLb_Click(object sender, EventArgs e)
    {
        try
        {
            plcPaging.Controls.Clear();
            LinkButton objlb = (LinkButton)sender;
            CurrentPage = (int.Parse(objlb.CommandArgument) - 1);
            gv.PageIndex = CurrentPage;

            if (ViewState["SortExpression"] != null)
            {
                if (GridViewSortDirection == SortDirection.Ascending)
                    BindData(ViewState["SortExpression"].ToString(), ASCENDING);
                else
                    BindData(ViewState["SortExpression"].ToString(), DESCENDING);
            }
            else
                BindData();
            
            //BindData();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        managePaging();
    }

    protected void managePaging()
    {

        if (TotalRec > 0)
        {
            // Variable declaration
            int numberOfPages;
            int numberOfRecords = TotalRec;
            PSize = TotalRec;
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
            strSummary.Append("</b> Records</br>");
            litPagingSummary.Text = strSummary.ToString();

            if (numberOfPages == 1)
                return;

            //Variable declaration 
            //these variables will used to calculate page number display
            int pageShowLimitStart = 1;
            int pageShowLimitEnd;

            // Just to check, either there is enough pages to implement page number display logic.
            if (pageDispCount > numberOfPages)
            {
                pageShowLimitEnd = numberOfPages; // Setting the end limit to the number of pages. Means show all page numbers
            }
            else
            {
                if (currentPage > 4) // If page index is more then 4 then need to less the page numbers from start and show more on end.
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
                objLbFirst.Click += objLb_Click;
                objLbFirst.Text = "First";
                objLbFirst.ID = "lb_FirstPage";
                objLbFirst.CommandName = "pgChange";
                objLbFirst.EnableViewState = true;
                objLbFirst.CommandArgument = "1";

                //Previous Link button to display with paging
                LinkButton objLbPrevious = new LinkButton();
                objLbPrevious.Click += objLb_Click;
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
                    objLb.Click += objLb_Click;
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
                objLbLast.Click += objLb_Click;
                objLbLast.Text = "Last";
                objLbLast.ID = "lb_LastPage";
                objLbLast.CommandName = "pgChange";
                objLbLast.EnableViewState = true;
                objLbLast.CommandArgument = numberOfPages.ToString();

                // Next Link button to display with paging
                LinkButton objLbNext = new LinkButton();
                objLbNext.Click += objLb_Click;
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
    #endregion


}