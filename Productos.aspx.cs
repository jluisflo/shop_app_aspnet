using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Productos : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["to"] != null)
        {
            cargarCategorias();
            cargarProductos();
           
        }
        else
        {
            PanelConProductos.Visible = false;
            PanelSinProductos.Visible = true;
        }
    }

    void cargarCategorias()
    {
        using (DBDataContext dbContext = new DBDataContext())
        {
            List_Categorias.DataSource = dbContext.categorias.ToList();
            List_Categorias.DataBind();
        }
    }

    void cargarProductos()
    { 
        using (DBDataContext dbContext = new DBDataContext())
        {

            if (Request.QueryString["to"] != null)
            {

                if (Request.QueryString["cat"] != null)
                {
                    if(Request.QueryString["to"] == "Niños")
                    {
                        var consult = from p in dbContext.productos
                                      where p.publico == "Niño" || p.publico == "Niña"
                                      && p.idCategoria == int.Parse(Request.QueryString["cat"])
                                      select p;
                        List_Productos.DataSource = consult.ToList();
                        List_Productos.DataBind();
                    }
                    else
                    {
                        var consult = from p in dbContext.productos
                                      where p.publico == Request.QueryString["to"]
                                      && p.idCategoria == int.Parse(Request.QueryString["cat"])
                                      select p;
                        List_Productos.DataSource = consult.ToList();
                        List_Productos.DataBind();
                    }

                }
                else
                {
                    if (Request.QueryString["to"] == "Niños")
                    {
                        var consult = from p in dbContext.productos
                                      where p.publico == "Niño" || p.publico == "Niña"
                                      select p;
                        List_Productos.DataSource = consult.ToList();
                        List_Productos.DataBind();
                    }
                    else
                    {
                        var consult = from p in dbContext.productos
                                      where p.publico == Request.QueryString["to"]
                                      select p;
                        List_Productos.DataSource = consult.ToList();
                        List_Productos.DataBind();
                    }

                }
            }
          

        }
    }

}

