<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administrador.master" AutoEventWireup="true" CodeFile="MantenimientoCliente.aspx.cs" Inherits="admin_adminClientes_MantenimientoCliente" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            Clientes Existentes
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
            <a href="reportes/ReporteClientes.aspx" class="btn btn-default" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Generar Reporte</a>
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
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator3" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtNombresAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label13" runat="server" Text="Apellidos:"></asp:Label><br />
                            <asp:TextBox ID="txtApellidosAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtApellidosAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator4" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtApellidosAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                       
                        <div class="form-group"> 
                            <asp:Label ID="Label14" runat="server" Text="Genero:"></asp:Label><br />
                            <asp:DropDownList ID="listGeneroAgregar" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Seleccionar" Value="" disabled="disabled" Selected="True" />
                                <asp:ListItem Text="Femenino" Value="Femenino" />
                                <asp:ListItem Text="Masculino" Value="Masculino" />
                            </asp:DropDownList>                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="listGeneroAgregar">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label7" runat="server" Text="Fecha de nacimiento:"></asp:Label><br />
                            <asp:TextBox ID="txtNacimientoAgregar" TextMode="Date" cssClass="form-control datepicker" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator6" runat="server"  CssClass="alert alert-danger" ErrorMessage="Campo requerido" ControlToValidate="txtNacimientoAgregar">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group"> 
                            <asp:Label ID="Label8" runat="server" Text="E-mail:"></asp:Label><br />
                            <asp:TextBox ID="txtMailAgregar" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtMailAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator1" runat="server"  CssClass="alert alert-danger" ErrorMessage="E-mail invalido" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtMailAgregar">
                            </asp:RegularExpressionValidator>
                        </div>
                      
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label15" runat="server"  Text="Contraseña:"></asp:Label><br />
                            <asp:TextBox ID="txtContraseñaAgregar" TextMode="Password" CssClass="form-control"  runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtContraseñaAgregar">
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
                            <asp:TextBox ID="txtIdModi" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label><br />
                            <asp:TextBox ID="txtNombresModi" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNombresModi">
                            </asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator5" runat="server"  CssClass="alert alert-danger" ControlToValidate="txtNombresModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group"> 
                            <asp:Label ID="Label2" runat="server" Text="Apellidos:"></asp:Label><br />
                            <asp:TextBox ID="txtApellidosModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtApellidosModi">
                            </asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator6" runat="server"  cssClass="alert alert-danger" ControlToValidate="txtApellidosModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                       
                        <div class="form-group"> 
                            <asp:Label ID="Label3" runat="server" Text="Genero:"></asp:Label><br />
                            <asp:DropDownList ID="listGeneroModi" CssClass="form-control" runat="server">
                                <asp:ListItem Text="Seleccionar" Value="" disabled="disabled" Selected="True" />
                                <asp:ListItem Text="Femenino" Value="Femenino" />
                                <asp:ListItem Text="Masculino" Value="Masculino" />
                            </asp:DropDownList>                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="listGeneroModi">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group"> 
                             
                                <asp:Label ID="Label4" runat="server" Text="Fecha de nacimiento:"></asp:Label><br />
                                <asp:TextBox ID="txtNacimientoModi" cssClass="form-control datepicker" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtNacimientoModi">
                                </asp:RequiredFieldValidator>
                             
                        </div>

                        <div class="form-group"> 
                            <asp:Label ID="Label10" runat="server" Text="E-mail:"></asp:Label><br />
                            <asp:TextBox ID="txtMailModi" CssClass="form-control"  runat="server"></asp:TextBox><br />                            
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtMailModi">
                            </asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator2" runat="server"  CssClass="alert alert-danger" ErrorMessage="E-amil invalido" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtMailModi">
                            </asp:RegularExpressionValidator>
                        </div>
                      
                        <div class="form-group"> 
                            <asp:Label ID="Label17" runat="server"  Text="Contraseña:"></asp:Label><br />
                            <asp:TextBox ID="txtContraseñaModi" CssClass="form-control"  runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator16" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtContraseñaModi">
                            </asp:RequiredFieldValidator>
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
     
        </script>
     

     <script type="text/javascript">
        
         $(document).ready(function () {
             $('.datepicker').pickadate({
                 selectMonths: true,  
                 selectYears: 100,  
                 formatSubmit: 'yyyy/mm/dd'
             });
        }); // end of document readysss

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

