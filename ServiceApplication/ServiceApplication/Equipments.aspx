<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="ServiceApplication.Equipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-2 col-md-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Manage</h3>
                </div>
                <div class="panel-body">
                    <asp:Button ID="btnAddEQ" Text="Equipment" runat="server" OnClick="btnAddEQ_Click" CssClass="btn btn-primary marginBot" />
                    <asp:Button ID="btnAddLocation" Text="Item/Location" runat="server" OnClick="btnAddLocation_Click" CssClass="btn btn-primary marginBot" />
                </div>
            </div>
        </div>
        <div class="col-lg-10 col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Manage Equipments</h3>
                </div>
                <div class="panel-body li">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:GridView ID="gvEquipment" DataKeyNames="EquipmentID" AutoGenerateColumns="false" runat="server" CssClass="table table-info padBot" OnRowCommand="gvEquipment_RowCommand">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" CommandName="EditRow" Text="Edit" />
                                    <asp:BoundField DataField="EquipmentID" HeaderText="Equipment ID" />
                                    <asp:BoundField DataField="LocationName" HeaderText="Location" />
                                    <%--<asp:BoundField DataField="Description" HeaderText="Description" />--%>
                                    <%--<asp:BoundField DataField="InstallDate" HeaderText="Install Date" />--%>
                                    <asp:BoundField DataField="FarFoxValue" HeaderText="FarFoxValue" />
                                    <asp:BoundField DataField="ClientValue" HeaderText="ClientValue" />
                                    <asp:BoundField DataField="ItemType" HeaderText="Item Type" />                                  
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-lg-6 col-md-6">
                                <asp:Panel ID="pnlEquip" runat="server" Visible="false">

                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">EquipmentID:</span>
                                        <asp:TextBox ID="txtEquipID" runat="server" ReadOnly="true" CssClass="form-control" placeholder="Equipment ID" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Type:</span>
                                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" DataSourceID="ItemtypeDDL" DataTextField="ItemType" DataValueField="ItemID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="ItemtypeDDL" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringItemType %>" SelectCommand="SELECT [ItemType], [ItemID] FROM [tbItem]"></asp:SqlDataSource>
                                        <%--<asp:TextBox ID="txtEquipNameType" runat="server" placeholder="Name / Type" CssClass="form-control" TextMode="SingleLine" />--%>
                                    </div>
                                    <%--<div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Description:</span>
                                        <asp:TextBox ID="txtEquipDescription" runat="server" placeholder="Description" CssClass="form-control" TextMode="SingleLine" />

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Install Date:</span>
                                        <asp:TextBox ID="txtInstallDate" runat="server" placeholder="InstallDate" CssClass="form-control" TextMode="Date" />

                                    </div>--%>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">FarFoxVaLue:</span>
                                        <asp:TextBox ID="txtFValue" runat="server" placeholder="0.00" CssClass="form-control" />
                                    </div>
                                    <asp:RegularExpressionValidator ID="rXFvalue" ErrorMessage="invalid" ControlToValidate="txtFValue" runat="server" ValidationExpression="([0-9]{1,})([.,][0-9]{1,3})?$" />
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ClientVaLue:</span>
                                        <asp:TextBox ID="txtCValue" runat="server" placeholder="0.00" CssClass="form-control" />
                                    </div>
                                    <asp:RegularExpressionValidator ID="rXtxtCValue" ErrorMessage="invalid" ControlToValidate="txtCValue" runat="server" ValidationExpression="([0-9]{1,})([.,][0-9]{1,3})?$" />
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Location:</span>
                                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control" DataSourceID="LocationConn" DataTextField="LocationName" DataValueField="LocationID">
                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="txtLocation" runat="server" placeholder="Location" CssClass="form-control" TextMode="MultiLine" />--%>
                                    </div>
                                    <%--<div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Contact:</span>
                                        <asp:DropDownList ID="ddlContact" runat="server" CssClass="form-control" DataSourceID="ddlContacts" DataTextField="ContactID" DataValueField="ContactID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="ddlContacts" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringDDLContacts %>" SelectCommand="SELECT [ContactID], [ContactName], [ClientID] FROM [tbContacts]"></asp:SqlDataSource>
                                    </div>--%>

                                    <asp:Button ID="btnSaveEQ" Text="Save" runat="server" OnClick="btnSaveEQ_Click" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancelEQ" Text="Cancel" runat="server" OnClick="btnCancelEQ_Click" CssClass="btn btn-warning" />
                                </asp:Panel>

                                <asp:Panel ID="pnlEditEquipment" runat="server" Visible="false">
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">EquipmentID:</span>
                                        <asp:TextBox ID="txtEditEquipID" runat="server" ReadOnly="true" CssClass="form-control" placeholder="Equipment ID" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Type:</span>
                                        <asp:DropDownList ID="ddlEditEquipNameType" runat="server" CssClass="form-control" DataSourceID="ItemtypeDDL" DataTextField="ItemType" DataValueField="ItemID">
                                        </asp:DropDownList>
                                    </div>
                                    <%--<div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Description:</span>
                                        <asp:TextBox ID="txtEditEquipDescription" runat="server" placeholder="Description" CssClass="form-control" TextMode="SingleLine" />

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Install Date:</span>
                                        <asp:TextBox ID="txtEditInstallDate" runat="server" placeholder="InstallDate" CssClass="form-control" TextMode="Date" />

                                    </div>--%>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">FarFoxVaLue:</span>
                                        <asp:TextBox ID="txtEditFValue" runat="server" placeholder="0.00" CssClass="form-control" />
                                    </div>
                                    <asp:RegularExpressionValidator ID="rXtxtEditFValue" ErrorMessage="invalid" ControlToValidate="txtEditFValue" runat="server" ValidationExpression="([0-9]{1,})([.,][0-9]{1,3})?$" />

                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ClientVaLue:</span>
                                        <asp:TextBox ID="txtEditCValue" runat="server" placeholder="0.00" CssClass="form-control"  />

                                    </div>
                                    <asp:RegularExpressionValidator ID="rXtxtEditCValue" ErrorMessage="invalid" ControlToValidate="txtEditCValue" runat="server" ValidationExpression="([0-9]{1,})([.,][0-9]{1,3})?$" />

                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Location:</span>
                                        <asp:DropDownList ID="ddlEditLocation" runat="server" CssClass="form-control" DataSourceID="LocationConn" DataTextField="LocationName" DataValueField="LocationID" TabIndex="1" >
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="LocationConn" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringLocation %>" SelectCommand="SELECT [LocationID], [LocationName] FROM [tbLocation]"></asp:SqlDataSource>
                                    </div>

                                    <asp:Button ID="btnSaveEditEquipment" runat="server" Text="Save Equipment" CssClass="btn btn-success" OnClick="btnSaveEditEquipment_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" />
                                </asp:Panel>
                            </div>

                            <div class="col-lg-6 col-md-6">
                                <asp:Panel ID="pnlAddLocation" runat="server" Visible="false">
                                    <asp:GridView ID="gvLocation" runat="server" AutoGenerateColumns="False" DataKeyNames="LocationID" DataSourceID="ALANServer" CssClass="table table-default" AllowPaging="True" AllowSorting="True">
                                        <Columns>
                                            <asp:BoundField DataField="LocationID" HeaderText="LocationID" InsertVisible="False" ReadOnly="True" SortExpression="LocationID" />
                                            <asp:BoundField DataField="LocationName" HeaderText="LocationName" SortExpression="LocationName" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="ALANServer" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringToLoadLocation %>" SelectCommand="SELECT * FROM [tbLocation]"></asp:SqlDataSource>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Location:</span>
                                        <asp:TextBox ID="txtNewLocation" runat="server" CssClass="form-control" />
                                    </div>
                                    <asp:Button ID="btnSaveLocation" Text="Save" runat="server" OnClick="btnSaveLocation_Click" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancelLoc" Text="Cancel" runat="server" OnClick="btnCancelLoc_Click" CssClass="btn btn-warning" />
                                    <span class ="divider"></span>
                                    <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="ItemConnString" CssClass="table table-default" OnRowCommand="gvItem_RowCommand">
                                        <Columns>
                                            <asp:ButtonField ButtonType="Button" CommandName="EditItem" Text="Edit"/>
                                            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                                            <asp:BoundField DataField="ItemType" HeaderText="ItemType" SortExpression="ItemType" />
                                        </Columns>
                                    </asp:GridView>
                                    
                                    <asp:SqlDataSource ID="ItemConnString" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceDatabaseConnectionStringToLoadItemGV %>" SelectCommand="SELECT [ItemID], [ItemType] FROM [tbItem]"></asp:SqlDataSource>
                                    
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ItemID:</span>
                                        <asp:TextBox ID="txtItemInputID" runat="server" CssClass="form-control" ReadOnly="true" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ItemType:</span>
                                        <asp:TextBox ID="txtAddNewItem" runat="server" CssClass="form-control" />
                                    </div> 
                                    <asp:Button ID="btnSaveItem" Text="Save" runat="server" OnClick="btnSaveItem_Click" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancelItem" Text="Cancel" runat="server" OnClick="btnCancelItem_Click" CssClass="btn btn-warning" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
