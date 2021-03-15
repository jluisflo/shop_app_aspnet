<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administrador.master" AutoEventWireup="true" CodeFile="MantenimientoUsuario.aspx.cs" Inherits="admin_adminUsuarios_MantenimientoUsuario" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            Usuarios Existentes
        </div>
        <div class="panel-body">

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
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
            <asp:Button ID="btnModalNuevo" OnClick="btnModalAgregar_Click" runat="server" cssClass="btn btn-primary" Text="Nuevo" />
            <a href="reportes/ReporteUsuarios.aspx" class="btn btn-default" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Generar Reporte</a>            
            <asp:Button ID="btnModalModificar" OnClick="btnModalModificar_Click" runat="server" cssClass="btn btn-warning pull-right" Text="Modificar" Enabled="False" />
            <asp:Button ID="btnModalEliminar" OnClick="btnModalEliminar_Click" runat="server" cssClass="btn btn-danger pull-right" Text="Eliminar" Enabled="False" />
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
                            <asp:TextBox ID="txtNombresAgregar" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNombresAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator4" runat="server" CssClass="alert alert-danger" ControlToValidate="txtNombresAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label13" runat="server" Text="Apellidos:"></asp:Label><br />
                            <asp:TextBox ID="txtApellidosAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtApellidosAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator3" runat="server" CssClass="alert alert-danger" ControlToValidate="txtApellidosAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label14" runat="server" Text="Nombre de usuario:"></asp:Label><br />
                            <asp:TextBox ID="txtUsuarioAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtUsuarioAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label15" runat="server"  Text="Contraseña:"></asp:Label><br />
                            <asp:TextBox ID="txtContraseñaAgregar" TextMode="Password" CssClass="form-control"  runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtContraseñaAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                    
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button3" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="Button4" ValidationGroup="validacionAgregar" OnClick="btnAgregar_Click" runat="server" cssClass="btn btn-primary" Text="Agregar" />
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
                            <asp:TextBox ID="txtIdModi" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox><br />
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label><br />
                            <asp:TextBox ID="txtNombresModi" CssClass="form-control" runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNombresModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator1" runat="server" CssClass="alert alert-danger" ControlToValidate="txtNombresModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label2" runat="server" Text="Apellidos:"></asp:Label><br />
                            <asp:TextBox ID="txtApellidosModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtApellidosModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator2" runat="server" CssClass="alert alert-danger" ControlToValidate="txtApellidosModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label3" runat="server" Text="Nombre de usuario:"></asp:Label><br />
                            <asp:TextBox ID="txtUsuarioModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtUsuarioModi">
                            </asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group"> 
                            <asp:Label ID="Label4" runat="server" Text="Contraseña:"></asp:Label><br />
                            <asp:TextBox ID="txtContraseñaModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtContraseñaModi">
                            </asp:RequiredFieldValidator>
                        </div>
                    
                  </div>
                  <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" cssClass="btn btn-default" Text="Cancelar" />
                        <asp:Button ID="btnModificar" validationGroup="validacionModi" OnClick="btnModificar_Click" runat="server" cssClass="btn btn-primary" Text="Modificar" />
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
                    <asp:Label ID="lblNombresElimininar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblApellidosEliminar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblUsuarioEliminar" runat="server" Text=""></asp:Label><br />
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
         function alertMessage(message) {
             alert(message);
         }
    </script>
    </asp:Panel>
</asp:Content>

