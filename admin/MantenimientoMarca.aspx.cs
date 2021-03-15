using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

    public partial class admin_adminMarcas_MantenimientoMarca : System.Web.UI.Page
    {

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarDatos();
        }

    }

    void cargarDatos()
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            GridView1.DataSource = dbContext.marcas;
            GridView1.DataBind();
        }
        using (DBDataContext dbContext = new DBDataContext())
        {
            var consult = from p in dbContext.proveedores
                             select new { p.idProveedor, p.nombre };
            txtProveAgregar.DataSource = consult;
            txtProveAgregar.DataTextField = "nombre";
            txtProveAgregar.DataValueField = "idProveedor";
            txtProveAgregar.DataBind();

            txtProveModi.DataSource = consult;
            txtProveModi.DataTextField = "nombre";
            txtProveModi.DataValueField = "idProveedor";
            txtProveModi.DataBind();
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        txtIdModi.Text = row.Cells[1].Text;
        txtMarcaModi.Text = row.Cells[2].Text;
        txtProveModi.Text = row.Cells[3].Text;

        btnModalModificar.Enabled = true;
        btnModalEliminar.Enabled = true;
    }

    protected void btnModalAgregar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalAgregar();", true);
    }

    protected void btnModalEliminar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalEliminar();", true);
    }

    protected void btnModalModificar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalModificar();", true);
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            if(Page.IsPostBack)
            dbContext.agregarMarca(txtMarcaAgregar.Text, int.Parse(txtProveAgregar.SelectedValue));
            ;
        }
        limpiar();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            if (Page.IsPostBack)
                dbContext.modificarMarca(int.Parse(txtIdModi.Text), txtMarcaModi.Text, int.Parse(txtProveModi.SelectedValue));
            ;
        }
        limpiar();

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.eliminarMarca(int.Parse(txtIdModi.Text));
        }
        limpiar();
    }

    void limpiar()
    {
        cargarDatos();
        GridView1.SelectedIndex = -1;
        btnModalModificar.Enabled = false;
        btnModalEliminar.Enabled = false;
        foreach (Control ctrl in Panel1.Controls)
        {
            if (ctrl is TextBox)
            {
                ((TextBox)ctrl).Text = "";
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);//Para evitar doble insercion al refrescar navegador
    }

}
