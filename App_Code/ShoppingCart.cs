using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{

    List<Product> productList = new List<Product>();


    public void addItem(int idItem, string nombreItem, int cantidadItem, double precioItem, string imagenItem)
    {
        if (productList.Count() == 0)
        {
            productList.Add(new Product() { id = idItem, nombre = nombreItem, cantidad = cantidadItem, precio = precioItem, imagen = imagenItem, total = cantidadItem * precioItem });
        }
        else
        {
            if (productList.Exists(x => x.id == idItem))
            {
                int index = productList.FindIndex(p => p.id == idItem);
                Product item = productList[index];
                item.cantidad = item.cantidad + 1;
                item.total = item.cantidad * item.precio;
            }
            else
            {
                productList.Add(new Product() { id = idItem, nombre = nombreItem, cantidad = cantidadItem, precio = precioItem, imagen = imagenItem, total = cantidadItem * precioItem });
            }

        }

    }

    public List<Product> getItems()
    {
        return productList;
    }


   public void deleteItem(int idItem)
    {
        var index = productList.Single(p => p.id == idItem);

        productList.Remove(index);
    }

    public void updateItem(int idItem, int cantidadItem)
    {
        int index = productList.FindIndex(p => p.id == idItem);
        Product item = productList[index];
        item.cantidad = cantidadItem;
        item.total = item.cantidad * item.precio;
    }

    public double sumaTotales()
    {
        double suma = 0;
        foreach (Product item in productList)
        {
            double val = Convert.ToDouble(item.total);
            suma += val;

        }
        return suma;
    }
    
    public bool Existe(int idItem)
    {
        if(productList.Exists(x => x.id == idItem))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}