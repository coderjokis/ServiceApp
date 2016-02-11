<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="ServiceApplication.Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:GridView ID="gvClients" runat="server"></asp:GridView>
        <asp:Button ID="btnAddClient" Text="Add Client" runat="server" OnClick="btnAddClient_Click" />
        <asp:Button ID="btnEditClient" Text="Edit Client" runat="server"  OnClick="btnEditClient_Click"/>

        <asp:Panel ID="pnlClient" runat="server" Visible="false">
            ClientID:<asp:TextBox ID="txtClientID" runat="server" ReadOnly="true" />
            ClientName:<asp:TextBox ID="txtClientName" runat="server" />
            Contacts:<asp:TextBox ID="Contacts" runat="server"/>
            Phone:<asp:TextBox ID="txtPhone" runat="server" />
            Address:<asp:TextBox ID="txtAddress" runat="server" />

            <asp:Button ID="btnSaveClient" Text="Save Client" runat="server" OnClick="btnSaveClient_Click" />
            <asp:Button ID="btnCancelClient" Text="Cancel" runat="server" OnClick="btnCancelClient_Click" />
        </asp:Panel>

    </div>
</asp:Content>
