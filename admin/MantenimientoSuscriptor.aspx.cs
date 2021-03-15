using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

    public partial class admin_adminSuscriptores_MantenimientoSuscriptor : System.Web.UI.Page
    {

    protected void Page_Load(object sender, EventArgs e)
    {
        cargarDatos();

    }

    void cargarDatos()
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            GridView1.DataSource = dbContext.suscriptores;
            GridView1.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        txtIdModi.Text = row.Cells[1].Text;
        txtSuscriptorModi.Text = row.Cells[2].Text;
        txtEmailModi.Text = row.Cells[3].Text;

        lblIdelimininar.Text = row.Cells[1].Text;
        lblSuscriptorElimininar.Text = row.Cells[2].Text;
        lblEmailElimininar.Text = row.Cells[3].Text;

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
            dbContext.agregarSuscriptor(txtSuscriptorAgregar.Text, txtEmailAgregar.Text);
        }
        limpiar();
        
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.modificarSuscriptor(int.Parse(txtIdModi.Text), txtSuscriptorModi.Text, txtEmailModi.Text);
        }
        limpiar();

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.eliminarSuscriptor(int.Parse(txtIdModi.Text));
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
