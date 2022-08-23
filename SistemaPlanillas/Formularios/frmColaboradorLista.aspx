<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmColaboradorLista.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmColaboradorLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>Lista de Clientes</h1>

            <div class="form-group">
                <asp:Label ID="lblApellido1" runat="server" Text="Apellido 1:"></asp:Label>
                <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control" ></asp:TextBox>            
            </div>

            <div class="form-group">
                <asp:Label ID="lblApellido2" runat="server" Text="Apellido 2:"></asp:Label>
                <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control" ></asp:TextBox>            
            </div>

            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ></asp:TextBox>            
            </div>

            <div>        
            <asp:Button ID="btnMostrarDatos" runat="server"  Text="Mostrar datos" CssClass="btn-success" OnClick="btnMostrarDatos_Click"/>
            </div><br /><br />

            <asp:GridView ID="grdListaColaborador" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="cedula" HeaderText="Cedula " />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="primerApellido" HeaderText="Primer Apellido" />
                    <asp:BoundField DataField="segundoApellido" HeaderText="Segundo Apellido" />
                    <asp:BoundField DataField="Genero" HeaderText="Genero" />
                    <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" />
                    <asp:BoundField DataField="direccionFisica" HeaderText="Direccion Fisica" />
                    <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="fechaIngreso" HeaderText="Fecha Ingreso" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="salarioBase" HeaderText="Salario Base" />
                    <asp:HyperLinkField DataNavigateUrlFields="idColaborador" DataNavigateUrlFormatString="frmColaboradorModifica.aspx?idColaborador={0}" Text="Modificar" />
                    <asp:HyperLinkField DataNavigateUrlFields="idColaborador" DataNavigateUrlFormatString="frmColaboradorElimina.aspx?idColaborador={0}" Text="Eliminar" />
                </Columns>
            </asp:GridView>

        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
