<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="ServiceApplication.Equipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row pushContent">
        <div class="col-lg-2 col-md-2">
            <div class="panel panel-info">
                <div class="panel-body">
                    <asp:Button ID="btnAddEQ" Text="Add Equipment" runat="server" OnClick="btnAddEQ_Click" CssClass="btn btn-primary marginBot" />
                    <asp:Button ID="btnEditEQ" Text="Edit Equipment" runat="server" OnClick="btnEditEQ_Click" CssClass="btn btn-primary marginBot" />
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
                            <asp:GridView ID="gvEquipment" runat="server" CssClass="btn btn-default padBot"></asp:GridView>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="well col-lg-6 col-md-6">
                                <asp:Panel ID="pnlEquip" runat="server" Visible="false" CssClass="li">

                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">EquipmentID:</span>
                                        <asp:TextBox ID="txtEquipID" runat="server" CssClass="form-control" placeholder="Equipment ID" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">Name:</span>
                                        <asp:TextBox ID="txtEquipNameType" runat="server" placeholder="Name / Type" CssClass="form-control" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">Description:</span>
                                        <asp:TextBox ID="txtEquipDescription" runat="server" placeholder="Description" CssClass="form-control" />

                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">VaLue:</span>
                                        <asp:TextBox ID="txtValue" runat="server" placeholder="0.00" CssClass="form-control" />
                                    </div>
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">Location:</span>
                                        <asp:TextBox ID="txtLocation" runat="server" placeholder="Location" CssClass="form-control" />
                                    </div>


                                    <asp:Button ID="btnSaveEQ" Text="Save" runat="server" OnClick="btnSaveEQ_Click" CssClass="btn btn-success" />
                                    <asp:Button ID="btnCancelEQ" Text="Cancel" runat="server" OnClick="btnCancelEQ_Click" CssClass="btn btn-warning" />
                                </asp:Panel>
                            </div>

                            <div class="well col-lg-6 col-md-6">
                                <asp:Panel ID="pnlAddLocation" runat="server" Visible="false">
                                    <div class="input-group paddingBot">
                                        <span class="input-group-addon">Location:</span>
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
