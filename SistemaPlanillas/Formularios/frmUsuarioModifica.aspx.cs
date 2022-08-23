using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaPlanillas.ClasesBL;
using SistemaPlanillas.Modelos;

namespace SistemaPlanillas.Formularios
{
    public partial class frmUsuarioModifica : System.Web.UI.Page
    {
        PlanillasEntities modeloBD = new PlanillasEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.cargaDatosRegistro();
            }
        }

        void cargaDatosRegistro()
        {
            string parametro =
                this.Request.QueryString["id_Usuario"];

            if (String.IsNullOrEmpty(parametro))
            {
                Response.Write("<script>alert('Parámetro nulo')</script>");
            }
            else
            {
                int id_Usuario = Convert.ToInt16(parametro);
                MantenimientoUsuarios objUsuario = new MantenimientoUsuarios();
                sp_UsuarioRetornaID_Result datosUsuario = new sp_UsuarioRetornaID_Result();

                ///invocar al procedimiento
                datosUsuario =
                    objUsuario.RetornaUsuarioID(id_Usuario);
                if (datosUsuario == null)
                {
                    Response.Redirect("frmListaClientes.aspx");
                }
                else
                {
                    this.txtNombreNombreCompleto.Text = datosUsuario.nombreCompleto;
                    this.txtCorreo.Text = datosUsuario.correoElectronico;
                    this.ddlTipoUsuario.SelectedIndex = ddlTipoUsuario.Items.IndexOf(ddlTipoUsuario.Items.FindByText(datosUsuario.tipoUsuario));
                    //Asignar al hiddenfield el valor de la llave primaria
                    this.hdIdUsuario.Value = datosUsuario.id_Usuario.ToString();
                }
            }
        }
        protected void btAceptar_Click(object sender, EventArgs e)
        {
            this.AlmacenarDatos();
        }
        void AlmacenarDatos()
        {
            if (this.IsValid)
            {
                MantenimientoUsuarios objUsuario = new MantenimientoUsuarios();
                bool resultado = false;
                string mensaje = "";
                try
                {
                    //obtener el valor del hidden field 
                    int id_Usuario = Convert.ToInt16(this.hdIdUsuario.Value);
                    ///asignar a la variable el resultado de 
                    ///invocar el procedimiento almacenado
                    resultado = objUsuario.UsuarioModifica(
                    id_Usuario,
                    this.txtNombreNombreCompleto.Text,
                    this.txtCorreo.Text,
                    this.ddlTipoUsuario.SelectedValue);
                }

                catch (Exception excepcionCapturada)
                {
                    mensaje += $"Ocurrio un error:{excepcionCapturada.Message}";
                }

                finally
                {
                    if (resultado)
                    {
                        mensaje += "El registro fue modificado";
                    }
                }

                Response.Write("<script>alert('" + mensaje + "')</script>"); ;
            }
        }
    }
}