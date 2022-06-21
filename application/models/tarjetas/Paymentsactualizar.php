<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualizar registros.
*/
class Paymentsactualizar extends CI_Model{ 
public function AjustarRecarga($PaymentsData, $PaymentsCondicion){
	
		//inicio transaccion
		$this->db->trans_begin();
		
		//actualiza la tabal Accounts campo AccountBalance volviendole el saldo que tenia antes de la recarga
		$this->db->query("UPDATE Accounts SET AccountBalance = ? WHERE [Account Number] =?", array($PaymentsData["balaceNuevo"], $PaymentsCondicion["account_number"]));
		
		//actualizo el valor del Amount de la tabla Payments
		$this->db->query("UPDATE Payments SET Amount =?  WHERE RecNo = ? AND Notes =? AND Amount=? AND [Account Number] =?", array($PaymentsData['valorRealRecarga'], $PaymentsCondicion['RecNo'], $PaymentsCondicion['Notes'], $PaymentsCondicion['Amount'], $PaymentsCondicion['account_number'] ));
		
		
		/*
		//si el valdor del nueveo balaceNuevo es 0 entonces, esa cuenta debe ponerse a Vld -1 en la tabla lsmCard
		if($PaymentsData["balaceNuevo"] === 0){
			//actualizo la tabla lsmCard para que la tarjeta la ponga invalida Vld en cart manager
			
			$this->db->query('UPDATE lsmCard SET intValid = -1 
							WHERE  strCardNumber = ?
							AND intMediaType = ? 
							AND intFacility  = ?', $datosTransaccion);
			
		}*/
	
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Accounts'".", 'UPDATE', '".$this->session->userdata("usuario")."', '".
							'Se actualizo el valor de la recarga en la tabla Payments el campo Amount con valor de '.$PaymentsData['balaceNuevo'].'  de la cuenta No. '.$PaymentsCondicion['account_number']." por AJUSTE de recarga'  + char(10) +'".' 
						Se actualizo el AccountBalance de la tabla Accounts de '.abs($PaymentsData["AccountBalanceAnterior"]).' a '.abs($PaymentsData['balaceNuevo']).' para la cuenta en cuestion'."')");
						
		
		
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