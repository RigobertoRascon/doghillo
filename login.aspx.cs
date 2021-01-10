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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            text_warning.Visible = false;
        }

        protected void login_click(object sender, EventArgs e)
        {
            try
            {
                var new_user = new User()
                {
                    password = txt_password.Text,
                    email = txt_email.Text,
                };                
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
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true);
            }
        }
    }

}