using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    int id;
    string nombre;
    int cantidad= 1;
    double precio;
    string imagen;

    protected void Page_Load(object sender, EventArgs e)
    {
        using (DBDataContext dbContext = new DBDataContext())
        {

            if (Request.QueryString["id"] != null)
            {
                var consult = from p in dbContext.productos
                              where p.idProducto == Int32.Parse(Request.QueryString["id"])
                              select p;

                DetallesProducto.DataSource = consult.ToList();
                DetallesProducto.DataBind();

                var producto = consult.First();
                id = producto.idProducto;
                nombre = producto.nombre;
                precio = Convert.ToDouble(producto.precio);
                imagen = producto.imagen;
            }
            else
            {
                Response.Redirect("~/Productos.aspx");
            }
        }
    }

    protected void agregarProducto_Click(object sender, EventArgs e)
    {
        if (Session["Carrito"] == null)
        {
            ShoppingCart carrito = new ShoppingCart();

            carrito.addItem(id, nombre, cantidad, precio, imagen);

            Session["Carrito"] = carrito;
        }
        else
        {
            ShoppingCart carrito = (ShoppingCart)Session["Carrito"];

            carrito.addItem(id, nombre, cantidad, precio, imagen);

            Session["Carrito"] = carrito;
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void eliminarProducto_Click(object sender, EventArgs e)
    {
        
    }
}
 