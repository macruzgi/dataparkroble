<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo eliminar registros.
*/
class Paymentseliminar extends CI_Model{ 
	public function RevertirRecarga($PaymentsData, $PaymentsCondicion, $datosTransaccion, $las_sucursales){
	
		//inicio transaccion
		$this->db->trans_begin();
		//elimino el registro la tabla Payments
		//creo que no se deberia eliminar solo poner a 00
		
		$this->db->query("DELETE FROM Payments 
			WHERE RecNo = ? 
			AND Notes =? 
			AND Amount=? 
			AND [Account Number] =?", $PaymentsCondicion);
		
		//recorro las sucursales y elimino el Payments de cada sucursal sin importar sean recargables, exclusivas o cumunitarias.
		foreach($las_sucursales as $la_sucural){
			//NOTA IMPORTANTE: el filtro para eliminar el payment de las otras sucursales solo sera por Notes que es el numero de la transaccion, Amount y AccountNumber se quita el RecNo es IDENTITY y es incremental y no van en el mismo valor
			$la_db = $la_sucural->sucursal_nombre_db.".dbo";
			$this->db->query("DELETE FROM $la_db.Payments 
				WHERE Notes =? 
				AND Amount=? 
				AND [Account Number] =?", array(
					$PaymentsCondicion["numero_transaccion"], 
					$PaymentsCondicion["Amount"], 
					$PaymentsCondicion["account_number"]
				)
			);
			
		}
		
		//actualiza la tabal Accounts campo AccountBalance volviendole el saldo que tenia antes de la recarga
		$this->db->query("UPDATE Accounts 
				SET AccountBalance = ? 
				WHERE [Account Number] =?", 
					array($PaymentsData["balaceNuevo"], 
						$PaymentsCondicion["account_number"])
					);
	
		//si el valdor del nueveo balaceNuevo es 0 entonces, esa cuenta debe ponerse a Vld 0 en la tabla lsmCard
		if($PaymentsData["balaceNuevo"] === 0){
			//actualizo la tabla lsmCard para que la tarjeta la ponga invalida Vld en cart manager
			/*
			$this->db->query('UPDATE lsmCard SET intValid = -1 
							WHERE  strCardNumber = ?
							AND intMediaType = ? 
							AND intFacility  = ?', $datosTransaccion);
			*/
		}
	
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Payments'".", 'DELETE', '".$this->session->userdata("usuario")."', '".
							'Se eliminio la recarga con valor de '.$PaymentsCondicion['Amount'].'  de la cuenta No. '.$PaymentsCondicion['account_number']." por REVERSION de recarga'  + char(10) +'".' 
						Se actualizo el AccountBalance de la tabla Accounts de '.abs($PaymentsData["AccountBalanceAnterior"]).' a '.abs($PaymentsData['balaceNuevo']).' para la cuenta en cuestion'."'
						 + char(10) + '".' Se actualiza el intValid a -1 de la tabla lsmCard AUN NO SE ACUTALIZA ESTA TABLA'."')");
						
		
		
		//comprobando si la transaccion ha tenido exito
		if ($this->db->trans_status() === FALSE){
			$this->db->trans_rollback();
			return false;
		}
		else{
			$this->db->trans_commit();
			return true;
		}
	}
}