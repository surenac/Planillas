using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaPlanillas.Formularios
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(this.Session["usuariologueado"]) != true)
            {
                this.Response.Redirect("~/Formularios/frmLoggin.aspx");
            }
            else
            {
                this.VerificaPermisosTipoUsuario();
            }
            /// <summary>
            /// Usando la variable de session tipo usuario muestra o oculta opciones del menu
            /// </summary>*/
        }
        void VerificaPermisosTipoUsuario()
        {
            if (Convert.ToString(this.Session["tipousuario"]) == "Adm")
            {
                this.hpListaUsuario.Visible = true;
                this.hpUsuarioInserta.Visible = true;
                this.hpColaboradorLista.Visible = true;
                this.hpColaboradorInserta.Visible = true;
                this.hpCalculoSalarios.Visible = true;
                this.hpReporte.Visible = true;
            }
            else
            {
                this.hpListaUsuario.Visible = false;
                this.hpUsuarioInserta.Visible = false;
                this.hpColaboradorLista.Visible = true;
                this.hpColaboradorInserta.Visible = false;
                this.hpCalculoSalarios.Visible = false;
                this.hpReporte.Visible = true;
            }
        }
    }
}