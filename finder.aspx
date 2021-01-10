<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="finder.aspx.cs" Inherits="web_project_v1.finder" %>

<%@ Import Namespace="MODEL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12 responsive-wrap">
                    <div class="col-md-12 featured-responsive">
                        <div class="detail-filter-text mb-4">
                            <h4><span id="lbl_how_many" runat="server">0</span><span id="lbl_address" runat="server">Hermosillo, Son.</span></h4>
                            <i class="fa  fa-map-pin " aria-hidden="true"></i> <a href="index.aspx" class="link-place text-decoration-none">Cambiar ubicación</a>
                        </div>
                    </div>
                    <div class="row detail-filter-wrap">

                        <!-- Search form -->
                        <div class="form-inline d-flex md-form form-sm col-md-4">
                            <asp:TextBox CssClass="form-control form-control-sm mr-3 w-75" ID="txt_search_business" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="btn_search" runat="server" OnClick="btn_search_Click"><i class="btn_search_finder fas fa-search"></i></asp:LinkButton>
                        </div>
                        <div class="col-md-8 featured-responsive">
                            <div class="detail-filter">
                                <div class="filter-dropdown form-group">
                                    <asp:DropDownList ID="dd_sort" runat="server" CssClass="form-control">
                                        <asp:ListItem Enabled="true" Text="Ordenar por" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Calificación alta" Value="high"></asp:ListItem>
                                        <asp:ListItem Text="Calificación baja" Value="low"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="filter-dropdown form-group">
                                    <asp:DropDownList ID="dd_filter" runat="server" CssClass="form-control">
                                        <asp:ListItem Enabled="true" Text="Filtrar" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Hot dogs" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Otros" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Todos" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row light-bg detail-options-wrap">
                        <asp:ListView ID="listview" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-lg-12 col-xl-6 featured-responsive mt-3 mb-2">
                                    <div class="featured-place-wrap">
                                        <div href="detail.aspx" runat="server" id="btn_card">
                                            <img src="images/business/<%#Eval("image")%>" class="img-business img-fluid" alt="#">
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

                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
