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
        <asp:DataList ID="dtEquipment" runat="server" OnItemCommand="dtEquipment_ItemCommand" RepeatColumns="4" DataKeyField="EquipmentID" CssClass="row">

            <ItemTemplate>
                <div style="border: 1px solid rgb(78, 96, 150); padding: 3px 5px 3px 5px; background-color: aliceblue; opacity: 0.9; ">
                    <asp:Label ID="lblMsg" Visible="false" runat="server" />
                    <div id="dlName">
                        <h4><%#Eval("ItemType") %></h4>
                    </div>
                    <div id="dlPrice">
                        <h4>FarFox: $ <%#Eval("FarFoxValue") %></h4>
                        <h4>Client: $ <%#Eval("ClientValue") %></h4>
                    </div>
                    <div id="dlDesc">
                        <h4><%#Eval("Description") %></h4>
                    </div>

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





</asp:Content>
