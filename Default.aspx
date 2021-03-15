<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
     <div class="slider">
    <ul class="slides">
      <li>
        <img src="img/online-shopping.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h2>Una nueva forma de comprar desde internet!</h2>
        </div>
      </li>
      <li>
        <img src="img/shopping2.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h2>Todo lo que puedes imaginar comprar</h2>
        </div>
      </li>
    </ul>
  </div>

     <div class="container">
    <div class="section-padding"> 
        <div class="row">
                <div class="col s4">
                    <div class="center">
                        <i class="fa fa-bolt medium orange-text"></i>
                        <h4 class="center-align light">Rápido</h4>
                    </div>
                </div>
                <div class="col s4">
                    <div class="center-align">
                        <i class="fa fa-lock medium green-text"></i>
                        <h4 class="center-align light">Confiable y Seguro</h4>
                    </div>
                </div>
                <div class="col s4">
                    <div class="center-align">
                        <i class="fa fa-tablet medium blue-text"></i>
                        <h4 class="center-align light">Accesible</h4>
                    </div>
                </div>
        </div>
    </div>
</div>
    <div class="parallax-container valign-wrapper" style="height:400px;">
        <div class="container">
            <h1 class="valign white-text light">Comprar cuando y como quieras</h1>
            <div class="parallax"><img src="img/live.jpg"></div>
        </div>
        <div class="filtro" style="z-index:-1"></div>
    </div>



</asp:Content>
