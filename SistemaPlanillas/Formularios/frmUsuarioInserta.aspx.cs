using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaPlanillas.Modelos;
using SistemaPlanillas.ClasesBL;

namespace SistemaPlanillas.Formularios
{
    public partial class frmUsuarioInserta : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
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

                Random rdn = new Random();
                string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890%$#@";
                int longitud = caracteres.Length;
                char letra;
                int longitudContrasenia = 10;
                string contraseniaAleatoria = string.Empty;
                for (int i = 0; i < longitudContrasenia; i++)
                {
                    letra = caracteres[rdn.Next(longitud)];
                    contraseniaAleatoria += letra.ToString();
                }

                try
                {
                    resultado = objUsuario.UsuarioInserta(
                    this.txtNombreNombreCompleto.Text,
                    this.txtCorreo.Text,
                    contraseniaAleatoria,
                    this.ddlTipoUsuario.Text);
                }

                catch (Exception excepcionCapturada)
                {
                    mensaje += $"Ocurrió un error: {excepcionCapturada.Message}";
                }

                finally
                {
                    if (resultado)
                    {
                        mensaje += "El registro fue Insertado";
                    }
                }
                Response.Write("<script>alert('" + mensaje + "')</script>"); ;
            }
        }
    }
}