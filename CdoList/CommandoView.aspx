<%@ Page Title="Details View" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master"
    AutoEventWireup="true" CodeFile="CommandoView.aspx.cs" Inherits="Pages_CdoList_CommandoView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCurrentNode" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
<asp:Panel ID="printModeNamePln" runat="server" Visible="false">
    <asp:Label ID="lblRankAndName" runat="server"  Font-Size="Medium" ForeColor="#333" Text=""></asp:Label>
</asp:Panel>
    <div class="form-containers">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset class="scheduler-border">
                    <legend class="scheduler-border">Basic Information</legend>
                    <div class="col-sm-6 col-md-4">
                        <div class="row">
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Prefix :
                            </div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbPrefix" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Army No :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbArmyNo" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Rank :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbRank" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Name :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbName" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Unit :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbUnit" runat="server" Text=""></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Arms :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbArms" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Trade :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbTrade" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Contact :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbContact" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                TBL Account :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbAccount" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Service Status:</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbService" runat="server" Text="Label"></asp:Label></div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                Status :</div>
                            <div class="col-sm-6 col-md-8 col-lg-8">
                                <asp:Label ID="lbStatus" runat="server" Text="Label"></asp:Label></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                    <asp:Image ID="Img" Height="100" Width="100" CssClass="viewImage" runat="server" />
                    </div>
                    
                </fieldset>
                
                <fieldset class="scheduler-border" id="fsMsn" runat="server">
                    <legend class="scheduler-border">MSN Information</legend>
                    <asp:GridView ID="gvMSN" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                        DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                        <Columns>
                            <asp:TemplateField HeaderText="MsnName">
                                <ItemTemplate>
                                    <%# Eval("MsnName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From Date">
                                <ItemTemplate>
                                    <%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MMM-yyyy")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="To Date">
                                <ItemTemplate>
                                    <%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MMM-yyyy")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                <ItemTemplate>
                                    <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <fieldset class="scheduler-border" id="fsDiscState" runat="server">
                    <legend class="scheduler-border">Discip State Information</legend>
                    <asp:GridView ID="gvDiscState" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                        DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                        <Columns>
                            <asp:TemplateField HeaderText="Charge Section">
                                <ItemTemplate>
                                    <%# Eval("ChargeSection")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Discip State">
                                <ItemTemplate>
                                    <%# Eval("DiscipStateName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Offence">
                                <ItemTemplate>
                                    <%# Eval("OffenceName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Disposal Date">
                                <ItemTemplate>
                                    <%# Convert.ToDateTime(Eval("DisposalDate")).ToString("dd-MMM-yyyy")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Panishment Awarded">
                                <ItemTemplate>
                                    <%# Eval("DiscipStateName")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modified Date">
                                <ItemTemplate>
                                    <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <fieldset>
                    <fieldset class="scheduler-border" id="fsMedical" runat="server">
                        <legend class="scheduler-border">Medical Information</legend>
                        <asp:GridView ID="gvMedical" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Medical Category">
                                    <ItemTemplate>
                                        <%# Eval("MedicalCategoryName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="From Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assesment Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("AssesmentDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    <fieldset class="scheduler-border" id="fsApr" runat="server">
                        <legend class="scheduler-border">APR Information</legend>
                        <asp:GridView ID="gvApr" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Marks">
                                    <ItemTemplate>
                                        <%# Eval("Marks")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Grade">
                                    <ItemTemplate>
                                        <%# Eval("Description")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Year">
                                    <ItemTemplate>
                                        <%# Eval("Year")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Promotion Recommended">
                                    <ItemTemplate>
                                        <%# Eval("PromotionRecommended").ToString() == "True" ? "Yes": "No"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    <fieldset class="scheduler-border" id="fsSq" runat="server">
                        <legend class="scheduler-border">Spacial Qualification Information</legend>
                        <asp:GridView ID="gvSq" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Special Quality">
                                    <ItemTemplate>
                                        <%# Eval("SpecialQualityName")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    <fieldset class="scheduler-border" id="fsCourse" runat="server">
                        <legend class="scheduler-border">Course Information</legend>
                        <asp:GridView ID="gvCourse" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Course">
                                    <ItemTemplate>
                                        <%# Eval("Course")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Course Serial">
                                    <ItemTemplate>
                                        <%# Eval("CourseSerial")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="From Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marking">
                                    <ItemTemplate>
                                        <%# Eval("Marking")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Latter Grade">
                                    <ItemTemplate>
                                        <%# Eval("LatterGrade")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Position">
                                    <ItemTemplate>
                                        <%# Eval("Position")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    <fieldset class="scheduler-border" id="fsCadre" runat="server">
                        <legend class="scheduler-border">Cadre Information</legend>
                        <asp:GridView ID="gvCadre" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                            DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                            <Columns>
                                <asp:TemplateField HeaderText="Cadre">
                                    <ItemTemplate>
                                        <%# Eval("Cadre")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="From Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To Date">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marking">
                                    <ItemTemplate>
                                        <%# Eval("Marking")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="LatterGrade">
                            <ItemTemplate>
                                <%# Eval("LatterGrade")%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                        </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Position">
                                    <ItemTemplate>
                                        <%# Eval("Position")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                    <ItemTemplate>
                                        <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                    <fieldset>
                        <fieldset class="scheduler-border" id="fsCmdService" runat="server">
                            <legend class="scheduler-border">Commando Service Information</legend>
                            <asp:GridView ID="gvCmdService" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                                DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                                <Columns>
                                    <asp:TemplateField HeaderText="Place of Service">
                                        <ItemTemplate>
                                            <%# Eval("PlaceOfService")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From Date">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("FromDate")).ToString("dd-MMM-yyyy")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Date">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("ToDate")).ToString("dd-MMM-yyyy")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type of Duty">
                                        <ItemTemplate>
                                            <%# Eval("TypeOfDuty")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="LatterGrade">
                            <ItemTemplate>
                                <%# Eval("LatterGrade")%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                        </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </fieldset>
                        <fieldset class="scheduler-border" id="fsNok" runat="server">
                            <legend class="scheduler-border">NOK Information</legend>
                            <asp:GridView ID="gvNok" runat="server" ShowHeader="True" AutoGenerateColumns="False"
                                DataKeyNames="ArmyNo" AllowPaging="False" Class="table table-bordered" SkinID="SampleGridView">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%# Eval("Name")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Relation">
                                        <ItemTemplate>
                                            <%# Eval("Relation")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact">
                                        <ItemTemplate>
                                            <%# Eval("Contact")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Modified Date" Visible="false">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("ModifiedDate")).ToString("dd-MMM-yyyy")%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%# Eval("IsApproved").ToString() == "False" ? "Unapproved" : "Approved"%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width=""></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
