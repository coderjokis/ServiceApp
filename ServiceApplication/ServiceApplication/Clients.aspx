<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="ServiceApplication.Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
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
        <asp:Button ID="btnAddClient" Text="Add Client" runat="server" OnClick="btnAddClient_Click" />
        <asp:Button ID="btnEditClient" Text="Edit Client" runat="server"  OnClick="btnEditClient_Click"/>
        <asp:Button ID="btnAddContact" Text="Add New Contact" runat="server" OnClick="btnAddContact_Click" />

        <asp:Panel ID="pnlClient" runat="server" Visible="false">
            ClientID:<asp:TextBox ID="txtClientID" runat="server" ReadOnly="true" />
            ClientName:<asp:TextBox ID="txtClientName" runat="server" />
            Contacts:<asp:TextBox ID="Contacts" runat="server"/>
            Phone:<asp:TextBox ID="txtPhone" runat="server" />
            Address:<asp:TextBox ID="txtAddress" runat="server" />

            <asp:Button ID="btnSaveClient" Text="Save Client" runat="server" OnClick="btnSaveClient_Click" />
            <asp:Button ID="btnCancelClient" Text="Cancel" runat="server" OnClick="btnCancelClient_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlContacts" runat="server" Visible="false">
            Client:<asp:DropDownList ID="ddlClients" runat="server">
                <asp:ListItem Text="text1" />
                <asp:ListItem Text="text2" />
            </asp:DropDownList>
            Contacts:<asp:TextBox ID="txtAddContacts" runat="server" />
            <asp:Button ID="btnSaveContact" Text="Save Contact" runat="server" OnClick="btnSaveContact_Click" />
            <asp:Button ID="btnCncelContact" Text="Cancel" runat="server" OnClick="btnCncelContact_Click" />
        </asp:Panel>

    </div>
</asp:Content>
