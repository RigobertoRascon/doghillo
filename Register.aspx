<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="web_project_v1.Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="css/new-age-other.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Registrarse</title>
</head>
<body>
    <div class="container pb-5">

        <div class="login-content omb_login pb-5">
            <h3 class="omb_authTitle">Registrarse</h3>
            <div class="row omb_row-sm-offset-3 omb_socialButtons">
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-facebook">
                        <i class="fa fa-facebook visible-xs"></i>
                        <span class="hidden-xs">Facebook</span>
                    </a>
                </div>
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-twitter">
                        <i class="fa fa-twitter visible-xs"></i>
                        <span class="hidden-xs">Twitter</span>
                    </a>
                </div>
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="btn btn-lg btn-block omb_btn-google">
                        <i class="fa fa-google-plus visible-xs"></i>
                        <span class="hidden-xs">Google+</span>
                    </a>
                </div>
            </div>

            <div class="row omb_row-sm-offset-3 omb_loginOr">
                <div class="col-xs-12 col-sm-6">
                    <hr class="omb_hrOr">
                    <span class="omb_spanOr"></span>
                </div>
            </div>

            <div class="row omb_row-sm-offset-3">
                <div class="col-xs-12 col-sm-6">
                    <form class="omb_loginForm"  autocomplete="off" runat="server">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <asp:TextBox CssClass="form-control" placeholder="Nombre de usuario" ID="txt_username" runat="server"></asp:TextBox>
                        </div>
                        <span class="help-block"></span>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <asp:TextBox CssClass="form-control" placeholder="Email" ID="txt_email" runat="server"></asp:TextBox>

                        </div>
                        <span class="help-block"></span>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <asp:TextBox CssClass="form-control" TextMode="Password" placeholder="Contraseña" ID="txt_password" runat="server"></asp:TextBox>
                        </div>
                        <span class="help-block"></span>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <asp:TextBox CssClass="form-control" TextMode="Password" placeholder="Confirmar contraseña" ID="txt_password_confirm" runat="server"></asp:TextBox>

                        </div>
                        <span class="text-sucess" id="msg_success" runat="server">Registrado exitosamente</span>
                        <span class="text-warning" id="msg_warning" runat="server">Las contraseñas no coinciden</span>
                        <asp:Button OnClick="register_click" CssClass="btn btn-lg btn-primary btn-block" Text="Registrarse" runat="server" ID="btn_register"/>
                    </form>
                </div>
            </div>
            <div class="row omb_row-sm-offset-3">
                <div class="col-xs-12 col-sm-3">
                    <label class="checkbox">
                        <input type="checkbox" value="checked" id="policy_checkbox" runat="server">Acepto <a href="#">Términos y condiciones</a>.
                    </label>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <p class="omb_forgotPwd">
                        Ya tienes cuenta?
                        <a href="login.aspx">Iniciar sesión</a>
                    </p>
                </div>
            </div>
        </div>



    </div>
</body>
</html>
