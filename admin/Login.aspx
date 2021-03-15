<%@ Page Title="Login Administrador" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="~/css/signin.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <form id="form1" runat="server">
      <div class="container">

          <div class="form-signin">
            <h1 class="form-signin-heading">Iniciar Sesión</h1>
              <p>
                  <label>Usuario:</label>
                  <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" ForeColor="#0066FF" ></asp:TextBox>
              </p>
              <p>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario" CssClass="alert alert-danger" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
              </p>
              <p>
                  <label>Contraseña:</label>
                  <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" ForeColor="#3399FF"></asp:TextBox>
              </p>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" CssClass="alert alert-danger" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
           
         
              <p>
                  &nbsp;</p>
              <p>
                  <asp:Button ID="Button1" runat="server"  CssClass="btn btn-lg btn-default btn-block btn-login" Text="Iniciar Sesión" OnClick="Button1_Click" />
              </p>



          </div>

      &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="text-center">
            <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger" Text="Usuario o password incorrecto, vuelva a intentarlo." Visible="False"></asp:Label>
          </div>
        <div class="alert alert-info">
            La base de datos genera un usuario y contraseña por defecto:<br />
            Usuario: userdefault<br />
            Contraseña: passdefault
        </div>
      </div> 

    </form>
</body>
</html>
