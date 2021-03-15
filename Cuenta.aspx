<%@ Page Title="Configuración de cuenta" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Cuenta.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="page-title blue">
        <div class="container">
        <h2 class="light"><%: Title %></h2>
        </div>
    </div>

    <div class="container content-page">
        <div class="col s12 card z-depth-3">
            <div class="center-align">
                <asp:Label ID="lblError" runat="server" Text="Error" CssClass="white-text red card-panel" Visible="false"></asp:Label>
            </div>
            <br />

            <div class="center-align">
                <img src="img/profile.png" class="responsive-img circle" width="125" />
                <hr class="colored" />
            </div>
            <ul class="collapsible" data-collapsible="accordion">
            <li>
                <div class="collapsible-header active">Información de Cuenta</div>
                <div class="collapsible-body center">
                    <h5 class="blue-text">Nombre: </h5>
                    <asp:Label ID="lblNombre" runat="server" Text="Label"></asp:Label>
                    <h5 class="blue-text">Apellidos: </h5>
                    <asp:Label ID="lblApellidos" runat="server" Text="Label"></asp:Label>
                    <h5 class="blue-text">Usuario: </h5>
                    <asp:Label ID="lblUsuario" runat="server" Text="Label"></asp:Label>
                </div>
            </li>
            <li>
                <div class="collapsible-header">Cambiar informacion personal</div>
                <div class="collapsible-body">
                    <div class="row">
                        <br />
                        <div class="col s12 m4 l4">
                            Nombre:
                            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ValidationGroup="valiInfoPerso" CssClass="red-text" ErrorMessage="No dejar vacio"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col s12 m4 l4">
                            Apellidos:
                            <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtApellidos" ValidationGroup="valiInfoPerso" CssClass="red-text" ErrorMessage="No dejar vacio"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col s12 m4 l4">
                            <asp:Button ID="btnOp1" runat="server" Text="Guardar" CssClass="btn" ValidationGroup="valiInfoPerso" OnClick="btnOp1_Click" />
                        </div>
                    </div>
                </div>
                
            </li>
            <li>
                <div class="collapsible-header">Cambiar nombre de usuario</div>
                <div class="collapsible-body">
                    <div class="row">
                        <br />
                        <div class="col s12 m4 l4">
                            Nuevo usuario:
                            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUsuario" ValidationGroup="valiNomUsu" CssClass="red-text" ErrorMessage="No dejar vacio"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUsuario" ValidationGroup="valiNomUsu" ErrorMessage="Email invalido" CssClass="red-text" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col s12 m4 l4">
                            <asp:Button ID="btnOp2" runat="server" Text="Guargar" CssClass="btn" ValidationGroup="valiNomUsu" OnClick="btnOp2_Click" />
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="collapsible-header">Cambiar Contraseña</div>
                <div class="collapsible-body">
                    <div class="row">
                        <br />
                        <div class="col s12 m4 l4">
                            Contraseña actual:
                            <asp:TextBox ID="txtContraActual" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContraActual" ValidationGroup="valiContra" CssClass="red-text" ErrorMessage="No dejar vacio"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col s12 m4 l4">
                            Contraseña nueva:
                            <asp:TextBox ID="txtContraNueva" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContraNueva" ValidationGroup="valiContra" CssClass="red-text" ErrorMessage="No dejar vacio"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col s12 m4 l4">
                            <asp:Button ID="btnOp3" runat="server" Text="Cambiar contraseña" CssClass="btn" ValidationGroup="valiContra" OnClick="btnOp3_Click" />

                        </div>
                    </div>
                </div>
            </li>
            </ul>
        </div>
    </div>
</asp:Content>

