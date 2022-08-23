using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaPlanillas.Modelos;
using System.IO;
using Microsoft.Reporting.WebForms;

namespace SistemaPlanillas.Formularios
{
    public partial class Reporte : System.Web.UI.Page
    {
        PlanillasEntities ModeloBD = new PlanillasEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btVerReporte_Click(object sender, EventArgs e)
        {
            this.contruirReporte();
        }
        void contruirReporte()
        {

            ///indicar la ruta del reporte
            string rutaReporte = "~/Reportes/Report1.rdlc";
            ///construir la ruta física
            string rutaServidor = Server.MapPath(rutaReporte);
            ///Validar que la ruta física exista
            if (!File.Exists(rutaServidor))
            {
                this.lblResultado.Text =
                    "El reporte seleccionado no existe";
                return;
            }
            else
            {
                rpvClientes.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rpvClientes.LocalReport.GetDataSourceNames();
                ///limpiar los datos de la fuente de datos
                rpvClientes.LocalReport.DataSources.Clear();
                ///obtener los datos del reporte
                List<sp_RetornaEmpleadoSalario_Result> datosReporte =
                    this.retornaDatosReporte(this.txtPrimerApellido.Text, this.txtSegundoApellido.Text, this.txtNombre.Text, this.txtFechaPago.Text);
                ///crear la fuente de datos
                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;
                // agregar la fuente de datos al reporte
                this.rpvClientes.LocalReport.DataSources.Add(fuenteDatos);

                /// mostrar los datos en el reporte
                this.rpvClientes.LocalReport.Refresh();
            }
        }
        /// <summary>
        /// Función que retorna la fuente de datos a mostrar en el reporte
        /// </summary>
        /// <param name="pPrimerApellido"></param>
        /// <param name="pNombre"></param>
        /// <returns></returns>
        List<sp_RetornaEmpleadoSalario_Result> retornaDatosReporte(
            string pPrimerApellido, string pSegundoApellido, string pNombre, string pFechaPago)
        {
            return
                  this.ModeloBD.sp_RetornaEmpleadoSalario(pPrimerApellido, pSegundoApellido, pNombre, pFechaPago).ToList();
        }
    }
}