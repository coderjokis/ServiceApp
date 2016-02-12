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
                            <asp:GridView ID="gvClients" DataKeyNames="ClientID" AutoGenerateColumns="false" runat="server" OnRowCommand="gvClients_RowCommand">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />
                                    <asp:BoundField DataField="ClientID" HeaderText="Client ID" />
                                    <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                                    <asp:BoundField DataField="Contacts" HeaderText="Contacts" />
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
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Contacts:</span>
                                                <asp:TextBox ID="Contacts" runat="server" CssClass="form-control" />
                                            </div>
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
                                    </div>
                                    <div class="well col-lg-6 col-md-6">
                                        <asp:Panel ID="pnlContacts" runat="server" Visible="false">
                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Client:</span>
                                                <asp:DropDownList ID="ddlClients" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>

                                            <div class="input-group paddingBot">
                                                <span class="input-group-addon width117">Contacts:</span>
                                                <asp:TextBox ID="txtAddContacts" runat="server" CssClass="form-control" />
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
