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
    public partial class index : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["current"] = "index.aspx";
                if (!IsPostBack)
                {
                    var login_id = Session["login_id"];
                    User user = User_controller.search_user_by_id(Convert.ToInt32(login_id));

                    if (user == null)
                    {

                        btn_username.Visible = false;
                        btn_login.Visible = true;
                    }
                    else
                    {
                        btn_login.Visible = false;
                        btn_username.Visible = true;
                        btn_username.InnerText = user.name;
                    }
                }
                var business = Business_controller.search_business_by_criteria("Hermosillo, Son.");
                var most_popular = business.OrderByDescending(bu => bu.rating).Take(3);
                listview.DataSource = most_popular;
                listview.DataBind();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
            
        }
        protected void logout_click(object sender, EventArgs e)
        {
            Session["login_id"] = null;
            Response.Redirect("index.aspx");
        }

        protected void btn_search_click(object sender, EventArgs e)
        {
           
            if (!string.IsNullOrEmpty(search_input.Text))
            {
                Session["place"] = search_input.Text;
                Response.Redirect("finder.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No ha ingresado ninguna direccion');", true);
            }
            
        }

        protected void btn_view_details_Command(object sender, CommandEventArgs e)
        {
            var id_business = Convert.ToInt32(e.CommandArgument);
            Session["id_business"] = id_business;
            Response.Redirect("detail.aspx");
        }

        protected void view_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}