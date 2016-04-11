<%@ Page Title="Dynamic Query" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="DynamicQuery.aspx.cs" Inherits="DynamicQuery"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div class="col-md-4 margin-top10">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="lbl1" Text="Base Table" Font-Bold="true" runat="server"></asp:Label></legend>
            <asp:Label ID="Label7" Text="Table" Font-Bold="true" runat="server"></asp:Label><br />
            <asp:UpdatePanel ID="UpdatePanel19" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DropDownList ID="cmbTable" runat="server" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="CmbTable_SelectedIndexChanged">
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:CheckBoxList ID="FieldNameList" runat="server" CssClass="form-control" Height="300px"
                        SelectionMode="Multiple" Style="overflow: scroll;">
                    </asp:CheckBoxList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmbTable" EventName="SelectedIndexChanged" />
                </Triggers>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ckSelectAllBase" EventName="CheckedChanged" />
                </Triggers>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:CheckBox ID="ckSelectAllBase" Text="Select All" runat="server" AutoPostBack="true"
                        OnCheckedChanged="ckSelectAllBase_CheckChanged" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmbTable" EventName="SelectedIndexChanged" />
                </Triggers>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </fieldset>
    </div>
    <div class="col-md-6 margin-top10">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="Label6" Text="Join Table" Font-Bold="true" runat="server"></asp:Label></legend>
            <div class="col-md-8">
                <asp:Label ID="Label2" Text="Relation Table" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="cmbRlTable" runat="server" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="CmbRlTable_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:CheckBoxList ID="RelationFieldNameList" runat="server" CssClass="form-control"
                            Height="300px" SelectionMode="Multiple" Style="overflow: scroll;">
                        </asp:CheckBoxList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cmbRlTable" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ckSelectAllRel" EventName="CheckedChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:CheckBox ID="ckSelectAllRel" Text="Select All" runat="server" AutoPostBack="true"
                            OnCheckedChanged="ckSelectAllRel_CheckChanged" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cmbRlTable" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-4">
                <asp:Label ID="Label4" Text="Relation Column" Font-Bold="true" runat="server"></asp:Label><br />
                <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="cmbRlColumn" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cmbRlTable" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </fieldset>
    </div>
    <div class="col-md-2 margin-top10">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="Label3" Text="Relation With" Font-Bold="true" runat="server"></asp:Label></legend>
            <asp:Label ID="Label8" Text="Table" Font-Bold="true" runat="server"></asp:Label>
            <br />
            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="joinSelectedTable" runat="server" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="JoinSelectedTable_SelectedIndexChanged">
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmbTable" EventName="SelectedIndexChanged" />
                </Triggers>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <asp:Label ID="Label5" Text="Column" Font-Bold="true" runat="server"></asp:Label>
            <br />
            <asp:UpdatePanel ID="Update15" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="cmbBaseTblClmn" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <br />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="joinSelectedTable" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Button ID="btnAddNewRel" runat="server" Text="Add Relation" CssClass="btn btn-default"
                OnClick="btnAddJoin_Click" />
        </fieldset>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblJoin" Font-Size="8" Font-Bold="true" runat="server" Text=""></asp:Label><br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnResetRel" runat="server" Text="Reset Relation" CssClass="btn btn-default"
                    OnClick="btnResetRel_Click" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddNewRel" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <%-- Condition--%>
    <div class="col-md-12 margin-top10">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="Label1" Text="Conditions" Font-Bold="true" runat="server"></asp:Label></legend>
            <div class="col-md-2">
                <asp:Label ID="Label9" Text="Table" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="conditionTbl" runat="server" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="conditionTbl_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cmbTable" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetRel" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-2">
                <asp:Label ID="Label10" Text="Colum" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="conditionTblClm" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="conditionTbl" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-2">
                <asp:Label ID="Label11" Text="Operator" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="conditionalOpCB" runat="server" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="conditionalOpCB_SelectionChanged">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem Value="&lt;">&gt;</asp:ListItem>
                            <asp:ListItem Value="&gt;">&lt;</asp:ListItem>
                            <asp:ListItem Value="&lt;=">&gt;=</asp:ListItem>
                            <asp:ListItem Value="&gt;=">&lt;=</asp:ListItem>
                            <asp:ListItem Value="=">&lt;&gt;</asp:ListItem>
                            <asp:ListItem Value="&lt;&gt;">=</asp:ListItem>
                            <asp:ListItem Value="7">LIKE</asp:ListItem>
                            <asp:ListItem Value="8">IN</asp:ListItem>
                            <asp:ListItem Value="9">BETWEEN</asp:ListItem>
                            <asp:ListItem Value="10">HAVING</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetCond" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-3">
                <asp:Label ID="Label12" Text="Value" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:TextBox ID="txtValues" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Label ID="Label14" Text="* If Value Is Date: mm/dd/yyyy" Font-Size="8" runat="server"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="conditionalOpCB" EventName="SelectedIndexChanged" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetCond" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewCon" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-1">
                <asp:Label ID="Label13" Text="AND/OR" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:UpdatePanel ID="UpdatePanel18" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList ID="conditionAndOr" runat="server" Width="80" CssClass="form-control">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">AND</asp:ListItem>
                            <asp:ListItem Value="2">OR</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResetCond" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddNewCon" EventName="Click" />
                    </Triggers>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-2">
                <br />
                <asp:Button ID="btnAddNewCon" runat="server" Text="Add Condition" CssClass="btn btn-default"
                    Style="margin-left: 20px;" OnClick="btnAddCondition_Click" /><br />
            </div>
        </fieldset>
    </div>
    <div class="col-md-6">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblWhereTxt" Font-Size="8" Font-Bold="true" runat="server" Text=""></asp:Label><br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddNewCon" EventName="Click" />
            </Triggers>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <br />
                <asp:Button ID="btnResetCond" runat="server" Text="Reset Condition" CssClass="btn btn-default"
                    OnClick="btnResetCond_Click" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddNewCon" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-4">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="Label15" Text="Order By" Font-Bold="true" runat="server"></asp:Label></legend>
            <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                <ContentTemplate>
                    <asp:CheckBoxList ID="OrderbyList" runat="server" CssClass="form-control" Height="120px"
                        SelectionMode="Multiple" Style="overflow: scroll;">
                    </asp:CheckBoxList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cmbTable" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </fieldset>
    </div>
    <div class="col-md-2">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">
                <asp:Label ID="Label16" Text="Sort By" Font-Bold="true" runat="server"></asp:Label></legend>
            <asp:DropDownList ID="orderbyMethod" runat="server" CssClass="form-control">
                <asp:ListItem Value="Ascending">Ascending</asp:ListItem>
                <asp:ListItem Value="Descending">Descending</asp:ListItem>
            </asp:DropDownList>
        </fieldset>
    </div>
    <div class="clearfix">
    </div>
    <div class="col-md-9 margin-top10">
        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="SQLQueryText" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btngenerate" EventName="Click" />
            </Triggers>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-1 margin-top10">
        <asp:Button ID="btngenerate" runat="server" Text="Generate Query" CssClass="btn btn-default"
            OnClick="btngenerate_Click" />
    </div>
    <div class="col-md-1 margin-top10" style="margin-left: 66px;">
        <asp:Button ID="btnRunQuery" Text="Run Query" runat="server" CssClass="btn btn-default"
            OnClick="btnRunQuery_Click" />
    </div>
    <div class="clearfix">
    </div>
    <div class="col-md-1 margin-top10">
        <asp:Button ID="btnReset" runat="server" Text="Reset All" CssClass="btn btn-default"
            OnClick="btnReset_Click" />
    </div>
    <div class="col-md-1 margin-top10">
        <asp:Button ID="btnEdit" Text="Edit Query" runat="server" CssClass="btn btn-default"
            OnClick="btnEdit_Click" />
    </div>
    <div class="clearfix">
    </div>
    <div class="col-md-12 margin-top10">
        <asp:UpdatePanel ID="UpdatePanel20" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btngenerate" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="clearfix">
    </div>
    <div class="col-md-12 margin-top10">
        <asp:UpdatePanel ID="UpdatePanel16" runat="server">
            <ContentTemplate>
                <asp:GridView ID="ResultGrid" runat="server" Class="table table-bordered" SkinID="SampleGridView"
                    AllowPaging="true" PageSize="20" OnPageIndexChanging="OnPageIndexChanging" Style="overflow-x: auto;">
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnRunQuery" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnExportExl" Text="Export Excel" runat="server" CssClass="btn btn-default"
            OnClick="btnExportExl_Click" />
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnExpoPdf" Text="Export PDF" runat="server" CssClass="btn btn-default"
            OnClick="btnExpoPdf_Click" Style="margin-left: -65px;" />
    </div>
</asp:Content>
