<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualiza registros.
*/
class Cuentasactualizar extends CI_Model{ 
	public function ActualizarCuenta($Accounts, $condiciones){
		//NOTA: las tablas no tienen restricciones
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
		$this->db->query("UPDATE Accounts SET 
			[Account Name] =?, 
			Phone=?,  
			[Last Modified Date]=?, 
			[Last Modified User]=?, 
			Email=? 
			WHERE [Account Number] =?", array(
					$Accounts["AccountName"], 
					$Accounts["Phone"],
					$Accounts["LastModifiedDate"], 
					$Accounts["LastModifiedUser"], 
					$Accounts["Email"], 
					$condiciones["AccountNumber"]));
						
		//inserto en la bitacora
		$this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('Accounts', 'UPDATE', '".$this->session->userdata("usuario")."', 'Se ACTUALIZO datos generales (AccountName, Phone, Email) de la cuenta No. ".$condiciones['AccountNumber']."')");
		//finalizao la transaccion
		$this->db->trans_complete();
		
		//comprobando si la transaccion ha tenido exito
		if($this->db->trans_status() === true){
			return true;
		}
		else{
			return false;
		}
	}
}