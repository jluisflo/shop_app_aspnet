using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string contraseña;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            using (DBDataContext dbContext = new DBDataContext())
            {
                string id = Session["id"].ToString();
                var consult = from c in dbContext.clientes
                              where c.idCliente.ToString() == id
                              select c;

                var result = consult.First();
                lblNombre.Text = result.nombre;
                lblApellidos.Text = result.apellidos;
                lblUsuario.Text = result.eMail;

                txtNombre.Text = result.nombre;
                txtApellidos.Text = result.apellidos;
            }
        }

    }

    protected void btnOp1_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            string id = Session["id"].ToString();
            cliente clie = dbContext.clientes.Single(c => c.idCliente.ToString() == id);
            Response.Write(txtNombre.Text);
            Response.Write(txtApellidos.Text);
            clie.nombre = txtNombre.Text;
            clie.apellidos = txtApellidos.Text;
            dbContext.SubmitChanges();
            Session["usuario"] = txtNombre.Text;
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnOp2_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            string id = Session["id"].ToString();
            cliente clie = dbContext.clientes.Single(c => c.idCliente.ToString() == id);
            clie.eMail = txtUsuario.Text;
            dbContext.SubmitChanges();
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnOp3_Click(object sender, EventArgs e)
    {
        string id = Session["id"].ToString();
        using (DBDataContext dbContext = new DBDataContext())
        {
            cliente clie = dbContext.clientes.Single(c => c.idCliente.ToString() == id);
            contraseña = clie.contraseña;
        }
            
        if (contraseña == txtContraActual.Text)
        {
            using (DBDataContext dbContext = new DBDataContext())
            {
                cliente clie = dbContext.clientes.Single(c => c.idCliente.ToString() == id);
                clie.contraseña = txtContraNueva.Text;
                dbContext.SubmitChanges();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            lblError.Text = "Error, contraseña actual no coincide con la ingresada!";
            lblError.Visible = true;
            txtContraActual.Text = "";
            txtContraNueva.Text = "";
        }
    }
}