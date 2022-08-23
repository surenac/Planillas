<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmUsuarioLista.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmUsuarioLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
<form id="form1" runat="server">
    <div>
        <h1>Lista de Usuarios</h1>

        <asp:GridView ID="grdListaUsuarios" AutoGenerateColumns="false" runat="server">
                 <Columns>
                    <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre Completo" />
                    <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" />
                    <asp:BoundField DataField="tipoUsuario" HeaderText="Tipo de Usuario" />
                    <asp:HyperLinkField DataNavigateUrlFields="id_Usuario" DataNavigateUrlFormatString="frmUsuarioModifica.aspx?id_Usuario={0}" Text="Modificar" />
                    <asp:HyperLinkField DataNavigateUrlFields="id_Usuario" DataNavigateUrlFormatString="frmUsuarioElimina.aspx?id_Usuario={0}" Text="Eliminar" />
                </Columns>
        </asp:GridView>

    </div>
 </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
