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
    public partial class Buss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["current"] = "buss.aspx";
            gvContacto.DataSource = Business_controller.search_business_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();



        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            gvContacto.DataSource = Business_controller.search_business_by_criteria(txtBuscarContacto.Text);
            gvContacto.DataBind();

        }

        protected void btn_borrar_click(object sender, CommandEventArgs e)
        {

            var id_business_to_remove = Convert.ToInt32(e.CommandArgument);
            Business_controller.remove_business(id_business_to_remove);
            Page_Load(null, null);



        }

        protected void btn_add_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "my_modal", "$('#my_modal_insert').modal();", true);

        }



        protected void btn_send_modal_Click(object sender, EventArgs e)
        {
            var id_business_to_edit = Session["id_business_to_edit"];
            MODEL.Business business = Business_controller.search_business_by_id(Convert.ToInt32(id_business_to_edit));

            try
            {

                business.name = txt_name.Text;
                business.address = txt_address.Text;
                business.number = txt_number.Text;
                business.hours = txt_hours.Text;
                business.rating = Convert.ToDecimal(txt_rating.Text);
                business.id_categoria = Convert.ToInt32(business_type.SelectedValue);
                Business_controller.edit_business(business);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Modificacion realizada');", true);
                Page_Load(null, null);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btn_editar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "my_modal", "$('#my_modal').modal();", true);
                var id_business_to_edit = Convert.ToInt32(e.CommandArgument);
                Business_controller.search_business_by_id(id_business_to_edit);
                Session["id_business_to_edit"] = id_business_to_edit;
                MODEL.Business business = Business_controller.search_business_by_id(Convert.ToInt32(id_business_to_edit));
                txt_name.Text = business.name;
                txt_address.Text = business.address;
                txt_number.Text = business.number;
                txt_hours.Text = business.hours;
                business_type.SelectedValue = business.id_categoria.ToString();
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
                Business business = new Business();
                business.name = txt_name_insert.Text;
                business.address = txt_address_insert.Text;
                business.number = txt_number_insert.Text;
                business.hours = txt_hours_insert.Text;
                business.rating = Convert.ToDecimal(txt_rating_insert.Text);
                business.id_categoria = Convert.ToInt32(business_type_insert.SelectedValue);
                business.image = "default.jpg";
                Business_controller.insert_business(business);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Nuevo usuario agregado');", true);
                Page_Load(null, null);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
