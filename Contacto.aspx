<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeFile="Contacto.aspx.cs" Inherits="Contacto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-title blue">
        <div class="container">
            <h3><%= Title %></h3>
        </div>
    </div>
    <div class="container section-padding">
        <div class="center">
             <asp:Label ID="error" Visible="false" runat="server" CssClass="card-panel red white-text" Text="No hay conexion a internet o servidor inaccesible"></asp:Label>
        </div>

        <br />
        <asp:Label ID="Label1" runat="server" Text="Su nombre:"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" Width="100%" CssClass="form-control input-lg"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" CssClass="red-text" ErrorMessage="Nombre requerido" ></asp:RequiredFieldValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
        <br />
        <asp:Label ID="Label2" runat="server" Text="Su E-mail"></asp:Label>
        <asp:TextBox ID="txtMail" runat="server" Width="100%" CssClass="form-control input-lg"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMail" CssClass="red-text" ErrorMessage="E-mail requerido"></asp:RequiredFieldValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMail" CssClass="red-text" ErrorMessage="E-mail invalido" ValidationExpression="^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"></asp:RegularExpressionValidator>

        <br />
        <asp:Label ID="Label3" runat="server" Text="Mensaje:"></asp:Label>
        <asp:TextBox ID="txtMsj" runat="server" Height="92px" Width="100%" CssClass="form-control input-lg"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMsj" CssClass="red-text" ErrorMessage="Mensaje requerido"></asp:RequiredFieldValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Height="60px" Text="Enviar Mensaje" Width="204px" OnClick="btnSend_Click"/>
        <br />
        <br />
        <br />
        <br />


    </div>

</asp:Content>
