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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
                Session["current"] = "admin.aspx";
                var login_id = Session["login_id"];
                var current = Session["current"];
                User user = User_controller.search_user_by_id(Convert.ToInt32(login_id));
                if (Session["login_id"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    if ((int)user.id_role != 1)
                    {
                        Response.Redirect(current.ToString());
                    }
                }
                
                
                lbl_login.InnerText = "Logged in as: " + user.name;
            }
			catch (Exception ex)
			{

				throw ex;
			}
        }
    }
}