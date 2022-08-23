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
    public partial class frmColaboradorLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMostrarDatos_Click(object sender, EventArgs e)
        {
            cargaDatosGrid();
        }
        void cargaDatosGrid()
        {
            MantenimientoColaborador BLCliente = new MantenimientoColaborador();
            List<sp_ColaboradorRetorna_Result> fuenteDatos =
                BLCliente.RetornaColaborador(this.txtApellido1.Text, this.txtApellido2.Text, this.txtNombre.Text);

            //Agregar al grid la fuente de datos
            this.grdListaColaborador.DataSource = fuenteDatos;
            //Indicarle al grid que se muestre
            this.grdListaColaborador.DataBind();
        }
    }
}