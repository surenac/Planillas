<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmUsuarioElimina.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmUsuarioElimina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
            <form id="form1" runat="server">
        <div>
            <h1>Modificacion de Usuarios</h1>

       <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre Completo"></asp:Label>
            <asp:TextBox ID="txtNombreNombreCompleto" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqvTxtNombreCompleto" runat="server" ControlToValidate="txtNombreNombreCompleto" CssClass="form-control" ErrorMessage="Debe ingresar el nombre" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>

         <div class="form-group">
          <asp:Label ID="lblCorreo" runat="server" Text="Correo Electronico"></asp:Label>
          <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvtxtCorreo" runat="server" ErrorMessage="Debe Ingresar el Correo Electronico" Display="None" ControlToValidate="txtCorreo"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="regtxtCorreo" runat="server" ErrorMessage="Debe Ingresar un correo electronico Valido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

       <div class="form-group">
          <asp:Label ID="lblTipoUsuario" runat="server" Text="Tipo Usuario"></asp:Label>
           <asp:DropDownList ID="ddlTipoUsuario" runat="server" AutoPostBack="true">
               <asp:ListItem>Adm</asp:ListItem>
               <asp:ListItem>Ope</asp:ListItem>
           </asp:DropDownList>
       </div>

       <div class="form-group">
          <asp:Button ID="btAceptar" runat="server"  Text="Guardar" CssClass="btn-success" OnClick="btAceptar_Click" OnClientClick="return confirm('Are you sure?')" />
       </div>             

          <asp:ValidationSummary ID="vsRegistroPersonas" runat="server" ShowMessageBox="True" ShowSummary="False" />

          <asp:HiddenField ID="hdIdUsuario" runat="server" />

       </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
