<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Registrarme.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <h3 class="center-align thin blue-text section">Una cuenta, muchos beneficios</h3>
        <hr class="colored" />

    <div class="container section-padding">

        <div class="row">
            <div class="col s12 m8 l8 offset-m2 offset-l2">
                <div class="row">
                    <div class="input-field col s12 m6 l6">
                        <i class="fa fa-user prefix"></i>
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        <label for="fa-user">Nombre</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-field col s12 m6 l6">
                        <i class="fa fa-user prefix"></i>
                        <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                        <label for="fa-user">Apellido</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtApellido"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l12">
                        <i class="fa fa-genderless prefix"></i>
                        <asp:DropDownList ID="txtGenero" runat="server">
                            <asp:ListItem Text="Seleccionar" Value="" disabled="disabled" Selected="True" />
                            <asp:ListItem Text="Femenino" Value="Femenino" />
                            <asp:ListItem Text="Masculino" Value="Masculino" /> 
                        </asp:DropDownList>
                        <label for="fa-genderless">Género</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtGenero" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l12">
                        <i class="fa fa-calendar prefix"></i>
                        <label for="fa-calendar"></label>
                        <asp:TextBox ID="txtNacimiento" type="text" placeholder="Fecha de Nacimiento" cssClass="datepicker" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtNacimiento" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l12">
                        <i class="fa fa-envelope prefix"></i>
                        <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                        <label for="fa-envelope">Correo Electrónico</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtMail" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMail" CssClass="red-text" ErrorMessage="E-mail invalido" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l12">
                        <i class="fa fa-lock prefix"></i>
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                        <label for="fa-lock">Contraseña</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtPass" ></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="center-align">
            <asp:Button ID="Button1" cssClass="btn blue btn-large" runat="server" Text="Registrarme" OnClick="Button1_Click" />
        </div>
        
    </div>

</asp:Content>

