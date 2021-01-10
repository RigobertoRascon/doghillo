<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="web_project_v1.detail1" %>
<%@ Import Namespace="MODEL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <section class="reserve-block mt-5">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <h5 id="lbl_name" runat="server">business name</h5>
                    <br />
                    <p class="reserve-description">Innovative cooking, paired with fine wines in a modern setting.</p>
                </div>
                <div class="col-md-6">
                    <div class="reserve-seat-block">
                        <div class="reserve-rating">
                            <span id="lbl_rating" runat="server">business rating</span>
                        </div>
                        <div class="review-btn">
                            <asp:LinkButton runat="server" ID="btn_write_review" CssClass="btn btn-outline-danger" Text="Escribir reseña" OnClick="btn_write_review_Click"></asp:LinkButton>

                            <span id="lbl_reviews1" runat="server">17 reseñas</span>
                        </div>
                        <!--
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                                <a href="#" class="btn btn-danger"></a>
                            </div>
                        </div>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END RESERVE A SEAT -->
    <!--============================= BOOKING DETAILS =============================-->
    <section class="light-bg booking-details_wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-8 responsive-wrap">
                    <div class="booking-checkbox_wrap mt-4">

                        <h5 id="lbl_reviews" runat="server" class="mb-3">34 Reviews</h5>
                        <hr>
                        <br />
                        <asp:ListView ID="review_content" runat="server">
                            <ItemTemplate>
                                <div class="customer-review_wrap mb-4">
                                    <div class="customer-img">
                                        <img src="images/users/<%#Eval("User.image")%>" class="img-fluid" alt="#" height="81" width="81">
                                        <p><%#Eval("User.name")%></p>
                                        <span><%#Eval("User.Reviews.Count")%> Reseñas</span>
                                    </div>
                                    <div class="customer-content-wrap">
                                        <div class="customer-content">
                                            <div class="customer-review">
                                                <h6><%#Eval("title")%></h6>
                                                <p><%#Eval("date")%></p>
                                            </div>
                                            <div class="customer-rating"><%#Eval("score")%></div>
                                        </div>
                                        <p class="customer-text text-justify">
                                            <%#Eval("text")%>
                                        </p>
                                        </p>
                                        <!--
                                        <ul>
                                            <li>
                                                <img src="images/<%#Eval("image")%>" class="img-fluid" alt="#"></li>
                                            <li>
                                                <img src="images/<%#Eval("image")%>" class="img-fluid" alt="#"></li>
                                            <li>
                                                <img src="images/<%#Eval("image")%>" class="img-fluid" alt="#"></li>
                                        </ul>
                                            -->
                                        
                                        <span><%#Eval("Likes.Count") %> personas marcaron esta reseña como útil</span>
                                        <asp:LinkButton runat="server" CssClass='<%# ((HashSet<Like>)Eval("Likes")).Any(like => like.id_user == login_id) ? "btn-like-selected" : "" %>' CommandArgument='<%#Eval("id_review")%>' ID="like_btn" OnCommand="like_btn_Command"><span class="ml-auto"><i class="fas fa-thumbs-up m-0"></i></span></asp:LinkButton><span> 
                                        <asp:LinkButton ID="btn_remove_review" runat="server" Visible = '<%# (int)Eval("id_user") == login_id %>' CommandArgument='<%#Eval("id_review")%>' OnCommand="btn_remove_review_Command"><i class="fa fa-trash"></i></asp:LinkButton></span>
                                        
                                    </div>
                                    <hr>
                                        <br />
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                        <hr>
                    </div>
                </div>
                <div class="col-md-4 responsive-wrap">
                    <div class="contact-info">

                        <iframe id="business_map" class="map-frame img-fluid" src="" frameborder="0" style="border:0;" allowfullscreen="false" aria-hidden="false" tabindex="0" runat="server"></iframe>
                        <div class="address">
                            <span class="icon-location-pin"></span>
                            <p id="lbl_address" runat="server">business address</p>
                        </div>
                        <div class="address">
                            <span class="icon-screen-smartphone"></span>
                            <p id="lbl_phone" runat="server">business phone</p>
                        </div>
                        <div class="address">
                            <span class="icon-clock"></span>
                            <p id="lbl_hours" runat="server">business hours</p>
                        </div>
                        <a href="#" id="btn_map" runat="server" class="btn btn-danger btn-contact">VER UBICACIÓN</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Modal -->
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Agregar reseña</h5>
                    <button id="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container-fluid">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Título</label>
                            <br />
                            <asp:TextBox ID="txt_title" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Selecciona una calificacion</label>
                            <br />
                            <asp:DropDownList ID="review_rate" runat="server" CssClass="form-control">
                                <asp:ListItem Enabled="true" Text="Selecciona una calificacion" Value="9"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="1.5" Value="1.5"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="2.5" Value="2.5"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="3.5" Value="3.5"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="4.5" Value="4.5"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="5.5" Value="5.5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="6.5" Value="6.5"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem Text="7.5" Value="7.5"></asp:ListItem>
                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem Text="8.5" Value="8.5"></asp:ListItem>
                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem Text="9.5" Value="9.5"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Reseña</label>
                            <asp:TextBox CssClass="form-control" ID="txt_message" runat="server" TextMode="MultiLine" Rows="6"></asp:TextBox>
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
</asp:Content>
