﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VITL.Web.CDO.BLL;
using VITL.Web.CDO.BDO;

public partial class Pages_Setup_AddEditCadre : System.Web.UI.Page
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
            }

            if (ID > 0)
                Populate();
        }
    }

    protected void Populate()
    {
        DataTable dt = new bllCadre().GetById(ID);

        if (dt.Rows.Count > 0)
        {
            tbxCadre.Text = dt.Rows[0]["Cadre"].ToString();
            tbxCode.Text = dt.Rows[0]["code"].ToString();
            tbxDescription.Text = dt.Rows[0]["Description"].ToString();

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            InsertUpdate();
            Clear();
        }
        catch (Exception)
        {
            throw;
        }
    }

    private void InsertUpdate()
    {
        bdoCadre objCadre = new bdoCadre();
        objCadre.CadreId = ID;
        objCadre.Cadre = tbxCadre.Text;
        objCadre.code = tbxCode.Text;
        objCadre.Description = tbxDescription.Text;
        new bllCadre().InsertUpdate(objCadre);
        new bllAudit().Insert("Setup", "InsertUpdate Cadre", "Cadre: " + tbxCadre.Text, User.Identity.Name);
        MessageController.Show("Saved successfully.", MessageType.Information, Page);
    }
    private void Clear()
    {
        tbxCadre.Text = "";
        tbxCode.Text = "";
        tbxDescription.Text = "";
    }
}