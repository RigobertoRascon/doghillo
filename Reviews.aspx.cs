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
    public partial class Reviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["current"] = "buss.aspx";
            gvContacto.DataSource = Review_controller.search_review_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();



        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            gvContacto.DataSource = Review_controller.search_review_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();

        }

        protected void btn_borrar_click(object sender, CommandEventArgs e)
        {

            var id_review_to_remove = Convert.ToInt32(e.CommandArgument);
            var review = Review_controller.search_review_by_id(Convert.ToInt32(id_review_to_remove));
            Review_controller.remove_review(review);
            Page_Load(null, null);



        }
    }
}