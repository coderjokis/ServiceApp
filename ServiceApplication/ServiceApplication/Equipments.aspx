<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="ServiceApplication.Equipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row pushContent">
        <div class="col-lg-2 col-md-2">
            <div class="panel panel-info">
                <div class="panel-body">
                    <asp:Button ID="btnAddEQ" Text="Add Equipment" runat="server" OnClick="btnAddEQ_Click" CssClass="btn btn-primary marginBot" />
<%--                    <asp:Button ID="btnEditEQ" Text="Edit Equipment" runat="server" OnClick="btnEditEQ_Click" CssClass="btn btn-primary marginBot" />--%>
                    <asp:Button ID="btnAddLocation" Text="New  Location" runat="server" OnClick="btnAddLocation_Click" CssClass="btn btn-primary marginBot" />
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
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:BoundField DataField="InstallDate" HeaderText="Install Date" />
                                    <asp:BoundField DataField="FarFoxValue" HeaderText="FarFoxValue" />
                                    <asp:BoundField DataField="ClientValue" HeaderText="ClientValue" />
                                    <asp:BoundField DataField="ItemType" HeaderText="Item Type" />
                                    <asp:BoundField DataField="LocationName" HeaderText="Location" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="well col-lg-6 col-md-6">
                                <asp:Panel ID="pnlEquip" runat="server" Visible="false">

                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">EquipmentID:</span>
                                        <asp:TextBox ID="txtEquipID" runat="server" ReadOnly="true" CssClass="form-control" placeholder="Equipment ID" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Name:</span>
                                        <asp:TextBox ID="txtEquipNameType" runat="server" placeholder="Name / Type" CssClass="form-control" TextMode="SingleLine" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Description:</span>
                                        <asp:TextBox ID="txtEquipDescription" runat="server" placeholder="Description" CssClass="form-control" TextMode="SingleLine"/>

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Install Date:</span>
                                        <asp:TextBox ID="txtInstallDate" runat="server" placeholder="InstallDate" CssClass="form-control" TextMode="Date"/>

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">FarFoxVaLue:</span>
                                        <asp:TextBox ID="txtFValue" runat="server" placeholder="0.00" CssClass="form-control" TextMode="Number"/>
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ClientVaLue:</span>
                                        <asp:TextBox ID="txtCValue" runat="server" placeholder="0.00" CssClass="form-control" TextMode="Number" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Location:</span>
                                        <asp:TextBox ID="txtLocation" runat="server" placeholder="Location" CssClass="form-control" TextMode="MultiLine" />
                                    </div>


                                    <asp:Button ID="btnSaveEQ" Text="Save" runat="server" OnClick="btnSaveEQ_Click" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancelEQ" Text="Cancel" runat="server" OnClick="btnCancelEQ_Click" CssClass="btn btn-warning" />
                                </asp:Panel>

                                <asp:Panel ID="pnlEditEquipment" runat="server" Visible="false">
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">EquipmentID:</span>
                                        <asp:TextBox ID="txtEditEquipID" runat="server" ReadOnly="true" CssClass="form-control" placeholder="Equipment ID" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Name:</span>
                                        <asp:TextBox ID="txtEditEquipNameType" runat="server" placeholder="Name / Type" CssClass="form-control" TextMode="SingleLine" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Description:</span>
                                        <asp:TextBox ID="txtEditEquipDescription" runat="server" placeholder="Description" CssClass="form-control" TextMode="SingleLine"  />

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Install Date:</span>
                                        <asp:TextBox ID="txtEditInstallDate" runat="server" placeholder="InstallDate" CssClass="form-control" TextMode="Date" />

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">FarFoxVaLue:</span>
                                        <asp:TextBox ID="txtEditFValue" runat="server" placeholder="0.00" CssClass="form-control" TextMode="Number"/>
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">ClientVaLue:</span>
                                        <asp:TextBox ID="txtEditCValue" runat="server" placeholder="0.00" CssClass="form-control" TextMode="Number"/>
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon width117">Location:</span>
                                        <asp:TextBox ID="txtEditLocation" runat="server" placeholder="Location" CssClass="form-control" TextMode="SingleLine" />
                                    </div>

                                    <asp:Button ID="btnSaveEditEquipment" runat="server" Text="Save Equipment" OnClick="btnSaveEditEquipment_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </asp:Panel>
                            </div>

                            <div class="well col-lg-6 col-md-6">
                                <asp:Panel ID="pnlAddLocation" runat="server" Visible="false">
                                    <asp:GridView ID="gvLocation" runat="server" AutoGenerateColumns="False" DataKeyNames="LocationID" DataSourceID="ALANServer" CssClass="table table-default" AllowPaging="True" AllowSorting="True" >
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
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
