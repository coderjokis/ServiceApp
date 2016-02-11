<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServiceApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <asp:GridView ID="gvShowAll" runat="server" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false">
            <Columns>

<%--                insert columns here--%>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
