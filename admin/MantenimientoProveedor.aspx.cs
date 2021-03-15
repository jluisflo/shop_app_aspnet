using System;
using System.Collections.Generic;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_MantenimientoProveedor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargarDatos();
    }

    void cargarDatos()
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            GridView1.DataSource = dbContext.proveedores;
            GridView1.DataBind();
        }
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
            dbContext.agregarProveedor(txtNombreAgregar.Text,txtTelefonoAgregar.Text, txtEmailAgregar.Text, txtDireccionAgregar.Text);
        }
        limpiar();
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.modificarProveedor(int.Parse(txtIdModi.Text), txtNombreModi.Text, txtTelefonoModi.Text, txtEmailModi.Text, txtDireccionModi.Text);

        }
        limpiar();

    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.eliminarProveedor(int.Parse(txtIdModi.Text));
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        txtIdModi.Text = row.Cells[1].Text;
        txtNombreModi.Text = row.Cells[2].Text;
        txtTelefonoModi.Text = row.Cells[3].Text;
        txtEmailModi.Text = row.Cells[4].Text;
        txtDireccionModi.Text = row.Cells[5].Text;

        lblProveedorElimininar.Text = row.Cells[2].Text;
        lblTelefonoEliminar.Text = row.Cells[3].Text;
        lblemailEliminar.Text = row.Cells[4].Text;
        lbldireccionEliminar.Text = row.Cells[5].Text;


        btnModalModificar.Enabled = true;
        btnModalEliminar.Enabled = true;
    }
}