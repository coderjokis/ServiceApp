<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="ServiceApplication.Clients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:GridView ID="gvClients" runat="server"></asp:GridView>

        ClientID:<asp:TextBox ID="txtClientID" runat="server" ReadOnly="true" />
        ClientName:<asp:TextBox ID="txtClientName" runat="server" />   
        Contacts:<asp:TextBox ID="Contacts" runat="server" TextMode="MultiLine" />
        Phone:<asp:TextBox ID="txtPhone" runat="server" />
        Address:<asp:TextBox ID="txtAddress" runat="server" />
    </div>
</asp:Content>
