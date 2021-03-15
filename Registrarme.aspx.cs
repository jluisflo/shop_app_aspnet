using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["usuario"] != null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {

            dbContext.agregarCliente(txtNombre.Text, txtApellido.Text, txtGenero.Text, DateTime.Parse(txtNacimiento.Text), txtMail.Text, txtPass.Text);

            var id = from c in dbContext.clientes
                    orderby c.idCliente descending
                    select c;

            Session["id"] = id.First().idCliente.ToString();
            Session["usuario"] = txtNombre.Text;
            Response.Redirect("Default.aspx");
        }

    }
 
        
}