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
    public partial class frmUsuarioElimina : System.Web.UI.Page
    {
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
                    //Obtener el id del registro original
                    int id_Usuario = Convert.ToInt16(this.hdIdUsuario.Value);
                    //Asignar a la variable el resultado de invocar el procedimiento almacenado
                    resultado = objUsuario.UsuarioElimina(id_Usuario);
                }
                ///catch: se ejecuta en el caso de que haya una excepcion
                ///excepcionCapturada: posee los datos de la excepción
                catch (Exception excepcionCapturada)
                {
                    mensaje += $"Ocurrió un error: {excepcionCapturada.Message}";
                }
                ///finally: siempre se ejecuta (se atrape o no la excepción)
                finally
                {
                    ///si el resultado de la variable es verdadera implica que
                    ///el procedimiento no retornó errores
                    if (resultado)
                    {
                        mensaje += "El registro fue eliminado";
                    }
                }
                ///mostrar el mensaje
                Response.Write("<script>alert('" + mensaje + "')</script>"); ;
            }
        }
    }
}