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
    public partial class frmColaboradorElimina : System.Web.UI.Page
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
                this.Request.QueryString["idColaborador"];

            //validar si el parametro es correcto
            if (String.IsNullOrEmpty(parametro))
            {
                Response.Write("<script>alert('Parámetro nulo')</script>");
            }
            else
            {
                int idColaborador = Convert.ToInt16(parametro);
                MantenimientoColaborador objColaborador = new MantenimientoColaborador();
                sp_ColaboradorRetornaID_Result datosColaborador = new sp_ColaboradorRetornaID_Result();

                ///invocar al procedimiento
                datosColaborador =
                    objColaborador.RetornaColaboradorID(idColaborador);
                if (datosColaborador == null)
                {
                    Response.Redirect("frmColaboradorLista.aspx");
                }
                else
                {
                    this.txtCedula.Text = Convert.ToString(datosColaborador.cedula);
                    this.txtNombre.Text = datosColaborador.Nombre;
                    this.txtPrimerApellido.Text = datosColaborador.primerApellido;
                    this.txtSegundoApellido.Text = datosColaborador.segundoApellido;
                    this.ddlGenero.SelectedIndex = ddlGenero.Items.IndexOf(ddlGenero.Items.FindByText(datosColaborador.Genero));
                    this.txtCorreo.Text = datosColaborador.correoElectronico;
                    this.txtDireccion.Text = datosColaborador.direccionFisica;
                    this.txtTelefono.Text = Convert.ToString(datosColaborador.telefono);
                    this.txtFecha.Text = datosColaborador.fechaIngreso.ToString("yyyy/MM/dd");
                    this.txtSalario.Text = Convert.ToString(datosColaborador.salarioBase);
                    this.hdIdColaborador.Value = datosColaborador.idColaborador.ToString("D");
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
                MantenimientoColaborador objColaborador = new MantenimientoColaborador();
                bool resultado = false;
                string mensaje = "";
                try
                {
                    //Obtener el id del registro original
                    int idColaborador = Convert.ToInt16(this.hdIdColaborador.Value);
                    //Asignar a la variable el resultado de invocar el procedimiento almacenado
                    resultado = objColaborador.ColaboradorElimina(idColaborador);
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