<%@ Page Title="Suscripción" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeFile="Suscripcion.aspx.cs" Inherits="Contacto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-title blue">
        <div class="container">
            <h3><%: Title %></h3>
        </div>
    </div>
    <div class="container section-padding">
        <div class="row">
            <div class="col-md-7">

                <asp:Label ID="Label1" runat="server" Text="Su nombre:"></asp:Label><br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg" Width="100%" OnTextChanged="TextBox1_TextChanged"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="red-text" ControlToValidate="TextBox1" ErrorMessage="Nombre requerido" ></asp:RequiredFieldValidator>
               
                <br />
                <br />
 
                <asp:Label ID="Label2" runat="server" Text="Su E-mail"></asp:Label><br />
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-lg" Width="100%"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="red-text" ControlToValidate="TextBox2" ErrorMessage="E-mail requerido"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="alert alert-danger" ControlToValidate="TextBox2" ErrorMessage="E-mail invalido" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Height="45px" CssClass="btn btn-lg blue" Text="Enviar Mensaje" OnClick="Button1_Click"  />

                <br />
                <br />
                <br />
                <asp:Label ID="lblexito" runat="server" CssClass="alert alert-success" Text="Gracias por suscibirse!" Visible="False"></asp:Label>
                <br />

            </div>
        </div>

    </div>

</asp:Content>
