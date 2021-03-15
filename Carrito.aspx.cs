using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Carrito : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Carrito"] == null)
            {
                ShoppingCart carrito = new ShoppingCart();

                GridView1.DataSource = null;
                GridView1.DataBind();
 
            }
            else
            {
                ShoppingCart carrito = (ShoppingCart)Session["Carrito"];

                GridView1.DataSource = carrito.getItems();
                GridView1.DataBind();
                GridView1.FooterRow.Cells[6].Text = "Total:";
                GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Center;
                GridView1.FooterRow.Cells[6].CssClass = "center";
                GridView1.FooterRow.Cells[7].Text = string.Format("{0:C2}", carrito.sumaTotales());
                GridView1.FooterRow.Cells[7].CssClass = "blue white-text";
            }
        
        }
    
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

            ShoppingCart carrito = (ShoppingCart)Session["Carrito"];

            GridViewRow row = GridView1.SelectedRow;
            int id = int.Parse(row.Cells[2].Text);

            string str = ((TextBox)GridView1.SelectedRow.FindControl("GridviewCantidad")).Text;
            carrito.updateItem(id, Convert.ToInt32(str));
            Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnBorrarCarrito_Click(object sender, EventArgs e)
    {
        Session.Remove("Carrito");
        Response.Redirect(Request.Url.AbsoluteUri);

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ShoppingCart carrito = (ShoppingCart)Session["Carrito"];

        TableCell cell = GridView1.Rows[e.RowIndex].Cells[2];

        carrito.deleteItem(int.Parse(cell.Text));
        Response.Redirect(Request.Url.AbsoluteUri);

    }
}