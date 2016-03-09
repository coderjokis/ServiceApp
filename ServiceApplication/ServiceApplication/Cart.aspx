<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ServiceApplication.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row paddingBot">
        <div class="col-lg-12 col-md-12">
            <div class="col-lg-6 col-md-6">
                <div class="input-group">
                    <span class="input-group-addon">Client:</span>
                    <asp:DropDownList ID="ddlInvClient" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <span class="input-group-btn">
                        <asp:Button ID="btnSelectInvClient" runat="server" Text="Select" OnClick="btnSelectInvClient_Click" CssClass="btn btn-info" />
                    </span>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="input-group">
                    <span class="input-group-addon">Contact:</span>
                    <asp:DropDownList ID="ddlContact" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <span class="input-group-btn">
                        <asp:Button ID="btnSelectContact" runat="server" CssClass="btn btn-info" Text="Select" OnClick="btnSelectContact_Click" />
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <asp:DataList ID="dtEquipment" runat="server" OnItemCommand="dtEquipment_ItemCommand" RepeatColumns="4" DataKeyField="EquipmentID" CssClass="row text-center" Width="783px">

            <ItemTemplate>
                <div style="border: 1px solid rgb(78, 96, 150); padding: 3px 5px 3px 5px; background-color: aliceblue; opacity: 0.9; margin-right: 15px">
                    <asp:Label ID="lblMsg" Visible="false" runat="server" />
                    <div id="dlName">
                        <h4><%#Eval("ItemType") %></h4>
                    </div>
                    <div id="dlPrice">
                        <h4>FarFox: $ <%#Eval("FarFoxValue") %></h4>
                        <h4>Client: $ <%#Eval("ClientValue") %></h4>
                    </div>
                    <%--<div id="dlDesc">
                        <h4><%#Eval("Description") %></h4>
                    </div>--%>

                    <div id="dlQty" class="input-group paddingBot">
                        <span class="input-group-addon" id="basic-addon1">Quantity</span>
                        <asp:TextBox ID="txtDLQty" runat="server" CssClass="form-control" TextMode="Number" Width="70px"></asp:TextBox>
                    </div>

                    <div id="dlAdd">
                        <asp:Button ID="btnDLAdd" Text="Add to cart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("ItemID") %>' CssClass="btn btn-success" />
                    </div>
                    <%--<div id="dlCancel">
                        <asp:Button ID="btnDLCancel" Text="c" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("ItemID") %>' CssClass="btn btn-danger" />
                    </div>--%>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="row paddingBot">
        <asp:GridView ID="gvShoppingCart" DataKeyNames="InventoryID" runat="server" AutoGenerateColumns="False" DataSourceID="LoadGvInventoryConn" CssClass="table table-default">
            <Columns>
                <asp:BoundField DataField="InventoryID" HeaderText="InventoryID" InsertVisible="False" ReadOnly="True" SortExpression="InventoryID" />
                <asp:BoundField DataField="ItemType" HeaderText="ItemType" SortExpression="ItemType" />
                <asp:BoundField DataField="ClientName" HeaderText="ClientName" SortExpression="ClientName" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="InstallDate" HeaderText="InstallDate" SortExpression="InstallDate" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="LoadGvInventoryConn" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionString %>" SelectCommand="SELECT i.InventoryID, x.ItemType, c.ClientName, i.Description, i.InstallDate, i.Quantity, l.LocationName FROM tbInventory AS i INNER JOIN tbEquipment AS e ON e.EquipmentID = i.EquipmentID INNER JOIN tbItem AS x ON x.ItemID = e.EquipmentID INNER JOIN tbLocation AS l ON l.LocationID = i.LocationID INNER JOIN tbClients AS c ON c.ClientID = i.ClientID"></asp:SqlDataSource>
    </div>

    <asp:Panel ID="pnlInvInput" runat="server" Visible="false">
        <div class="row">
            <div class="input-group paddingBot">
        <span class="input-group-addon width117">Description:</span>
        <asp:TextBox ID="txtEquipDescription" runat="server" placeholder="Description" CssClass="form-control" TextMode="SingleLine" />
    </div>
    <div class="input-group paddingBot">
        <span class="input-group-addon width117">Install Date:</span>
        <asp:TextBox ID="txtInstallDate" runat="server" placeholder="InstallDate" CssClass="form-control" TextMode="Date" />
    </div>
    <div class="input-group paddingBot">
        <span class="input-group-addon width117">Location:</span>
        <asp:DropDownList ID="ddlEditLocation" runat="server" CssClass="form-control" DataSourceID="LocationConn" DataTextField="LocationName" DataValueField="LocationID" TabIndex="1">
        </asp:DropDownList>
        <asp:SqlDataSource ID="LocationConn" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringLocation %>" SelectCommand="SELECT [LocationID], [LocationName] FROM [tbLocation]"></asp:SqlDataSource>
    </div>
    <asp:Button ID="btnSaveItem" Text="Save" runat="server" OnClick="btnSaveItem_Click" CssClass="btn btn-success" />
    <asp:Button ID="btnCancelItem" Text="Cancel" runat="server" OnClick="btnCancelItem_Click" CssClass="btn btn-warning" />

        </div>
    </asp:Panel>
    



</asp:Content>
