<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Productos.aspx.cs" Inherits="Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="page-title blue">
        <div class="container">
        <h3 class="light"><%: Title %> 
            <% if( Request.QueryString["to"]!= null) { %>
             para <%= Request.QueryString["to"] %>
            <% } %>
        </h3>
         
        </div>
    </div>
    <div class="container">
        <asp:Panel ID="PanelConProductos" runat="server">

        <div class="row">
            <div class="col s12 m3 l3">
                <div class="collection" runat="server">
                    <a href="Productos.aspx?to=<%= Request.QueryString["to"] %>" class="collection-item">
                            Todos los productos</a>
                <asp:ListView ID="List_Categorias" runat="server">
                     
                    <EmptyDataTemplate>No categorias...</EmptyDataTemplate>
                    <ItemSeparatorTemplate></ItemSeparatorTemplate>
                    <ItemTemplate>
                        <a href='Productos.aspx?to=<%# Request.QueryString["to"] %>&cat=<%# Eval("idCategoria") %>' class="collection-item">
                            <%# Eval("nombre") %> </a>
                            
                    </ItemTemplate>
                    <LayoutTemplate>
             
                            <div ID="itemPlaceholder" runat="server" />
                       
                    </LayoutTemplate>
                </asp:ListView>
                </div>
            </div>
            <div class="col s12 m9 l9">
               

                <asp:ListView ID="List_Productos" runat="server">
                    <EmptyItemTemplate>
                        <div class="alert alert-warning">No hay productos.</div>
                    </EmptyItemTemplate>
                     <ItemSeparatorTemplate></ItemSeparatorTemplate>
                    <ItemTemplate>
                        <div class="col s12 m4 l4">

                            <div class="card">
                                <span class="price"><%# string.Format("{0:C2}", Eval("precio")) %></span>
                                <div class="card-image waves-effect waves-block waves-light">
                                    <a href="Detalles.aspx?id=<%# Eval("idProducto") %>">
                                        <img class="activator" src="img/productos/<%# Eval("imagen") %>">
                                    </a>
                                </div>
                                <div class="card-content">
                                    <span class="card-title grey-text text-darken-4"><%# Eval("nombre") %></span>
                                </div>
                                <div class="card-action center-align">
                                    <a href="Detalles.aspx?id=<%# Eval("idProducto") %>" class="center-align">Ver Detalles</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="row" runat="server">
                            <div ID="itemPlaceholder" runat="server"></div>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </asp:Panel>
    
     <asp:Panel ID="PanelSinProductos" Visible="false" runat="server">
         <div class="container">
             <div class="row">
 
                 <div class="col s12 m4 l4">
                     
                         <a href="Productos.aspx?to=Hombre"> 
                            <div class="para-item">
                                <div class="filtro"></div>
                                 <h3 class="center white-text light" style="width:100%; z-index:4;">Hombre</h3>
                            <img src="img/men.jpg">
                            </div>
                        </a>
                </div> 
                <div class="col s12 m4 l4">
                     
                         <a href="Productos.aspx?to=Mujer"> 
                            <div class="para-item">
                                <div class="filtro"></div>
                                 <h3 class="center white-text light" style="width:100%; z-index:4;">Mujer</h3>
                            <img src="img/woman.jpg">
                            </div>
                        </a>
                     
                 </div>
                 <div class="col s12 m4 l4">
                     
                         <a href="Productos.aspx?to=Niños"> 
                            <div class="para-item">
                                <div class="filtro"></div>
                                 <h3 class="center white-text light" style="width:100%; z-index:4;">Niños</h3>
                            <img src="img/kid.jpg">
                            </div>
                        </a>
                    </div> 
                 </div>

         </div>
         






        

     </asp:Panel>
    </div>


</asp:Content>

