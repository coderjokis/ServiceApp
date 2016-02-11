<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="ServiceApplication.Equipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:GridView ID="gvEquipment" runat="server"></asp:GridView>
        <asp:Button ID="btnAddEQ" Text="Add New Equipment" runat="server" OnClick="btnAddEQ_Click" />
        <asp:Button ID="btnEditEQ" Text="Edit Values" runat="server" OnClick="btnEditEQ_Click"/>
        <asp:Button ID="btnAddLocation" Text="Add New Location" runat="server" OnClick="btnAddLocation_Click" />

        <asp:Panel ID="pnlEquip" runat="server" Visible="false">
            Equipment ID:<asp:TextBox ID="txtEquipID" runat="server" />
            Equipment Name:<asp:TextBox ID="txtEquipNameType" runat="server" placeholder="Name / Type" />
            Equipment Description:<asp:TextBox ID="txtEquipDescription" runat="server" placeholder="Description" />
            VaLue:<asp:TextBox ID="txtValue" runat="server" placeholder="0.00" />
            Location:<asp:TextBox ID="txtLocation" runat="server" placeholder="Location" />

            <asp:Button ID="btnSaveEQ" Text="Save" runat="server" OnClick="btnSaveEQ_Click" />
            <asp:Button ID="btnCancelEQ" Text="Cancel" runat="server" OnClick="btnCancelEQ_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlAddLocation" runat="server" Visible="false">
            Location: <asp:TextBox ID="txtNewLocation" runat="server" />
            <asp:Button ID="btnSaveLocation" Text="Save" runat="server"  OnClick="btnSaveLocation_Click"/>
            <asp:Button ID="btnCancelLoc" Text="Cancel" runat="server" OnClick="btnCancelLoc_Click" />
        </asp:Panel>

    </div>
</asp:Content>
