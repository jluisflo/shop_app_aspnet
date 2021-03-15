<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Administrador.master" AutoEventWireup="true" CodeFile="MantenimientoSuscriptor.aspx.cs" Inherits="admin_adminSuscriptores_MantenimientoSuscriptor" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

    <div class="panel panel-default">
        <div class="panel-heading">
            Suscriptores&nbsp; Existentes
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
            <a href="reportes/ReporteSuscriptores.aspx" class="btn btn-default" onclick="window.open(this.href); return false;" onkeypress="window.open(this.href); return false;">Generar Reporte</a>            
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
                            <asp:Label ID="Label12" runat="server" Text="Nombre de Suscriptor:"></asp:Label><br />
                            <asp:TextBox ID="txtSuscriptorAgregar" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtSuscriptorAgregar">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator6" runat="server" CssClass="alert alert-danger" ControlToValidate="txtSuscriptorAgregar" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>

                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label2" runat="server" Text="E-mail:"></asp:Label><br />
                            <asp:TextBox ID="txtEmailAgregar" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionAgregar" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtEmailAgregar">
                            </asp:RequiredFieldValidator> 
                            <asp:RegularExpressionValidator ValidationGroup="validacionAgregar" ID="RegularExpressionValidator2" runat="server" CssClass="alert alert-danger" ErrorMessage="E-mail invalido" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtEmailAgregar">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <br />
                    
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
                            <asp:Label ID="Label1" runat="server" Text="Nombre de Suscriptor:"></asp:Label><br />
                            <asp:TextBox ID="txtSuscriptorModi" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtSuscriptorModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator3" runat="server" CssClass="alert alert-danger" ControlToValidate="txtSuscriptorModi" ErrorMessage="Error, Verifique." ForeColor="#CC0000" ValidationExpression="^[a-zA-ZñÑ\s]*$">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group"> 
                            <asp:Label ID="Label3" runat="server" Text="E-mail:"></asp:Label><br />
                            <asp:TextBox ID="txtEmailModi" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ValidationGroup="validacionModi" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo requerido" CssClass="alert alert-danger" ControlToValidate="txtEmailModi">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="validacionModi" ID="RegularExpressionValidator1" runat="server" CssClass="alert alert-danger" ErrorMessage="E-mail invalido" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="txtEmailModi">
                            </asp:RegularExpressionValidator>
                        </div>
                        <br />
                    
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
                    <asp:Label ID="lblSuscriptorElimininar" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblEmailElimininar" runat="server" Text=""></asp:Label><br />
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

