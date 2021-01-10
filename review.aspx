<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="web_project_v1.review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section>
        <div class="container">
            <div class="form-group">
                <label for="exampleFormControlInput1">Título</label>
                <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Example select</label>
                <asp:DropDownList ID="review_rate" runat="server">
                    <asp:ListItem Enabled="true" Text="Selecciona una calificacion" Value="-1"></asp:ListItem>
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
    </section>
</asp:Content>
