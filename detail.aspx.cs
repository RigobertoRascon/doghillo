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
    public partial class detail1 : System.Web.UI.Page
    {
        public int login_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            login_id = Convert.ToInt32(Session["login_id"]);

            Session["current"] = "detail.aspx";
            var id_business = Session["id_business"];
            Business business = Business_controller.search_business_by_id(Convert.ToInt32(id_business));
            lbl_name.InnerText = business.name;
            lbl_rating.InnerText = business.rating.ToString();
            lbl_address.InnerText = business.address;
            lbl_hours.InnerText = business.hours;
            lbl_phone.InnerText = business.number;
            business_map.Src = business.map_string;
            btn_map.HRef = business.map_url;

            var reviews = Review_controller.search_review_by_criteria(id_business.ToString());
            review_content.DataSource = reviews.OrderByDescending(review => review.Likes.Count());

            var how_many_reviews = reviews.Count();

            if (how_many_reviews == 1)
            {
                lbl_reviews.InnerText = reviews.Count().ToString() + " Reseña";
                lbl_reviews1.InnerText = reviews.Count().ToString() + " Reseña";
                
            }
            else
            {
                lbl_reviews.InnerText = reviews.Count().ToString() + " Reseñas";
                lbl_reviews1.InnerText = reviews.Count().ToString() + " Reseñas";

            }
            review_content.DataBind();
        }

        protected void btn_write_review_Click(object sender, EventArgs e)
        {
             
            if (Session["login_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);

            }


        }

        protected void btn_send_modal_Click(object sender, EventArgs e)
        {
            try
            {
                send_review();
                var id_business = Session["id_business"];
                review_content.DataSource = Review_controller.search_review_by_criteria(id_business.ToString());
                review_content.DataBind();
                Response.Redirect("detail.aspx");
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+ ex.Message +"');", true); ;
            }


        }

        protected void send_review()
        {
            try
            {
                Session["current"] = "detail.aspx";
                Review new_review = new Review();
                DateTime now = DateTime.Now;
                new_review.id_business = Convert.ToInt32(Session["id_business"]);
                new_review.id_user = Convert.ToInt32(Session["login_id"]);
                new_review.title = txt_title.Text;
                new_review.text = txt_message.Text;
                new_review.score = float.Parse(review_rate.SelectedValue);
                new_review.date = now.ToShortDateString();
                Review_controller.add_review(new_review);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Reseña agregada');", true);
            }
            catch ( Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
            
        }

        protected void btn_remove_review_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var review_to_remove = Review_controller.search_review_by_id(Convert.ToInt32(e.CommandArgument));
                Review_controller.remove_review(review_to_remove);
                Page_Load(null, null);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Reseña eliminada');", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
        }
        protected void like_btn_Command(object sender, CommandEventArgs e)
        {
            try
            {
                if (Session["login_id"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    var like = new Like();
                    like.id_user = Convert.ToInt32(Session["login_id"]);
                    like.id_review = Convert.ToInt32(e.CommandArgument);
                    var like_exists = Like_controller.search_like_by_id_user(like.id_user, like.id_review);

                    if (like_exists != null)
                    {
                        Like_controller.remove_like(like_exists.id_like);
                    }
                    else
                    {
                        Like_controller.add_like(like);

                    }

                    Page_Load(null, null);
                }
                
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }

        }
    }
}