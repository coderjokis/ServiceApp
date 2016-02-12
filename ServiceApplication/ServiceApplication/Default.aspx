<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServiceApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <asp:GridView ID="gvShowAll" runat="server" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" CssClass="table table-info">
            <Columns>
                <asp:BoundField DataField="ClientName" HeaderText="Client"/>
                <asp:BoundField DataField="ContactName" HeaderText="Contact"/>
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone"/>
                <asp:BoundField DataField="Address" HeaderText="Address"/>
                <asp:BoundField DataField="ItemType" HeaderText="Equipment"/>
                <asp:BoundField DataField="Description" HeaderText="Description"/>
                <asp:BoundField DataField="Location" HeaderText="Location"/>
                <asp:BoundField DataField="FarFoxValue" HeaderText="Value(FarFox)"/>
                <asp:BoundField DataField="ClientValue" HeaderText="Value(Client)"/>
                <asp:BoundField DataField="InstallDate" HeaderText="Install Date"/>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
