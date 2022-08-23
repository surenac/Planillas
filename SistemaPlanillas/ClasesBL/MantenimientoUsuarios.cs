using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SistemaPlanillas.Modelos;

namespace SistemaPlanillas.ClasesBL
{
    public class MantenimientoUsuarios
    {
        PlanillasEntities modeloBD = new PlanillasEntities();

        public List<sp_UsuarioRetorna_Result>
        UsuarioRetorna()
        {
            //Crear la variable que se retorna
            List<sp_UsuarioRetorna_Result> resultado = new List<sp_UsuarioRetorna_Result>();
            //Asignar a la variable el resultado del llamado del procedimiento almacenado
            resultado = this.modeloBD.sp_UsuarioRetorna().ToList();
            //Retorna el valor
            return resultado;
        }
        public bool UsuarioInserta(string pNombreCompleto, string pCorreoElectronico, 
        string pContrasena, string pTipoUsuario)
        {
            //Variable que posee la cantidad de registros afectados al realizar Insert/Update/Delete 
            //La cantidad de registros afectados debe ser mayor a 0
            int registrosAfectados = 0;
            //Invocar al procecimiento almacenado
            this.modeloBD.sp_UsuarioInserta(pNombreCompleto, pCorreoElectronico, pContrasena, pTipoUsuario);

            if (registrosAfectados > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public sp_UsuarioRetornaID_Result RetornaUsuarioID(int pIdUsuario)
        {
            //Crear la variable que se retornara
            sp_UsuarioRetornaID_Result resultado = new sp_UsuarioRetornaID_Result();

            resultado =
                this.modeloBD.sp_UsuarioRetornaID(pIdUsuario).FirstOrDefault();

            return resultado;
        }
        public bool UsuarioModifica(int pIdUsuario, string pNombreCompleto, string pCorreoElectronico, string pTipoUsuario)
        {
            int registrosAfectados = 0;
            registrosAfectados =
                this.modeloBD.sp_UsuarioModifica(
                    pIdUsuario,
                    pNombreCompleto,
                    pCorreoElectronico,
                    pTipoUsuario);

            return registrosAfectados > 0;
        }
        public bool UsuarioElimina(int pIdUsuario)
        {
            int registrosAfectados = 0;

            registrosAfectados =
                this.modeloBD.sp_UsuarioElimina(pIdUsuario);

            return registrosAfectados > 0;
        }
    }
}