using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaPlanillas.Modelos;

namespace SistemaPlanillas.Formularios
{
    public partial class frmLoggin : System.Web.UI.Page
    {
        PlanillasEntities modeloBD = new PlanillasEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btAceptar_Click(object sender, EventArgs e)
        {
            //Validar que todas las reglas del formulario
            //Se cumplan
            if (this.Page.IsValid)
            {
                this.RealizarAutenticacion();
            }
        }
        void RealizarAutenticacion()
        {
            sp_RetornaUsuarioCorreoPwd_Result
                resultadoSP =
                this.modeloBD.sp_RetornaUsuarioCorreoPwd(this.txtCorreo.Text, this.txtContrasena.Text).FirstOrDefault();
            //Verificar si el objeto es nulo, si lo es entonces el usuario o el password es incorrecto
            if (resultadoSP == null)
            {
                this.lblResultado.Text = "Datos Invalidos";
                this.Session.Add("nombreusuario", null);
                this.Session.Add("idusuario", null);
                this.Session.Add("tiposuario", null);
                this.Session.Add("usuariologueado", null);
            }
            else
            {
                //Variable de Session 
                //**************** es Case-Sensitive
                //                 Nombre VAriable, valor de la variable
                this.Session.Add("nombreusuario", resultadoSP.nombreCompleto);
                this.Session.Add("idusuario", resultadoSP.id_Usuario);
                this.Session.Add("tipousuario", resultadoSP.tipoUsuario);
                this.Session.Add("usuariologueado", true);
                //Redireccionar a la pagina inicial
                //this.Response.Redirect("~/Formuladios_BD/frmClienteLista.aspx");
                this.Response.Redirect("~/Formularios/frmPaginaPrincipal.aspx");
            }
        }
    }
}