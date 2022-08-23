<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLoggin.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmLoggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" />    
        <style>
        .carousel-inner .item img {
            width: auto;
            margin: auto;
            height:auto;
            max-height:300px;
        }       
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title></title>
</head>
<body>
<form id="form1" runat="server">
        <div>

            <div class="jumbotron text-center">
            <h1>Soluciones Informaticas</h1>
            <h2>SJDL</h2>
            </div >

            <div style="align-content" class="jumbotron text-center">
                  
            <asp:Label  ID="lblCorreo" runat="server" Text="Correo Electrónico:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox><br />

            <asp:RequiredFieldValidator ID="rqvCorreoElectronico" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Debe ingresar el correo electrónico"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regtxtCorreo" runat="server" ErrorMessage="Debe Ingresar un correo electronico Valido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br /><br />
            
            <asp:Label ID="lblContrasela" runat="server" Text="Contraseña"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rqvContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Debe ingresar una contraseña"></asp:RequiredFieldValidator><br /><br />

            <asp:Button ID="btAceptar" runat="server" OnClick="btAceptar_Click" Text="Aceptar" /><br /><br />

            <asp:Label ID="lblResultado" runat="server"></asp:Label><br /><br />

            <asp:Image ID="Logo" runat="server" ImageUrl="~/Imagenes/Logo.jpg" Height="197px" Width="195px" />
            </div>

            

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
    </form>
        <footer>Todos los derechos reservados <%: DateTime.Now.Year %> </footer>
</body>
</html>