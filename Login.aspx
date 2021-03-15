<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


        <h3 class="center-align thin blue-text section">Iniciar Sesión</h3>
        <hr class="colored" />

    <div class="container section-padding">
        
        <div class="row">
            <div class="input-field col s12 m6 l6 offset-m3 offset-l3">
                <i class="fa fa-user prefix"></i>
                <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                <label for="fa-user">Correo Electrónico</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMail" CssClass="red-text" ErrorMessage="E-mail invalido" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6 offset-m3 offset-l3">
                <i class="fa fa-lock prefix"></i>
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                <label for="fa-lock">Contraseña</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" cssClass="red-text" runat="server" ErrorMessage="Campo requerido" ControlToValidate="txtPass" ></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="center-align">
            <asp:Label ID="LabelError" visible="false" CssClass="center-align card-panel red white-text" runat="server" Text="Usuario o contraseña invalida, vuelva a intentar."></asp:Label>
        </div>
        <br />
        <div class="center-align">
            <asp:Button ID="Button1" cssClass="btn blue btn-large" runat="server" Text="Entrar" OnClick="Button1_Click" />
        </div>
        <div class="center-align section-padding">
            <h5 class="light">No tienes cuenta? <a href="Registrarme.aspx">Regístrate</a></h5>
        </div>
        
    </div>
   
</asp:Content>

