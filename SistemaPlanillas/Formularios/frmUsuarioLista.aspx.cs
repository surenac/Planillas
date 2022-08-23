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
    public partial class frmUsuarioLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargaDatosGrid();
        }
        void cargaDatosGrid()
        {
            //Crea la instancia de la clase que retornara los datos
             MantenimientoUsuarios Usuarios = new MantenimientoUsuarios();
            //Crea la variable que contiene los datos
            List<sp_UsuarioRetorna_Result> fuenteDatos =
                Usuarios.UsuarioRetorna();

            //Agregar al grid la fuente de datos
            this.grdListaUsuarios.DataSource = fuenteDatos;
            //Indicarle al grid que se muestre
            this.grdListaUsuarios.DataBind();
        }
    }
}