<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/admin/Administrador.master" CodeFile="MantenimientoProveedor.aspx.cs" Inherits="admin_MantenimientoProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            Proveedores Existentes  
        </div>
        <div class="panel-body">

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" >
                    <ControlStyle CssClass="btn btn-info btn-xs" ForeColor="White" />
                    </asp:CommandField>
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
            <asp:Button ID="btnModalNuevo" runat="server" OnClick="btnModalAgregar_Click" cssClass="btn btn-primary" Text="Nuevo" />
            <a href="reportes/ReporteProveedores.aspx" class="btn btn-default" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Generar Reporte</a>            
            <asp:Button ID="btnModalModificar" runat="server" OnClick="btnModalModificar_Click" cssClass="btn btn-warning pull-right" Text="Modificar" Enabled="False" />
            <asp:Button ID="btnModalEliminar" runat="server" OnClick="btnModalEliminar_Click" cssClass="btn btn-danger pull-right" Text="Eliminar" Enabled="False" />
        </div>
    </div>
                   
         <div class="modal fade" id="ModalAgregar" tabindex="-1" role="dialog" aria-labelledby="Modal">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title">Agregar registro</h4>
                  </div>
                  <div class="modal-body">

                        <div class="form-group"> 
                            <asp:Label ID="Label12" runat="server" Text="Nombre:"></asp:Label><br />
                            <asp:TextBox ID="txtNombreAgregar" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNombreAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator3" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtNombreAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label13" runat="server" Text="Telefono:"></asp:Label><br />
                            <asp:TextBox ID="txtTelefonoAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtTelefonoAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator4" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtTelefonoAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[0-9]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                       
                        

                        <div class="form-group"> 
                            <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label><br />
                            <asp:TextBox ID="txtEmailAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtEmailAgregar">
                            </asp:RequiredFieldValidator>
                            
                            
                        </div>
                      
                        <div class="form-group"> 
                            <asp:Label ID="Label9" runat="server" Text="Direccion:"></asp:Label><br />
                            <asp:TextBox ID="txtDireccionAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtDireccionAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                                  
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button3" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="btnAgregar" ValidationGroup="validacionAgregar"  runat="server" cssClass="btn btn-primary" Text="Agregar" OnClick="btnAgregar_Click" />
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
                            <asp:Label ID="Label5" runat="server" Text="Id Proveedor:"></asp:Label><br />
                            <asp:TextBox ID="txtIdModi" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label><br />
                            <asp:TextBox ID="txtNombreModi" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNombreModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator1" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtNombreModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label2" runat="server" Text="Telefono:"></asp:Label><br />
                            <asp:TextBox ID="txtTelefonoModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtTelefonoModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator2" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtTelefonoModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[0-9]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                       
                        

                        <div class="form-group"> 
                            <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label><br />
                            <asp:TextBox ID="txtEmailModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtEmailModi">
                            </asp:RequiredFieldValidator>
                            
                            
                        </div>
                      
                        <div class="form-group"> 
                            <asp:Label ID="Label4" runat="server" Text="Direccion:"></asp:Label><br />
                            <asp:TextBox ID="txtDireccionModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtDireccionModi">
                            </asp:RequiredFieldValidator>
                        </div>
                         
                    
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="btnModificar" ValidationGroup="validacionModi" runat="server" cssClass="btn btn-primary" Text="Modificar" OnClick="btnModificar_Click" />
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
                    <asp:Label ID="lblProveedorElimininar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblTelefonoEliminar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblemailEliminar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lbldireccionEliminar" runat="server" Text=""></asp:Label><br />
                      
                </div>
              </div>
              <div class="modal-footer">
                    <asp:Button ID="Button2" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                    <asp:Button ID="btnEliminar" runat="server" cssClass="btn btn-primary" Text="Eliminar" OnClick="btnEliminar_Click" />


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

