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
    public partial class frmCalculoSalarios : System.Web.UI.Page
    {
        PlanillasEntities modeloBD = new PlanillasEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.cargaColaborador();
                this.cargaTurnoLaboral();
                this.ddlSalario.Visible = false;
                this.txtSalarioBase.Enabled = false;
                this.txtFechaPago.Visible = false;
            }
        }
        void cargaColaborador()
        {
            List<sp_RetornaEmpleado_Result> listaColaborador =
                this.modeloBD.sp_RetornaEmpleado().ToList();
            //Asignar al dropdownlista la fuente de datos
            this.ddlColaborador.DataSource = listaColaborador;
            this.ddlColaborador.DataBind();
            //Agregar el elemento que obliga al usuario a seleccionar una opcion validad
            //dataTextField, dataValueField
            this.ddlColaborador.Items.Insert(0, new ListItem("Favor seleccione un Colaborador", ""));
            //Indicarle a la lista que su valor seleccionado es la opcion agregada previamente
            this.ddlColaborador.SelectedValue = "";
        }

        protected void ddlColaborador_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.cargaSalarioColaborador(Convert.ToInt32(this.ddlColaborador.SelectedValue));
            cargaSalarioColaborador(Convert.ToInt32(this.ddlColaborador.SelectedValue));
            txtSalarioBase.Text = Convert.ToString(ddlSalario.SelectedItem);
        }

        void cargaSalarioColaborador(int idColaborador)
        {
            sp_RetornaEmpleado_Result datosSalario = new sp_RetornaEmpleado_Result();

            idColaborador = Convert.ToInt16(this.ddlColaborador.SelectedValue);
            List<sp_RetornaEmpleado_Result> listaSalarios =
                this.modeloBD.sp_RetornaEmpleado().ToList();
            //Asignar al dropdownlista la fuente de datos
            this.ddlSalario.DataSource = listaSalarios;
            this.ddlSalario.DataBind();
            //Agregar el elemento que obliga al usuario a seleccionar una opcion validad
            //dataTextField, dataValueField
            this.ddlSalario.Items.Insert(0, new ListItem("Favor seleccione un Salario", ""));
            //Indicarle a la lista que su valor seleccionado es la opcion agregada previamente
            this.ddlSalario.SelectedValue = this.ddlColaborador.SelectedValue;
        }

        void cargaTurnoLaboral()
        {
            List<RetornaTurno_Result> listaTurno =
                this.modeloBD.RetornaTurno("").ToList();
            //Asignar al dropdownlista la fuente de datos
            this.ddlTurnoLaboral.DataSource = listaTurno;
            this.ddlTurnoLaboral.DataBind();
            //Agregar el elemento que obliga al usuario a seleccionar una opcion validad
            //dataTextField, dataValueField
            this.ddlTurnoLaboral.Items.Insert(0, new ListItem("Favor seleccione un Turno", ""));
            //Indicarle a la lista que su valor seleccionado es la opcion agregada previamente
            this.ddlTurnoLaboral.SelectedValue = "";
        }

        protected void btAceptar_Click(object sender, EventArgs e)
        {
            this.AlmacenarDatos();
        }
        void AlmacenarDatos()
        {
            if (this.IsValid)
            {
                MantenimientoCalculo objCalculo = new MantenimientoCalculo();

                bool resultado = false;
                string mensaje = "";

                decimal salario = Convert.ToDecimal(this.txtSalarioBase.Text);
                int diasLaborados = Convert.ToInt32(this.txtDiasLaborador.Text);
                decimal horasExtras = Convert.ToDecimal(this.txtHorasExtras.Text);

                diasLaborados = 30 - diasLaborados;
                decimal salarioBruto = (salario / 30) * diasLaborados;

                if (Convert.ToInt32(this.ddlTurnoLaboral.SelectedValue) == 1)
                {
                    decimal horaDiurna = (salario / 240) * 1.5m;
                    horasExtras = horaDiurna * horasExtras;
                }

                if (Convert.ToInt32(this.ddlTurnoLaboral.SelectedValue) == 2)
                {
                    decimal horaNocturna = (salario / 180) * 1.5m;
                    horasExtras = horaNocturna * horasExtras;
                }

                if (Convert.ToInt32(this.ddlTurnoLaboral.SelectedValue) == 3)
                {
                    decimal horaMixta = (salario / 210) * 1.5m;
                    horasExtras = horaMixta * horasExtras;
                }

                decimal salarioDevengado = (salarioBruto + horasExtras);
                decimal seguroSocial = (salarioBruto + horasExtras) * 0.105m;
                decimal asociacion = (salarioBruto + horasExtras) * 0.10m;
                int rebajos = Convert.ToInt32(this.txtRebajos.Text);
                decimal renta = 0;

                if(salarioDevengado < 863000)
                {
                    renta = 0; 
                }

                if (salarioDevengado > 863000 && salarioDevengado <= 1126700)
                {
                    renta = ((salarioDevengado - 863000) * 0.10m);
                }

                if (salarioDevengado > 1126700 && salarioDevengado <= 2223000)
                {
                    renta = ((salarioDevengado - 1267000) * 0.15m) + 40400;
                }

                if (salarioDevengado > 2223000 && salarioDevengado <= 4445000)
                {
                    renta = ((salarioDevengado - 2223000) * 0.20m) + 183800;
                }

                if (salarioDevengado > 4445000)
                {
                    renta = ((salarioDevengado - 4445000) * 0.15m) + 628200;
                }

                decimal totalPago = salarioBruto + horasExtras - asociacion - seguroSocial - rebajos;

                decimal vacaciones = salarioDevengado /100 * 4.33m;
                decimal aguinaldo = salarioDevengado / 100 * 8.33m;
                decimal cesantia = salarioDevengado / 100 * 5.33m;

                try
                {
                    
                    /*Asignar a la variable el resultado de invocar el procedimiento almacenado
                     que se encuentra en el metodo*/
                    resultado = objCalculo.CalculoInserta(
                    Convert.ToInt32(this.ddlColaborador.SelectedValue),
                    diasLaborados,
                    Convert.ToInt32(this.ddlTurnoLaboral.SelectedValue),
                    horasExtras,
                    seguroSocial,
                    renta,
                    asociacion,
                    rebajos,
                    totalPago,
                    vacaciones,
                    aguinaldo,
                    cesantia,
                    Convert.ToDateTime(this.txtFechaPago.Text)
                    );

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

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaPago.Text = Calendario.SelectedDate.ToString("yyyy-MM-dd");
        }
    }
}