<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmCalculoSalarios.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmCalculoSalarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    <form id="form1" runat="server">
        <br />
        <asp:HyperLink ID="hpListaSalario" runat="server" NavigateUrl="~/Formularios/frmCalculoListaSalarios.aspx" CssClass="text-info">Ver Listado</asp:HyperLink><br /><br />

        <div class="form-group">
          <asp:Label ID="lblColaborador" runat="server" Text="Colaborador"></asp:Label>
           <asp:DropDownList ID="ddlColaborador" runat="server" AutoPostBack="true" DataTextField="NombreCompleto" DataValueField="idColaborador" OnSelectedIndexChanged="ddlColaborador_SelectedIndexChanged"></asp:DropDownList>
       </div>

        <div class="form-group">
          <asp:Label ID="lblSalario" runat="server" Text="Salario"></asp:Label>
           <asp:DropDownList ID="ddlSalario" runat="server" AutoPostBack="true" DataTextField="salarioBase" DataValueField="idColaborador" ></asp:DropDownList>
            <asp:TextBox ID="txtSalarioBase" runat="server" AutoPostBack="true" ></asp:TextBox>
       </div>

          <div class="form-group">
          <asp:Label ID="lblHorasExtras" runat="server" Text="Total Horas Extras"></asp:Label>
          <asp:TextBox ID="txtHorasExtras" runat="server" ></asp:TextBox>
          </div>

       <div class="form-group">
          <asp:Label ID="lblTurno" runat="server" Text="Turno Laboral"></asp:Label>
           <asp:DropDownList ID="ddlTurnoLaboral" runat="server" AutoPostBack="true" DataTextField="nombreTurno" DataValueField="idTurno"></asp:DropDownList>
       </div>

        <div class="form-group">
          <asp:Label ID="lblDiasLaborador" runat="server" Text="Dias Ausentes"></asp:Label>
          <asp:TextBox ID="txtDiasLaborador" runat="server"></asp:TextBox>
          </div>

         <div class="form-group">
          <asp:Label ID="lblRebajos" runat="server" Text="Rebajos"></asp:Label>
          <asp:TextBox ID="txtRebajos" runat="server"></asp:TextBox>
          </div>

           <div>
           <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="Calendario_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="txtFechaPago" runat="server"></asp:TextBox>
          </div>

         <div class="form-group">
          <asp:Button ID="btAceptar" runat="server"  Text="Guardar" CssClass="btn-success" OnClick="btAceptar_Click" OnClientClick="return confirm('Are you sure?')" />
       </div>  

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
