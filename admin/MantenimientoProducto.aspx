<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administrador.master" AutoEventWireup="true" CodeFile="MantenimientoProducto.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            Productos Existentes  
        </div>
        <div class="panel-body">

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%"
                 AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" >
                    <ControlStyle CssClass="btn btn-info btn-xs" ForeColor="White" />
                    </asp:CommandField>
                    <asp:BoundField DataField="idProducto" HeaderText="Codigo" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="idCategoria" HeaderText="Codigo categoria" />
                    <asp:BoundField DataField="idMarca" HeaderText="Codigo marca" />
                    <asp:BoundField DataField="modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="publico" HeaderText="Publico" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="stock" HeaderText="Stock" />
                    <asp:BoundField DataField="imagen" HeaderText="Imagen" />


                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#FFECB3" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </div>
        <div class="panel-footer">
            <asp:Button ID="btnModalNuevo" OnClick="btnModalAgregar_Click" runat="server" cssClass="btn btn-primary" Text="Nuevo" />
            <a href="reportes/ReportePro.aspx" class="btn btn-default" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Generar Reporte</a>
            <asp:Button ID="btnModalModificar" OnClick="btnModalModificar_Click" runat="server" cssClass="btn btn-warning pull-right" Text="Modificar" Enabled="False" />
            <asp:Button ID="btnModalEliminar" OnClick="btnModalEliminar_Click" runat="server" cssClass="btn btn-danger pull-right" Text="Eliminar" Enabled="False" />
        </div>
    </div>

         <div class="modal fade" id="ModalAgregar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Agregar registro</h4>
                  </div>
                  <div class="modal-body">

                        <div class="form-group"> 
                            <asp:Label ID="Label12" runat="server" Text="Producto:"></asp:Label><br />
                            <asp:TextBox ID="txtProductoAgregar" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtProductoAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator3" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtProductoAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ0-9\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label13" runat="server" Text="Descripcion:"></asp:Label><br />
                            <asp:TextBox ID="txtDescripcionsAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtDescripcionsAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                       
                        <div class="form-group"> 
                            <asp:Label ID="Label14" runat="server" Text="Categoria:"></asp:Label><br />
                            <asp:DropDownList ID="listCategoriaAgregar" CssClass="form-control" runat="server">
                            </asp:DropDownList>                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator7" runat="server" ErrorMessage="No hay datos" CssClass="alert alert-danger" ControlToValidate="listCategoriaAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label7" runat="server" Text="Marca:"></asp:Label><br />
                            <asp:DropDownList ID="listMarcaAgregar" CssClass="form-control" runat="server">
                            </asp:DropDownList>                              
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator6" runat="server"  CssClass="alert alert-danger" ErrorMessage="No hay datos" ControlToValidate="listMarcaAgregar">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group"> 
                            <asp:Label ID="Label8" runat="server" Text="Modelo:"></asp:Label><br />
                            <asp:TextBox ID="txtModeloAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtModeloAgregar">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group"> 
                            <asp:Label ID="Label17" runat="server" Text="Publico:"></asp:Label><br />
                            <asp:DropDownList ID="listPublicoAgregar" CssClass="form-control" runat="server">
                                <asp:ListItem Text="" Value="" Selected="True" />
                                <asp:ListItem Text="Mujer" Value="Mujer" />
                                <asp:ListItem Text="Hombre" Value="Hombre" />
                                <asp:ListItem Text="Niña" Value="Niña" />
                                <asp:ListItem Text="Niño" Value="Niño" />
                            </asp:DropDownList>                              
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator16" runat="server"  CssClass="alert alert-danger" ErrorMessage="Campo requerido" ControlToValidate="listPublicoAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                      
                        <div class="form-group"> 
                            <asp:Label ID="Label9" runat="server" Text="Precio:"></asp:Label><br />
                            <asp:TextBox ID="txtPrecioAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtPrecioAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Error, verifique."  CssClass="alert alert-danger" ControlToValidate="txtPrecioAgregar" ValidationExpression="^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$">
                            </asp:RegularExpressionValidator>
                        </div>
                         
                        <div class="form-group"> 
                            <asp:Label ID="Label6" runat="server" Text="Stock:"></asp:Label><br />
                            <asp:TextBox ID="txtStockAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtStockAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Error, verifique."  CssClass="alert alert-danger" ControlToValidate="txtStockAgregar" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:FileUpload ID="FileUploadAgregar" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator17" runat="server"  CssClass="alert alert-danger" ErrorMessage="Campo requerido" ControlToValidate="FileUploadAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                    
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button3" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="btnAgregar" ValidationGroup="validacionAgregar" OnClick="btnAgregar_Click" runat="server" cssClass="btn btn-primary" Text="Agregar" />
                  </div>
                </div>
              </div>
         </div>

         <div class="modal fade" id="ModalModificar" tabindex="-1" role="dialog" aria-labelledby="Modal">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Modificar registro</h4>
                  </div>
                  <div class="modal-body">
                        <div class="form-group"> 
                            <asp:Label ID="Label5" runat="server" Text="Codigo:"></asp:Label><br />
                            <asp:TextBox ID="txtidProductosModi" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label1" runat="server" Text="Producto:"></asp:Label><br />
                            <asp:TextBox ID="txtProductoModi" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtProductoModi">
                            </asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator5" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtProductoModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ0-9\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label2" runat="server" Text="Descripcion:"></asp:Label><br />
                            <asp:TextBox ID="txtDescripcionModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtDescripcionModi">
                            </asp:RequiredFieldValidator><br />
                        </div>
                       
                        <div class="form-group"> 
                            <asp:Label ID="Label3" runat="server" Text="Categoria:"></asp:Label><br />
                           <asp:DropDownList ID="listCategoriaModi" CssClass="form-control" runat="server">
                            </asp:DropDownList>                             
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator11" runat="server" ErrorMessage="No hay datos" CssClass="alert alert-danger" ControlToValidate="listCategoriaModi">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label4" runat="server" Text="Marca:"></asp:Label><br />
                          <asp:DropDownList ID="listMarcaModi" CssClass="form-control" runat="server">
                            </asp:DropDownList>                              
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator12" runat="server" ErrorMessage="No hay datoss" CssClass="alert alert-danger" ControlToValidate="listMarcaModi">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group"> 
                            <asp:Label ID="Label10" runat="server" Text="Modelo:"></asp:Label><br />
                            <asp:TextBox ID="txtModeloModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtModeloModi">
                            </asp:RequiredFieldValidator><br />
                        </div>

                      <div class="form-group"> 
                            <asp:Label ID="Label15" runat="server" Text="Publico:"></asp:Label><br />
                            <asp:DropDownList ID="listPublicoModi" CssClass="form-control" runat="server">
                                <asp:ListItem Text="" Value="" Selected="True" />
                                <asp:ListItem Text="Mujer" Value="Mujer" />
                                <asp:ListItem Text="Hombre" Value="Hombre" />
                                <asp:ListItem Text="Niña" Value="Niña" />
                                <asp:ListItem Text="Niño" Value="Niño" />
                            </asp:DropDownList>                              
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator1" runat="server"  CssClass="alert alert-danger" ErrorMessage="Campo requerido" ControlToValidate="listPublicoModi">
                            </asp:RequiredFieldValidator>
                        </div>
                      
                        <div class="form-group"> 
                            <asp:Label ID="Label11" runat="server" Text="Precio:"></asp:Label><br />
                            <asp:TextBox ID="txtPrecioModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator14" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtPrecioModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Error, verifique."  CssClass="alert alert-danger" ControlToValidate="txtPrecioModi" ValidationExpression="^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$">
                            </asp:RegularExpressionValidator>
                        </div>
                         
                        <div class="form-group"> 
                            <asp:Label ID="Label16" runat="server" Text="Stock:"></asp:Label><br />
                            <asp:TextBox ID="txtStockModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator15" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtStockModi" >
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Error, verifique."  CssClass="alert alert-danger" ControlToValidate="txtStockModi" ValidationExpression="^[0-9]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:ImageButton ID="ImageModi" AlternateText="No hay imagen" runat="server" Width="100px" Height="100px" />
                            <asp:FileUpload ID="FileUploadModi" runat="server"/>
                        </div>
                    
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="btnModificar" ValidationGroup="validacionModi" OnClick="btnModificar_Click" runat="server" cssClass="btn btn-primary" Text="Modificar" />
                  </div>
                </div>
              </div>
         </div>

        <div class="modal fade" id="ModalEliminar" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">Eliminar registro</h4>
              </div>
              <div class="modal-body">
                <div class="alert alert-warning">
                    <h4>Desea eliminar el siguiente registro?</h4>
                </div>
                <div class="well"> 
                    <asp:Label ID="lblIdelimininar" runat="server" Text=""></asp:Label><br />
                </div>
              </div>
              <div class="modal-footer">
                    <asp:Button ID="Button2" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                    <asp:Button ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" cssClass="btn btn-primary" Text="Eliminar" />
              </div>
            </div> 
          </div> 
        </div> 

     <script type="text/javascript">
         function openModalAgregar() {
             $('#ModalAgregar').modal('show');
         }
         function openModalModificar() {
            $('#ModalModificar').modal('show');
        }
 
         function openModalEliminar() {
            $('#ModalEliminar').modal('show');
         }
    </script>
    </asp:Panel>
</asp:Content>

