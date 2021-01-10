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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msg_success.Visible = false;
            msg_warning.Visible = false;
            policy_checkbox.Checked = true;
        }

        protected void register_click(object sender, EventArgs e)
        {
            try
            {
                var new_user = new User()
                {
                    name = txt_username.Text,
                    email = txt_email.Text,
                    password = txt_password.Text,
                    id_role = 0,
                    image = "user-default-m.jpg",
                };
                if (txt_password.Text == txt_password_confirm.Text)
                {
                    if (policy_checkbox.Checked == true)
                    {
                        User_controller.insert_user(new_user);
                        msg_success.Visible = true;
                        msg_warning.Visible = false;
                        var user = User_controller.login(new_user);
                        Session["login_id"] = user.id_user;
                        var current = Session["current"];
                        if (current != null)
                        {
                            Response.Redirect(current.ToString());
                        }
                        else
                        {
                            Response.Redirect("index.aspx");
                        }
                    }
                    else
                    {
                        msg_warning.InnerText = "Se necesitan aceptar los terminos y condiciones";
                        msg_warning.Visible = true;
                    }

                }
                else
                {
                    msg_warning.Visible = true;
                }
                
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true);
            }
        }
    }
}