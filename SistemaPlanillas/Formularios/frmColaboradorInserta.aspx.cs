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
    public partial class frmColaboradorInserta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtFecha.Visible = false;
        }

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            txtFecha.Text = Calendario.SelectedDate.ToString("yyyy-MM-dd");
        }

        protected void btAceptar_Click(object sender, EventArgs e)
        {
            this.AlmacenarDatos();
        }
        void AlmacenarDatos()
        {
            if (this.IsValid)
            {
                MantenimientoColaborador objColaborador = new MantenimientoColaborador();
                bool resultado = false;
                string mensaje = "";
                try
                {
                    /*Asignar a la variable el resultado de invocar el procedimiento almacenado
                     que se encuentra en el metodo*/
                    resultado = objColaborador.ColaboradorInserta(
                    Convert.ToInt32(this.txtCedula.Text),
                    this.txtNombre.Text,
                    this.txtPrimerApellido.Text,
                    this.txtSegundoApellido.Text,
                    this.ddlGenero.SelectedValue,
                    this.txtCorreo.Text,
                    this.txtDireccion.Text,
                    Convert.ToDecimal(this.txtTelefono.Text),
                    Convert.ToDateTime(this.txtFecha.Text),
                    Convert.ToDecimal(this.txtSalario.Text)
                    );
                    //System.Diagnostics.Debug.WriteLine(Convert.ToInt32(this.ddlGenero.SelectedIndex));
                }
                //Catch: Solo se ejecuta en el caso de que haya una excepcion 
                //excepcionCapturada: Posee los datos de la excepcion
                catch (Exception excepcionCapturada)
                {
                    mensaje += $"Ocurrió un error: {excepcionCapturada.Message}";
                }
                //Finaly: Siempre se ejecuta (Se atrape o no la excepcion)
                finally
                {
                    //Si el resultado de la variable es verdadera implica que el procedimineto no retorno errores
                    if (resultado)
                    {
                        mensaje += "El registro fue Insertado";
                    }
                }
                ///mostrar el mensaje
                Response.Write("<script>alert('" + mensaje + "')</script>"); ;
            }
        }
    }
}