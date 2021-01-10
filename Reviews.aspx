<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="web_project_v1.Reviews" %>
<%@ Import Namespace="MODEL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container mt-3 text-center">
        <h3>RESEÑAS</h3>
        <div class="input-group mt-5 mb-5">
            <asp:TextBox ID="txtBuscarContacto" runat="server" CssClass="form-control bg-light border-1 small"></asp:TextBox>

            <div class="input-group-append">
                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-primary" runat="server" OnClick="btnBuscar_Click"> <i class="fas fa-search fa-sm"></i></asp:LinkButton>
            </div>
        </div>
        <asp:GridView ID="gvContacto" runat="server" AutoGenerateColumns="False" CssClass=" table table-bordered dataTable">
            <HeaderStyle CssClass="thead-dark text-center" />
            <Columns>
                <asp:BoundField DataField="id_review" HeaderText="ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="title" HeaderText="Titulo" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="text" HeaderStyle-HorizontalAlign="Center"  HeaderText="Reseña" />
                <asp:BoundField DataField="score" HeaderText="Calificación" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="date" HeaderText="Fecha" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CssClass="" OnCommand="btn_borrar_click" CommandArgument="<%# ((Review)(Container.DataItem)).id_review %>" runat="server" ID="btn_borrar"><i class="fa fa-trash ml-3"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>