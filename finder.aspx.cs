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
    public partial class finder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            try
            {
                Session["current"] = "finder.aspx";
                var place = Session["place"];
                set_place(place.ToString());
                var business = Business_controller.search_business_by_criteria(place.ToString());
                set_dataSource(business);


            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }

           


        }

        private void set_dataSource(List<Business> business)
        {
            listview.DataSource = business;
            listview.DataBind();

            var how_many_Businesses = business.Count();

            if (how_many_Businesses == 1)
            {
                lbl_how_many.InnerText = business.Count().ToString() + " Resultado encontrados en ";
            }
            else
            {
                lbl_how_many.InnerText = business.Count().ToString() + " Resultados encontrado en ";

            }
        }

        private void set_place(String place)
        {
            try
            {
                lbl_address.InnerText = place;
                
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                var place = Session["place"];
                var business = Business_controller.search_business_by_criteria(txt_search_business.Text, dd_filter.SelectedValue, place.ToString());
                
                if (dd_sort.SelectedValue == "high")
                {
                    var sort_by = business.OrderByDescending(bu => bu.rating);
                    listview.DataSource = sort_by;
                    listview.DataBind();
                }
                else
                {
                    var sort_by = business.OrderBy(bu => bu.rating);
                    listview.DataSource = sort_by;
                    listview.DataBind();

                }
                
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true); ;
            }
        }
        protected void btn_view_details_Command(object sender, CommandEventArgs e)
        {
            var id_business = Convert.ToInt32(e.CommandArgument);
            Session["id_business"] = id_business;
            Response.Redirect("detail.aspx");
        }
    }
}