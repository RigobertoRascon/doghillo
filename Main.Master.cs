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
    public partial class Main : System.Web.UI.MasterPage
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            var login_id = Session["login_id"];
            User user = User_controller.search_user_by_id(Convert.ToInt32(login_id));
           

            if (Session["login_id"] == null)
            {

                btn_username.Visible = false;
                btn_login.Visible = true;
            }
            else
            {
                btn_login.Visible = false;
                btn_username.Visible = true;
                btn_username.InnerText = user.name;
                admin.Visible = (int)user.id_role == 1;

            }

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["login_id"] = null;
            var current = Session["current"];
            if (current.ToString() == "profile.aspx")
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Redirect(current.ToString());
            }
            
        }

        protected void admin_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("admin.aspx");
        }

        protected void view_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}