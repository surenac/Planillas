<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmCalculoListaSalarios.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmCalculoListaSalarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    <form id="form1" runat="server">
        <div>
            <h1>Lista de Salarios</h1>

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

            <asp:GridView ID="grdListaSalarios" runat="server" AutoGenerateColumns="false" >
                  <Columns>
                      <asp:BoundField DataField="cedula" HeaderText="Cedula " />
                      <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                      <asp:BoundField DataField="primerApellido" HeaderText="Primer Apellido" />
                      <asp:BoundField DataField="segundoApellido" HeaderText="Segundo Apellido" />
                      <asp:BoundField DataField="salarioBase" HeaderText="Salario Base" />
                      <asp:BoundField DataField="nombreTurno" HeaderText="Turno Laboral" />
                      <asp:BoundField DataField="horasExtras" HeaderText="Horas Extras" />
                      <asp:BoundField DataField="SeguroSocial" HeaderText="Seguro Social" />
                      <asp:BoundField DataField="impuestoRenta" HeaderText="Impuesto Renta" />
                      <asp:BoundField DataField="Asociacion" HeaderText="Asociacion" />
                      <asp:BoundField DataField="otrosRebajos" HeaderText="Otros Rebajos" />
                      <asp:BoundField DataField="totalPago" HeaderText="Total Pago" />
                  </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
