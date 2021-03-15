using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    public object MantenimientoProducto { get; private set; }

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
            GridView1.DataSource = dbContext.productos;
            GridView1.DataBind();
     
        }

        using (DBDataContext dbContext = new DBDataContext())
        {
            var consult = from p in dbContext.categorias
                          select new { p.idCategoria, p.nombre };

            listCategoriaAgregar.DataSource = consult;
            listCategoriaAgregar.DataTextField = "nombre";
            listCategoriaAgregar.DataValueField = "idCategoria";
            listCategoriaAgregar.DataBind();
            listCategoriaModi.DataSource = consult;
            listCategoriaModi.DataTextField = "nombre";
            listCategoriaModi.DataValueField = "idCategoria";
            listCategoriaModi.DataBind();
        }

        using (DBDataContext dbContext = new DBDataContext())
        {
            var consult = from p in dbContext.marcas
                          select new { p.idMarca, p.nombre };

            listMarcaAgregar.DataSource = consult;
            listMarcaAgregar.DataTextField = "nombre";
            listMarcaAgregar.DataValueField = "idMarca";
            listMarcaAgregar.DataBind();
            listMarcaModi.DataSource = consult;
            listMarcaModi.DataTextField = "nombre";
            listMarcaModi.DataValueField = "idMarca";
            listMarcaModi.DataBind();
        }


    }

   


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView1.SelectedRow;
        txtidProductosModi.Text = row.Cells[1].Text;
        txtProductoModi.Text = row.Cells[2].Text;
        txtDescripcionModi.Text = row.Cells[3].Text;
        listCategoriaModi.SelectedValue = row.Cells[4].Text;
        listMarcaModi.SelectedValue = row.Cells[5].Text;
        txtModeloModi.Text = row.Cells[6].Text;
        listPublicoModi.Text = row.Cells[7].Text;
        txtPrecioModi.Text = (row.Cells[8].Text).Replace("$","");
        txtStockModi.Text = row.Cells[9].Text;
        listPublicoModi.SelectedValue = row.Cells[10].Text;
        ImageModi.ImageUrl= string.Format("~/img/productos/{0}", row.Cells[9].Text);
         
        lblIdelimininar.Text = row.Cells[1].Text;

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
            if (Page.IsPostBack)
            {
                string fileName = "";
                if (FileUploadAgregar.HasFile)
                {
                    fileName = Path.GetFileName(FileUploadAgregar.PostedFile.FileName);
                    FileUploadAgregar.PostedFile.SaveAs(Server.MapPath("~/img/productos/") + fileName);
                }
             
                dbContext.agregarProducto(txtProductoAgregar.Text, txtDescripcionsAgregar.Text, int.Parse(listCategoriaAgregar.SelectedValue), int.Parse(listMarcaAgregar.SelectedValue), txtModeloAgregar.Text, Convert.ToDecimal(txtPrecioAgregar.Text), int.Parse(txtStockAgregar.Text), listPublicoAgregar.SelectedValue, fileName);
            }
        }

        limpiar();
    }



    protected void btnModificar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            if (Page.IsPostBack)
            {
                string fileName = "";
                if (FileUploadModi.HasFile)
                {
                    fileName = Path.GetFileName(FileUploadModi.PostedFile.FileName);
                    FileUploadModi.PostedFile.SaveAs(Server.MapPath("~/img/productos/") + fileName);
                }
                else
                {
                    string url = ImageModi.ImageUrl;
                    fileName = Path.GetFileName(url);
                }

                dbContext.modificarProducto(int.Parse(txtidProductosModi.Text), txtProductoModi.Text, txtDescripcionModi.Text, int.Parse(listCategoriaModi.SelectedValue), int.Parse(listMarcaModi.SelectedValue), txtModeloModi.Text, Convert.ToDecimal(txtPrecioModi.Text), int.Parse(txtStockModi.Text), listPublicoModi.SelectedValue, fileName);

            }
        }
        limpiar();

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            dbContext.eliminarProducto(int.Parse(txtidProductosModi.Text));
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



    protected void ImageModi_Click(object sender, ImageClickEventArgs e)
    {
      //  FileUploadModi.c
    }

    protected void FileUploadModi_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('hola');", true);

    }

}
