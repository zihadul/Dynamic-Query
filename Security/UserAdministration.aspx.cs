using System;
using System.Data;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.DAL;
using VITL.Web.CDO.BDO;

public partial class Pages_Security_UserAdministration : BasePage
{
    #region Variable
    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";

    private SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;
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
    #endregion

    #region Events
    bllUserManagement objUserManagement = new bllUserManagement();
    List<bdoUser> objbdoUser = new List<bdoUser>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Login.aspx", true);

        //if (!(User.IsInRole("SuperAdmin")))
        //{
        //    if (Common.SessionInfo == null)
        //        Common.SessionInfo = new VITL.Web.CDO.BDO.bdoSessionInfo();

        //    Common.SessionInfo.RedirectURL = Request.Url.ToString();
        //    Response.Redirect("~/Login.aspx", true);
        //}
        if (!IsPostBack)
        {
            ViewState["SortExpression"] = "UserName";
            PageSize = gv.PageSize;
            BindData();
        }
        else
        {
            managePaging();
        }

        if (Request.QueryString["printmode"] == "y")
        {
            btnAddNew.Visible = false;
            gv.Columns[gv.Columns.Count - 1].Visible = false;
            gv.Columns[gv.Columns.Count - 2].Visible = false;
            gv.Columns[gv.Columns.Count - 3].Visible = false;
        }
    }

    protected void BindData()
    {

        //List<bdoUser> lst = objUserManagement.GetList(CurrentPage * gv.PageSize, gv.PageSize, ViewState["SortExpression"].ToString(), "ASC");

        //DataTable dtNew = objUserManagement.GetList(CurrentPage * gv.PageSize, gv.PageSize, ViewState["SortExpression"].ToString(), "ASC");
        DataTable lst = new DataTable();
        if (!User.IsInRole("SuperAdmin"))
        {
            DataTable CommonDt = new bllCommon().GetSystemUserByUserName(User.Identity.Name);

            if (CommonDt.Rows.Count > 0)
            {
                string userId = CommonDt.Rows[0]["UserId"].ToString();
                string unit = CommonDt.Rows[0]["CdoUnitId"].ToString();
                UnitId = Convert.ToInt32(unit);
            }

            lst = new bllUser().GetList(UnitId);
        }
        else
        {
            lst = new bllUser().GetListForSupperAdmin();
        }
        
        gv.DataSource = lst;
        gv.DataBind();

      
    }

    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            bdoUser drv = e.Row.DataItem as bdoUser;

            Button btnViewDetails = e.Row.FindControl("btnViewDetails") as Button;
            Button btnDelete = e.Row.FindControl("btnDelete") as Button;
            if (btnViewDetails != null && btnDelete != null && drv != null)
            {
                btnViewDetails.CommandArgument = e.Row.RowIndex.ToString() + "," + drv.UserName;
                btnDelete.CommandArgument = e.Row.RowIndex.ToString() + "," + drv.UserName;
            }
        }
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Security/AddEditUser.aspx");
    }

  

    protected void btnViewDetails_Command(object sender, CommandEventArgs e)
    {
        string[] strArray = e.CommandArgument.ToString().Split(',');
        Response.Redirect("~/Pages/Security/UserDetails.aspx?UN=" + EncryptDecrypt.EncryptDecryptString(strArray[1]), true);
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        Membership.DeleteUser(e.CommandArgument.ToString(), true);
        BindData();
       
    }

    #region Paging
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gv.PageIndex = e.NewPageIndex;

           
            BindData();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
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
            BindData();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        //managePaging(dt);
    }
    /// <summary>
    /// To sort columns in grid order by ascending or descending.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gv_Sorting(object sender, GridViewSortEventArgs e)
    {
        try
        {
            plcPaging.Controls.Clear();
            string sortExpression = e.SortExpression;

            ViewState["SortExpression"] = sortExpression;
            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                BindData();
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                BindData();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

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

    #endregion
}