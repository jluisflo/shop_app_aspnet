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
             var consult = from c in dbContext.clientes
                           where c.eMail == txtMail.Text
                           && c.contraseña == txtPass.Text
                           select new { c.idCliente, c.nombre };

             if (consult.Any())
             {
                var result = consult.First();
                Session["id"] = result.idCliente;
                Session["usuario"] = result.nombre;
               
                Response.Redirect("Default.aspx");
            }
             else
             {
                LabelError.Visible = true;
             }
         }
        
    }
}