using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CONTROLLER;
using MODEL;

namespace web_project_v1
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["current"] = "users.aspx";
            gvContacto.DataSource = User_controller.search_user_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();



        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            gvContacto.DataSource = User_controller.search_user_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();

        }
        protected void btn_edit_click(object sender, CommandEventArgs e)
        {
           


        }
        protected void btn_borrar_click(object sender, CommandEventArgs e)
        {

            var id_user_to_remove = Convert.ToInt32(e.CommandArgument);
            User_controller.remove_user(id_user_to_remove);
            Page_Load(null, null);



        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "my_modal", "$('#myModal').modal();", true);

        }
 


        protected void btn_send_modal_Click(object sender, EventArgs e)
        {
            var id_user_to_edit = Session["id_user_to_edit"];
            User user = User_controller.search_user_by_id(Convert.ToInt32(id_user_to_edit));

            try
            {

                if (txt_password.Text == txt_confirm_password.Text)
                {
                    user.name = txt_name.Text;
                    user.email = txt_email.Text;
                    user.password = txt_password.Text;
                    user.id_role = Convert.ToInt32(user_role.SelectedValue);
                    User_controller.edit_user(user);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Modificacion realizada');", true);
                    Response.Redirect("Users.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Las contraseñas no coinciden');", true);
                }

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
        }

        protected void btn_editar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "my_modal", "$('#my_modal').modal();", true);
                var id_user_to_edit = Convert.ToInt32(e.CommandArgument);
                User_controller.search_user_by_id(id_user_to_edit);
                Session["id_user_to_edit"] = id_user_to_edit;
                User user = User_controller.search_user_by_id(Convert.ToInt32(id_user_to_edit));
                txt_name.Text = user.name;
                txt_email.Text = user.email;
                txt_password.Text = user.password;
                txt_confirm_password.Text = user.password;
                user_role.SelectedValue = user.id_role.ToString();
            }
            catch (Exception ex)
            {

                throw ex;
            }



        }

        protected void btn_send_inser_Click(object sender, EventArgs e)
        {
            try
            {
                User user = new User();
                user.name = txt_name_insert.Text;
                user.email = txt_email_insert.Text;
                user.password = txt_password_insert.Text;
                user.id_role = Convert.ToInt32(user_role_insert.SelectedValue);
                User_controller.insert_user(user);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Nuevo usuario agregado');", true);
                Response.Redirect("Users.aspx"); 
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}