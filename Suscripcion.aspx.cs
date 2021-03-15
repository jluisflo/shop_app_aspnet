using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Contacto : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        using (DBDataContext db = new DBDataContext())
        {
        db.agregarSuscriptor(TextBox1.Text, TextBox2.Text);
  
                lblexito.Visible = true;
                TextBox1.Text = "";
                TextBox2.Text = "";
        Response.Redirect(Request.Url.AbsoluteUri);

        }

    }
}