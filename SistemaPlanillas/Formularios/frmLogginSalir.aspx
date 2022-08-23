<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmLogginSalir.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmLogginSalir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
            <form id="form1" runat="server">
            <div>
                <h1>Cierre de la sesión del usuario</h1>
                <p>¿Desea salir de la aplicación?</p>
            <div>        
                <asp:Button ID="btnSi" runat="server" Text="Si" CssClass="btn-success" OnClick="btnSi_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn-success" OnClick="btnNo_Click" />
            </div><br /><br />
            </div>

        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
