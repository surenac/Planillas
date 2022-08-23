using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaPlanillas.Modelos;

namespace SistemaPlanillas.ClasesBL
{
    public class MantenimientoCalculo
    {
        PlanillasEntities modeloBD = new PlanillasEntities();

        public List<sp_RetornaEmpleadoSalario_Result>
        RetornaColaboradorSalario(string pPrimerApellido = null, string pSegundoApellido = null, string pNombre = null, string pFechaPago = null)
        {
            //Crear la variable que se retorna
            List<sp_RetornaEmpleadoSalario_Result> resultado = new List<sp_RetornaEmpleadoSalario_Result>();
            //Asignar a la variable el resultado del llamado del procedimiento almacenado
            resultado = this.modeloBD.sp_RetornaEmpleadoSalario(pPrimerApellido, pSegundoApellido, pNombre, pFechaPago).ToList();
            //Retorna el valor
            return resultado;
        }
        public bool CalculoInserta(int pIdColaborador, int pDiasLaborador, int pIdTurno, decimal pHorasExtras,
            decimal pSeguroSocial, decimal pImpuestoRenta, decimal pAsociacion, int pOtrosRebajos, decimal pTotalPago,
            decimal pVacaciones, decimal pAguinaldo, decimal pCesantia, DateTime pfechaPago)
        {
            //Variable que posee la cantidad de registros afectados al realizar Insert/Update/Delete 
            //La cantidad de registros afectados debe ser mayor a 0
            int registrosAfectados = 0;
            //Invocar al procecimiento almacenado
            this.modeloBD.sp_CalculaInserta(pIdColaborador, pDiasLaborador, pIdTurno, pHorasExtras, pSeguroSocial,
                pImpuestoRenta, pAsociacion, pOtrosRebajos, pTotalPago, pVacaciones, pAguinaldo, pCesantia, pfechaPago);

            if (registrosAfectados > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public sp_RetornaEmpleadoSalarioID_Result RetornaEmpleadoSalarioID (int pIdRegistro)
        {
            //Crear la variable que se retornara
            sp_RetornaEmpleadoSalarioID_Result resultado = new sp_RetornaEmpleadoSalarioID_Result();

            resultado =
                this.modeloBD.sp_RetornaEmpleadoSalarioID(pIdRegistro).FirstOrDefault();

            return resultado;
        }
        public bool ModificaEmpleadoSalario(int pIdRegistro, int pIdColaborador, int pDiasLaborados, int pIdTurno, decimal pHorasExtras,
            decimal pSeguroSocial, decimal pImpuestoRenta, decimal pAsociacion, int pOtrosRebajos, decimal pPagoTotal, decimal pVacaciones,
            decimal pAguinaldo, decimal pCesantia, DateTime pFechaPago)
        {
            ///variable que posee la cantidad de registros afectados
            ///al realizar insert/update/delete la cantidad de 
            ///registros afectados debe ser mayor a 0
            int registrosAfectados = 0;
            ///invocar al procedimiento almacenado
            registrosAfectados =
                this.modeloBD.sp_CalculaModifica(
                    pIdRegistro,
                    pIdColaborador,
                    pDiasLaborados,
                    pIdTurno,
                    pHorasExtras,
                    pSeguroSocial,
                    pImpuestoRenta,
                    pAsociacion,
                    pOtrosRebajos,
                    pPagoTotal,
                    pVacaciones,
                    pAguinaldo,
                    pCesantia,
                    pFechaPago);

            return registrosAfectados > 0;
        }
    }
}