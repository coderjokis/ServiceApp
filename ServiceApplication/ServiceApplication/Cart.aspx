<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ServiceApplication.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            Client:
    <asp:DropDownList ID="ddlInvClient" runat="server">
    </asp:DropDownList>
            <asp:Button ID="btnSelectInvClient" runat="server" Text="Select" OnClick="btnSelectInvClient_Click" />
        Contact:
    <asp:DropDownList ID="ddlContact" runat="server">
    </asp:DropDownList>
            <asp:Button ID="btnSelectContact" runat="server" Text="Select" OnClick="btnSelectContact_Click" />
        <asp:DataList ID="dtEquipment" runat="server" OnItemCommand="dtEquipment_ItemCommand" RepeatColumns="3" DataKeyField="EquipmentID">
            <ItemTemplate>
                <div style="border: 1px solid rgb(78, 96, 150); padding: 3px 3px 3px 3px; background-color: aliceblue; opacity: 0.9">
                    <div id="dlName">
                        <%#Eval("ItemName") %>
                    </div>
                    <div id="dlPrice">
                        <span>FarFox: $ <%#Eval("FarFoxValue") %></span>
                        <span>Client: $ <%#Eval("ClientValue") %></span>
                    </div>
                    <div id="dlDesc">
                        <%#Eval("Description") %>
                    </div>
                    <div id="dlQty">
                        <asp:TextBox ID="txtDLQty" runat="server" TextMode="Number" Width="50px"></asp:TextBox>
                    </div>
                    <div id="dlAdd">
                        <asp:Button ID="btnDLAdd" Text="Add to cart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("ItemID") %>' />
                    </div>
                    <div id="dlCancel">
                        <asp:Button ID="btnDLCancel" Text="Add to cart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("ItemID") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        </div>
        
    </div>



</asp:Content>
