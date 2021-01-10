<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Buss.aspx.cs" Inherits="web_project_v1.Buss" %>

<%@ Import Namespace="MODEL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container mt-3 text-center">
        <h3>NEGOCIOS</h3>
        <div class="input-group mt-5 mb-5">
            <asp:TextBox ID="txtBuscarContacto" runat="server" CssClass="form-control bg-light border-1 small"></asp:TextBox>

            <div class="input-group-append">
                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-primary" runat="server" OnClick="btnBuscar_Click"> <i class="fas fa-search fa-sm"></i></asp:LinkButton>
            </div>
        </div>
        <div class="mt-5 mb-1 d-inline">
            <asp:LinkButton ID="btn_add" CssClass="btn btn-primary float-right" runat="server" OnClick="btn_add_Click"> <i class="fas fa-plus fa-sm"></i></asp:LinkButton>
        </div>
        <asp:GridView ID="gvContacto" runat="server" AutoGenerateColumns="False" CssClass=" table table-bordered dataTable">
            <HeaderStyle CssClass="thead-dark text-center" />
            <Columns>
                <asp:BoundField DataField="id_business" HeaderText="ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="Nombre" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="address" HeaderStyle-HorizontalAlign="Center" HeaderText="Direcciónnumero"/>
                <asp:BoundField DataField="number" HeaderText="Número" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="hours" HeaderText="Horario" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="rating" HeaderText="Rating" HeaderStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Categoría">
                    <ItemTemplate>
                        <asp:Label ID="lblRol" runat="server" Text='<%# (Convert.ToDecimal(Eval("id_categoria")) == 1) ? "Otro" : "Hot dogs"   %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>

                        <asp:LinkButton CssClass="" OnCommand="btn_editar_Command" CommandArgument="<%# ((Business)(Container.DataItem)).id_business %>" runat="server" ID="btn_editar"><i class="fa fa-pen"></i></asp:LinkButton>
                        <asp:LinkButton CssClass="" OnCommand="btn_borrar_click" CommandArgument="<%# ((Business)(Container.DataItem)).id_business %>" runat="server" ID="btn_borrar"><i class="fa fa-trash ml-3"></i></asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <!-- Modal -->
    <div id="my_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal_title" runat="server">Editar negocio</h5>
                    <button id="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container-fluid">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nombre del negocio</label>
                            <br />
                            <asp:TextBox ID="txt_name" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Dirección del negocio</label>
                            <br />
                            <asp:TextBox ID="txt_address" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Número</label>
                            <br />
                            <asp:TextBox ID="txt_number" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Horario</label>
                            <br />
                            <asp:TextBox ID="txt_hours" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Rating</label>
                            <br />
                            <asp:TextBox ID="txt_rating" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Categoría</label>
                            <br />
                            <asp:DropDownList ID="business_type" runat="server" CssClass="form-control">
                                <asp:ListItem Enabled="true" Text="Selecciona el tipo de usuario" Value="9"></asp:ListItem>
                                <asp:ListItem Text="Hot dogs" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Otro" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="button-modal btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button runat="server" CssClass="button-modal btn btn-primary" Text="Enviar" ID="btn_send_modal" OnClick="btn_send_modal_Click" />
                </div>
            </div>
        </div>
    </div>
    <div id="my_modal_insert" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1" runat="server">Agregar negocio</h5>
                    <button id="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container-fluid">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nombre del negocio</label>
                            <br />
                            <asp:TextBox ID="txt_name_insert" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Dirección del negocio</label>
                            <br />
                            <asp:TextBox ID="txt_address_insert" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Número</label>
                            <br />
                            <asp:TextBox ID="txt_number_insert" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Horario</label>
                            <br />
                            <asp:TextBox ID="txt_hours_insert" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Rating</label>
                            <br />
                            <asp:TextBox ID="txt_rating_insert" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Categoría</label>
                            <br />
                            <asp:DropDownList ID="business_type_insert" runat="server" CssClass="form-control">
                                <asp:ListItem Enabled="true" Text="Selecciona el tipo de usuario" Value="9"></asp:ListItem>
                                <asp:ListItem Text="Hot dogs" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Otro" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="button-modal btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button runat="server" CssClass="button-modal btn btn-primary" Text="Enviar" ID="btn_send_inser" OnClick="btn_send_inser_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
