<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        RegisterRoutes(RouteTable.Routes);
    }
   
    static void RegisterRoutes(RouteCollection routes)
    {   routes.MapPageRoute("Productos", "Productos", "~/Productos.aspx");
        routes.MapPageRoute("Nosotros", "Nosotros", "~/Nosotros.aspx");
        routes.MapPageRoute("Ubicacion", "Ubicacion", "~/Ubicacion.aspx");
        routes.MapPageRoute("Suscribirse", "Suscribirse", "~/Suscribirse.aspx");
        routes.MapPageRoute("Contacto", "Contacto", "~/Contacto.aspx");
        routes.MapPageRoute("Carrito", "Carrito", "~/Carrito.aspx");
        routes.MapPageRoute("Suscripcion", "Suscripcion", "~/Suscripcion.aspx");

       // routes.MapPageRoute("Usuarios", "MantenimientoUsuarios", "~/admin/adminUsuarios/MantenimientoUsuario.aspx");
 

    }
       
</script>
