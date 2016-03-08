<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="ServiceApplication.Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-2 col-md-2">
            <div class="panel panel-info">
                <div class="panel-body">
                    <asp:Button ID="btnAddClient" Text="Add Client" runat="server" OnClick="btnAddClient_Click" CssClass="btn btn-primary marginBot" />
                    <%--                    <asp:Button ID="btnEditClient" Text="Edit Client" runat="server" OnClick="btnEditClient_Click" CssClass="btn btn-primary marginBot" />--%>
                    <asp:Button ID="btnAddContact" Text="Add New Contact" runat="server" OnClick="btnAddContact_Click" CssClass="btn btn-primary marginBot" />
                </div>
            </div>
        </div>
        <div class="col-lg-10 col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Manage Clients</h3>
                </div>
                <div class="panel-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:GridView ID="gvClients" DataKeyNames="ClientID" AutoGenerateColumns="false" runat="server" OnRowCommand="gvClients_RowCommand" CssClass="table table-info" AllowPaging="true" OnPageIndexChanging="gvClients_PageIndexChanging">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" CommandName="EditRow" Text="Edit" />
                                    <asp:BoundField DataField="ClientID" HeaderText="Client ID" />
                                    <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
<%--                                    <asp:BoundField DataField="ContactName" HeaderText="Contacts" />--%>
                                    <asp:TemplateField HeaderText="Contacts">
                                        <ItemTemplate>
                                            <asp:Repeater ID="rptContacts" runat="server" DataSource='<%#Eval("ContactName")%>'>
                                                <ItemTemplate>
                                                    <%#Container.DataItem%>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="well col-lg-6 col-md-6">

                                        <asp:Panel ID="pnlClient" runat="server" Visible="false">
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">ClientID:</span>
                                                <asp:TextBox ID="txtClientID" runat="server" ReadOnly="true" CssClass="form-control" />
                                            </div>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">ClientName:</span>
                                                <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" />
                                            </div>
                                            <%--<div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Contacts:</span>
                                                <asp:TextBox ID="Contacts" runat="server" CssClass="form-control" />
                                            </div>--%>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Phone:</span>
                                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                                            </div>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Address:</span>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                                            </div>

                                            <asp:Button ID="btnSaveClient" Text="Save Client" runat="server" OnClick="btnSaveClient_Click" class="btn btn-success" />
                                            <asp:Button ID="btnCancelClient" Text="Cancel" runat="server" OnClick="btnCancelClient_Click" class="btn btn-warning" />
                                        </asp:Panel>

                                        <asp:Panel ID="pnlEditClient" runat="server" Visible="false">
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">ClientID:</span>
                                                <asp:TextBox ID="txtEditClientID" runat="server" ReadOnly="true" CssClass="form-control" />
                                            </div>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">ClientName:</span>
                                                <asp:TextBox ID="txtEditClientName" runat="server" CssClass="form-control" />
                                            </div>
                                            <asp:RadioButton ID="rbtnNewContacts" Text="New Contacts" runat="server" GroupName="rbtnContacts" Checked="true" AutoPostBack="true" OnCheckedChanged="rbtnNewContacts_CheckedChanged" />
                                            <asp:RadioButton ID="rbtnExistingContacts" Text="Existing Contacts" runat="server" GroupName="rbtnContacts" AutoPostBack="true" OnCheckedChanged="rbtnExistingContacts_CheckedChanged" />

                                             <div class="input-group paddingbot">
                                                <span class="input-group-addon width117">contacts:</span>
                                                 <asp:DropDownList ID="ddleditcontacts" runat="server" CssClass="form-control" DataSourceID="ConnStringDDLEditContacts" DataTextField="ContactName" DataValueField="ContactID">
                                                 </asp:DropDownList>
                                                 <asp:SqlDataSource runat="server" ID="ConnStringDDLEditContacts" ConnectionString='<%$ ConnectionStrings:ServiceDatabaseConnectionString %>' SelectCommand="SELECT [ContactID], [ContactName] FROM [tbContacts]"></asp:SqlDataSource>
                                             </div>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Phone:</span>
                                                <asp:TextBox ID="txtEditPhone" runat="server" CssClass="form-control" />
                                            </div>
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Address:</span>
                                                <asp:TextBox ID="txtEditAddress" runat="server" CssClass="form-control" />
                                            </div>

                                            <asp:Button ID="btnSaveEditClient" Text="Save Client" runat="server" OnClick="btnSaveEditClient_Click" class="btn btn-success" />
                                            <asp:Button ID="btnCancelEdit" Text="Cancel" runat="server" OnClick="btnCancelEdit_Click" class="btn btn-warning" />
                                        </asp:Panel>

                                    </div>
                                    <div class="well col-lg-6 col-md-6">
                                        <asp:Panel ID="pnlContacts" runat="server" Visible="false">

                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Contacts:</span>
                                                <asp:TextBox ID="txtAddContacts" runat="server" CssClass="form-control" />
                                            </div>

                                            <asp:RadioButton ID="rbtnNC" Text="New Clients" runat="server" GroupName="rBtnClients" Checked="true" OnCheckedChanged="rbtnNC_CheckedChanged" AutoPostBack="true" />
                                            <asp:RadioButton ID="rbtnEC" Text="Existing Clients" runat="server" GroupName="rBtnClients" AutoPostBack="true" OnCheckedChanged="rbtnEC_CheckedChanged"/>

                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Client:</span>
                                                <asp:DropDownList ID="ddlClients" runat="server" CssClass="form-control" Enabled="false">
                                                </asp:DropDownList>
                                            </div>


                                            <asp:Button ID="btnSaveContact" Text="Save Contact" runat="server" OnClick="btnSaveContact_Click" class="btn btn-success" />
                                            <asp:Button ID="btnCncelContact" Text="Cancel" runat="server" OnClick="btnCncelContact_Click" class="btn btn-warning" />
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>






    </div>
</asp:Content>
