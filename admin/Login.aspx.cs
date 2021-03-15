using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (DBDataContext context = new DBDataContext())
        {
            var query = from u in context.usuarios
                    where u.usuario1 == txtUsuario.Text
                    && u.contraseña == txtPass.Text
                    select u;
            if (query.Any())
            {
                var result = query.First();
                FormsAuthentication.RedirectFromLoginPage(result.nombre, false);
            }
            else
            {
                lblError.Visible = true;
            }
        }

    }
      

}