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
    public partial class frmCalculoListaSalarios : System.Web.UI.Page
    {
        PlanillasEntities modeloBD = new PlanillasEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnMostrarDatos_Click(object sender, EventArgs e)
        {
            cargaDatosGrid();
        }

        void cargaDatosGrid()
        {
            MantenimientoCalculo BLSalario = new MantenimientoCalculo();
            List<sp_RetornaEmpleadoSalario_Result> fuenteDatos =
                BLSalario.RetornaColaboradorSalario(this.txtApellido1.Text, this.txtApellido2.Text, this.txtNombre.Text);

            //Agregar al grid la fuente de datos
            this.grdListaSalarios.DataSource = fuenteDatos;
            //Indicarle al grid que se muestre
            this.grdListaSalarios.DataBind();
        }
    }
}