<%@ Page Title="Mi carrito" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeFile="Carrito.aspx.cs" Inherits="Carrito" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-title blue">
        <div class="container">
        <h2 class="light"><%: Title %></h2>
        </div>
    </div>

    <div class="container content-page">
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowDeleting="GridView1_RowDeleting" ShowFooter="true"
            autogeneratecolumns="false"
            emptydatatext="No ha seleccionado productos a su carrito.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ControlStyle-CssClass="red-text" ControlStyle-Width="20px" />
                <asp:CommandField ShowSelectButton="True" SelectText="Actualizar" ControlStyle-CssClass="blue-text text-darken-3" ControlStyle-Width="30px"  />
                <asp:boundfield datafield="id" headertext="Codigo"/>
                <asp:ImageField DataImageUrlField="imagen" DataImageUrlFormatString="~/img/productos/{0}" ControlStyle-Width="60px"  HeaderText="Imagen">
                </asp:ImageField>
                <asp:boundfield datafield="nombre" headertext="Producto"/>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:TextBox ID="GridviewCantidad" Text='<%# Eval("cantidad") %>' min="1" TextMode="Number" runat="server" Width="100px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:boundfield datafield="precio" DataFormatString="{0:C2}"  headertext="Precio"/>
                <asp:boundfield datafield="total" DataFormatString="{0:C2}"  headertext="Total"/>
               
            </Columns>
        </asp:GridView>
 
        <div class="section">
            <div class="center-align">
                <asp:Button ID="btnBorrarCarrito" CssClass="btn orange waves-effect" runat="server" Text="Borrar carrito " OnClick="btnBorrarCarrito_Click" />
            </div>
        </div>
    </div>
    
</asp:Content>