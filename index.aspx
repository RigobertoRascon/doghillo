<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="web_project_v1.index" %>

<%@ Import Namespace="MODEL" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DOGUILLO</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/new-age.css" rel="stylesheet">
    <link href="css/new-age-other.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="css/main.css" rel="stylesheet" />

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet" />

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="device-mockups/device-mockups.min.css">

    <!-- Custom styles for this template -->
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="css/set1.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body id="page-top">
    <form>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">DOGHILLO</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="frontoff_index.html">Conocenos</a>
                        </li>
                        <li class="nav-item" id="item_login" runat="server">
                            <a class="nav-link js-scroll-trigger" href="login.aspx" id="btn_login" runat="server">Iniciar sesion</a>
                        </li>
                        <li class="nav-item" id="item_logout" runat="server">
                            <form class="bg-transparent h-50">
                                <div class="dd-user nav-link dropdown">
                                    <a class="dd-user js-scroll-trigger dropdown-toggle text-uppercase text-decoration-none" data-toggle="dropdown" href="#" id="btn_username" runat="server">username</a>
                                    <span class="caret"></span>
                                    <ul class="dropdown-menu">
                                        <li><a class="nav-link js-scroll-trigger" href="profile.aspx">Ver perfil</a></li>
                                        <li>
                                            <asp:LinkButton CssClass="nav-link js-scroll-trigger" OnClick="logout_click">Cerrar sesion</asp:LinkButton></li>
                                    </ul>
                                </div>
                            </form>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <header id="home" class="home">
            <div class="s013">
                <form runat="server">
                    <fieldset class="text-xl-center">
                        <h2 class="text-xl-center font-weight-normal">Ingresa tu ubicación para iniciar</h2>
                    </fieldset>
                    <div class="inner-form">
                        <div class="left">
                            <div class="input-wrap first">
                                <div class="input-field first">
                                    <label>Ubicación</label>
                                    <asp:TextBox ID="search_input" CssClass="controls" placeholder="ex: Seattle, WA" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton OnClick="btn_search_click" CssClass="btn-search text-decoration-none text-xl-center" runat="server" ID="btn_search"><p class="mt-3">Buscar</p></asp:LinkButton>
                    </div>
            </div>
        </header>
        <section class="main-block light-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <div class="styled-heading">
                            <h3>Populares en Hermosillo</h3>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <asp:ListView ID="listview" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 featured-responsive mt-3 mb-2">
                                <div class="featured-place-wrap">
                                    <div href="detail.aspx" runat="server" id="btn_card">
                                        <img src="images/business/<%#Eval("image")%>" class="img-business-sm img-fluid" alt="#">
                                        <span class="featured-rating"><%#Eval("rating")%></span>
                                        <div class="featured-title-box">
                                            <h6><%#Eval("name")%></h6>
                                            <p><%#(Convert.ToInt32(Eval("id_categoria")) == 0)? "Hot dogs" : "Otro"  %></p>
                                            <span>• </span>
                                            <p><%#Eval("Reviews.Count")%> Reseñas</p>
                                            <span>• </span>
                                            <ul>
                                                <li><span class="icon-location-pin"></span>
                                                    <p><%#Eval("address")%></p>
                                                </li>
                                                <li><span class="icon-screen-smartphone"></span>
                                                    <p><%#Eval("number")%></p>
                                                </li>
                                            </ul>
                                            <div class="bottom-icons">
                                                <span class="ti-heart"></span>
                                                <span class="ti-bookmark"></span>
                                                <span>
                                                    <asp:LinkButton runat="server" ID="btn_view_details" CssClass="fa fa-eye " OnCommand="btn_view_details_Command" CommandArgument="<%# ((Business)(Container.DataItem)).id_business %>"></asp:LinkButton></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    </form>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <div class="featured-btn-wrap ">
                            <a href="#home" class="btn btn-danger js-scroll-trigger">BUSCAR MAS</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="contact bg-primary" id="contact">
            <div class="container">
                <h2>Contactanos en nuestras redes sociales!</h2>
                <ul class="list-inline list-social">
                    <li class="list-inline-item social-twitter">
                        <a href="#">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </li>
                    <li class="list-inline-item social-facebook">
                        <a href="#">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="list-inline-item social-google-plus">
                        <a href="#">
                            <i class="fab fa-google-plus-g"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </section>

        <footer>
            <div class="container">
                <p>&copy; doguillo 2020. All Rights Reserved.</p>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="#">Privacy</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">Terms</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">FAQ</a>
                    </li>
                </ul>
            </div>
        </footer>
    </form>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/new-age.min.js"></script>
    <script src="js/extention/choices.js"></script>
    <script>
        const choices = new Choices('[data-trigger]',
            {
                searchEnabled: false,
                itemSelectText: '',
            });

    </script>
    <script src="js/maps.js">
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS3ju2OBXZkklpjlj5XJzAbrX0by-VHOc&libraries=places&callback=initAutocomplete"
        async defer></script>
</body>

</html>
