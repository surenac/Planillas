<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="frmColaboradorModifica.aspx.cs" Inherits="SistemaPlanillas.Formularios.frmColaboradorModifica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
            <form id="form1" runat="server">
        <div>
            <h1>Modificacion de Colaborador</h1>

       <div class="form-group">
            <asp:Label ID="lblCedula" runat="server" Text="Cedula"></asp:Label>      
            <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqvtxtCedula" runat="server"  ControlToValidate="txtCedula" ErrorMessage="Debe Ingresar la Cedula" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>

       <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqvTxtNombre" runat="server" ControlToValidate="txtNombre" CssClass="form-control" ErrorMessage="Debe ingresar el nombre" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>

       <div class="form-group">
          <asp:Label ID="lblPrimerApellido" runat="server" Text="Primer Apellido"></asp:Label>      
          <asp:TextBox ID="txtPrimerApellido" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvPrimerApellido" runat="server"  ControlToValidate="txtPrimerApellido" ErrorMessage="Debe ingresar el primer apellido" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>

       <div class="form-group">
           <asp:Label ID="lblSegundoApellido" runat="server" Text="Segundo Apellido"></asp:Label>                 
           <asp:TextBox ID="txtSegundoApellido" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rqvTxtSegundoApellido" runat="server"  ControlToValidate="txtSegundoApellido" ErrorMessage="Debe ingresar el segundo apellido" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>
            
       <div class="form-group">
          <asp:Label ID="lblGenero" runat="server" Text="Genero"></asp:Label>
           <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="true">
               <asp:ListItem>Masculino</asp:ListItem>
               <asp:ListItem>Femenino</asp:ListItem>
           </asp:DropDownList>
       </div>

         <div class="form-group">
          <asp:Label ID="lblCorreo" runat="server" Text="Correo Electronico"></asp:Label>
          <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvtxtCorreo" runat="server" ErrorMessage="Debe Ingresar el Correo Electronico" Display="None" ControlToValidate="txtCorreo"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="regtxtCorreo" runat="server" ErrorMessage="Debe Ingresar un correo electronico Valido" ControlToValidate="txtCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

       <div class="form-group">
          <asp:Label ID="lblDireccion" runat="server" Text="Direccion Fisica"></asp:Label>
          <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvtxtDireccion" runat="server" ControlToValidate="txtDireccion" CssClass="form-control" ErrorMessage="Debe ingresar la Provincia" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
       </div>

       <div class="form-group">
          <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
          <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvtxtTelefono" runat="server" ControlToValidate="txtTelefono" CssClass="form-control" ErrorMessage="Debe ingresar el teléfono" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
          <asp:CompareValidator ID="cmptxtTelefono" runat="server" ErrorMessage="El telefono debe ser un numero"  ControlToValidate="txtTelefono" Operator="DataTypeCheck" Type="Integer" Display="None"></asp:CompareValidator>
       </div>

           <div>
            <asp:Label ID="lblFechaIngreso" runat="server" Text="Fecha de Ingreso"></asp:Label>
           <asp:Calendar ID="Calendario" runat="server" OnSelectionChanged="Calendario_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
           </div>

       <div class="form-group">
          <asp:Label ID="lblSalario" runat="server" Text="Salario Base"></asp:Label>
          <asp:TextBox ID="txtSalario" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rqvtxtSalario" runat="server" ControlToValidate="txtSalario" CssClass="form-control" ErrorMessage="Debe ingresar un Salario" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
          <asp:CompareValidator ID="cmptxtSalario" runat="server" ErrorMessage="El salario debe ser un numero"  ControlToValidate="txtSalario" Operator="DataTypeCheck" Type="Double" Display="None"></asp:CompareValidator>
       </div>

       <div class="form-group">
          <asp:Button ID="btAceptar" runat="server"  Text="Guardar" CssClass="btn-success" OnClick="btAceptar_Click" OnClientClick="return confirm('Are you sure?')" />
       </div>             

          <asp:ValidationSummary ID="vsRegistroPersonas" runat="server" ShowMessageBox="True" ShowSummary="False" />

        <asp:HiddenField ID="hdIdColaborador" runat="server" />

       </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptsPersonalizados" runat="server">
</asp:Content>
