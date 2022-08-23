using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaPlanillas.Modelos;

namespace SistemaPlanillas.ClasesBL
{
    public class MantenimientoColaborador
    {
        PlanillasEntities modeloBD = new PlanillasEntities();

        public List<sp_ColaboradorRetorna_Result>
        RetornaColaborador(string pPrimerApellido = null, string pSegundoApellido = null, string pNombre = null)
        {
            //Crear la variable que se retorna
            List<sp_ColaboradorRetorna_Result> resultado = new List<sp_ColaboradorRetorna_Result>();
            //Asignar a la variable el resultado del llamado del procedimiento almacenado
            resultado = this.modeloBD.sp_ColaboradorRetorna(pPrimerApellido, pSegundoApellido, pNombre).ToList();
            //Retorna el valor
            return resultado;
        }

        public bool ColaboradorInserta(int pCedula, string pNombre, string pPrimerApellido, 
            string pSegundoApellido, string pGenero, string pCorreoElectronico, string pDireccionFisica,
            decimal pIdTelefono, DateTime pFechaIngreso, decimal pSalarioBase)
        {
            //Variable que posee la cantidad de registros afectados al realizar Insert/Update/Delete 
            //La cantidad de registros afectados debe ser mayor a 0
            int registrosAfectados = 0;
            //Invocar al procecimiento almacenado
            this.modeloBD.sp_ColaboradorInserta(pCedula, pNombre, pPrimerApellido, pSegundoApellido,
                pGenero, pCorreoElectronico, pDireccionFisica, pIdTelefono, pFechaIngreso, pSalarioBase);

            if (registrosAfectados > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public sp_ColaboradorRetornaID_Result RetornaColaboradorID(int pIdColaborador)
        {
            //Crear la variable que se retornara
            sp_ColaboradorRetornaID_Result resultado = new sp_ColaboradorRetornaID_Result();

            resultado =
                this.modeloBD.sp_ColaboradorRetornaID(pIdColaborador).FirstOrDefault();

            return resultado;
        }

        public bool ColaboradorModifica(int pIdColaborador, int pCedula, string pNombre,
          string pPrimerApellido, string pSegundoApellido, string pGenero, string pCorreo,
          string pDireccionFisica, decimal pIdTelefono, DateTime pFechaNacimiento, decimal pSalarioBase)
        {

            int registrosAfectados = 0;

            registrosAfectados =
                this.modeloBD.sp_ColaboradorModifica(
                    pIdColaborador,
                    pCedula,
                    pNombre,
                    pPrimerApellido,
                    pSegundoApellido,
                    pGenero,
                    pCorreo,
                    pDireccionFisica,
                    pIdTelefono,
                    pFechaNacimiento,
                    pSalarioBase);

            return registrosAfectados > 0;
        }

        public bool ColaboradorElimina(int pIdColaborador)
        {
            ///variable que posee la cantidad de registros afectados
            ///al realizar insert/update/delete la cantidad de 
            ///registros afectados debe ser mayor a 0
            int registrosAfectados = 0;
            ///invocar al procedimiento almacenado
            registrosAfectados =
                this.modeloBD.sp_ColaboradorElimina(pIdColaborador);

            return registrosAfectados > 0;
        }
    }
}