<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Detalles.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

       
     <asp:FormView ID="DetallesProducto" runat="server">
        
            <ItemTemplate>
            <div class="container section">
                <div class="row">
                    <div class="col s12 m6 l6">
                        <img class="materialboxed responsive-img z-depth-2" style="width:100%" src="img/productos/<%# Eval("imagen") %>">
                    </div>
                    <div class="col s12 m6 l6">
                        <div class="section">
                            <h4 class="light blue-text"><%# Eval("nombre") %></h4>
                            <h5 class="blue-grey-text light">Precio: <%# string.Format("{0:C2}", Eval("precio")) %></h5>
                            <h5 class="blue-grey-text light">Stock: <%# Eval("stock") %></h5>
                        </div>
                        <div class="section">
                            <asp:Button ID="agregarProducto" runat="server" CssClass="btn btn-large orange" Text="Agregar a Carrito"  OnClick="agregarProducto_Click" />
                        </div>
                    </div>
                </div>
                <table>
                    <thead>
                      <tr>
                          <th>Descripcion</th>
                      </tr>
                    </thead>

                    <tbody>
                      <tr>
                        <td><%# Eval("descripcion") %></td>
                    </tbody>
                </table>
            </div>

        </ItemTemplate>
    </asp:FormView>

</asp:Content>

