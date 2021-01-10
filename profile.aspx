<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="web_project_v1.profile" %>

<%@ Import Namespace="MODEL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section id="profile-bg">
        <div class="container">

            <div class="card-profile card pt-5" style="width: 30rem;">
                <div class="customer-img" id="customer-img">
                    <img src="" class="img-fluid img-thumbnail mx-auto d-block mb-5" alt="#" height="162" width="162" id="profile_img" runat="server">
                </div>
                <div class="card-body bg-light text-center">
                    <h5 class="card-title" runat="server" id="txt_name"></h5>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" runat="server" id="txt_email">Cras justo odio</li>
                    <li class="list-group-item" runat="server" id="txt_reviews">Vestibulum at eros</li>
                </ul>
                <div class="card-body bg-light">
                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Editar" ID="btn_edit_profile" OnClick="btn_edit_profile_Click" />
                    <asp:Button CssClass="btn btn-secondary" runat="server" Text="Cambiar contraseña" ID="btn_edit_pass" OnClick="btn_edit_pass_Click" />
                </div>
            </div>

        </div>
    </section>
    <!-- Modal -->
    <div id="my_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal_title" runat="server">Editar usuario</h5>
                    <button id="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container-fluid">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nombre de usuario</label>
                            <br />
                            <asp:TextBox ID="txt_name_edit" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Correo electrónico</label>
                            <br />
                            <asp:TextBox ID="txt_email_edit" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Editar imagen de perfil</label>
                            <asp:FileUpload ID="FileUpload"
                                runat="server"></asp:FileUpload>
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
    <!-- Modal -->
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1" runat="server">Cambiar contraseña</h5>
                    <button id="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container-fluid">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Contraseña actual</label>
                            <br />
                            <asp:TextBox ID="txt_pass" TextMode="Password" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nueva contraseña</label>
                            <br />
                            <asp:TextBox ID="txt_pass_edit" TextMode="Password" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Confirmar contraseña</label>
                            <br />
                            <asp:TextBox ID="txt_confirm_pass_edit" TextMode="Password" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="button-modal btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button runat="server" CssClass="button-modal btn btn-primary" Text="Enviar" ID="btn_send_pass" OnClick="btn_send_pass_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
