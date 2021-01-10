using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MODEL;
using CONTROLLER;

namespace web_project_v1
{
    public partial class profile : System.Web.UI.Page
    {
        public int login_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["current"] = "profile.aspx";
                login_id = Convert.ToInt32(Session["login_id"]);
                User user = User_controller.search_user_by_id(login_id);
                profile_img.Src = "images/users/" + user.image;
                txt_name.InnerText = user.name;
                txt_email.InnerText = user.email;
                txt_reviews.InnerText = user.Reviews.Count().ToString() + " reseñas realizadas";
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+ ex.Message +"');", true); ;
            }
        }

        protected void btn_send_modal_Click(object sender, EventArgs e)
        {
            User user = User_controller.search_user_by_id(Convert.ToInt32(login_id));

            try
            {

                user.name = txt_name_edit.Text;
                user.email = txt_email_edit.Text;

                var savePath = @"D:\Programming\shcool\web\web_project_v1\images\users\";
                if (FileUpload.HasFile)
                {
                    var fileName = user.name + ".jpg";
                    savePath += fileName;
                    FileUpload.SaveAs(savePath);
                    
                }
                user.image = user.name + ".jpg";
                User_controller.edit_user(user);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Perfil actualizado');", true);
                Page_Load(null,null);

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ; ;
            }
        }

        protected void btn_edit_profile_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "my_modal", "$('#my_modal').modal();", true);
            User user = User_controller.search_user_by_id(login_id);
            txt_name_edit.Text = user.name;
            txt_email_edit.Text = user.email;
        }

        protected void btn_edit_pass_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            User user = User_controller.search_user_by_id(login_id);

        }

        protected void btn_send_pass_Click(object sender, EventArgs e)
        {
            User user = User_controller.search_user_by_id(Convert.ToInt32(login_id));

            try
            {

                if (txt_pass.Text == user.password)
                {
                    if (txt_pass_edit.Text == txt_confirm_pass_edit.Text)
                    {
                        user.password = txt_pass_edit.Text;
                        User_controller.edit_user(user);
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('contraseña actualizada');", true);
                        Page_Load(null,null);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Las contraseñas no coinciden');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Contraseña actual incorrecta');", true);
                }

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ; ;
            }
        }
    }
}