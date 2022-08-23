<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="SistemaPlanillas.Formularios.Reporte" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
        <asp:ScriptManager ID="scmReporteClientes" runat="server"></asp:ScriptManager>
    <div>
        <asp:HyperLink ID="hpBienvenida" runat="server" NavigateUrl="~/Formularios/frmPaginaPrincipal.aspx" CssClass="text-info">Volver a la Pagina de Bienvenida</asp:HyperLink><br /><br />
    </div>
        <div>
            <h1 class="auto-style1">Reporte de Clientes</h1>               
              <p> Buscar por</p>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Primer Apellido:"></asp:Label>
        <asp:TextBox ID="txtPrimerApellido" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Segundo Apellido:"></asp:Label>
        <asp:TextBox ID="txtSegundoApellido" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Fecha Pago:"></asp:Label>
        <asp:TextBox ID="txtFechaPago" runat="server"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:Button ID="btVerReporte" runat="server" OnClick="btVerReporte_Click" Text="Ver Reporte" />
        <br />
        <br />
        <br />
        <asp:Label ID="lblResultado" runat="server" ForeColor="Red"></asp:Label>
       
        <br />
        <br /> 
    
        <rsweb:ReportViewer ID="rpvClientes" runat="server" Width="100%">
        </rsweb:ReportViewer>
    </form>
</body>
</html>