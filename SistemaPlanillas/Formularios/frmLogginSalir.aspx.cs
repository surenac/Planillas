using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaPlanillas.Formularios
{
    public partial class frmLogginSalir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            ///Nombre Variable, valor de la variable
            this.Session.Add("nombreusuario", null);
            this.Session.Add("idusuario", null);
            this.Session.Add("tipousuario", null);
            this.Session.Add("usuariologueado", null);
            //Redireccionar a la pagina inicial
            this.Response.Redirect("~/Formularios/frmLoggin.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("~/Formularios/frmPaginaPrincipal.aspx");
        }

    }
}