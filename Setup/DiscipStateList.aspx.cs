using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VITL.Web.CDO.BLL;
using System.Text;
using System.Data;

public partial class Pages_Setup_DiscipStateList : System.Web.UI.Page
{

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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
        managePaging();
    }
    protected void BindData()
    {
        plcPaging.Controls.Clear();
        lblSearchResult.Text = "";
        DataTable dt = new DataTable();

        string Criteria = "";
        if (Request.QueryString["printmode"] != null)
        {
            Criteria = Session["DiscipStateCriteria"].ToString();

        }
        else
        {
            Criteria = GetCriteria();
            Session["DiscipStateCriteria"] = Criteria;
        }

        dt = new bllDiscipState().GetBySearchParameter(CurrentPage * PageSize, PageSize, Criteria, PrintMode);
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


        if (tbxDiscip.Text.Trim() != "")
        {
            if (Criteria == "") Criteria = "DiscipStateName like '%" + tbxDiscip.Text.Trim() + "%'";
            else Criteria += " And DiscipStateName like '%" + tbxDiscip.Text.Trim() + "%'";
        }

        return Criteria;
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        try
        {
            DataTable dt = new bllDiscipState().GetById(Convert.ToInt32(e.CommandArgument.ToString()));
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            new bllDiscipState().Delete(id);
            new bllAudit().Insert("Setup", "Delete DiscipState", "DiscipState: " + dt.Rows[0]["DiscipStateName"].ToString(), User.Identity.Name); 
            BindData();
            managePaging();
        }
        catch (Exception ex)
        {
            MessageController.Show(ex.Message, MessageType.Error, Page);
        }

    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        plcPaging.Controls.Clear();
        CurrentPage = 0;
        BindData();
        managePaging();
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        BindData();
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
            strSummary.Append("</b> Discip State</br>");
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
}