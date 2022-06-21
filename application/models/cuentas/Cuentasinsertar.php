<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo inserta registros.
*/
class Cuentasinsertar extends CI_Model{ 
	public function AgregarCuentaYtarjeta($Accounts, $Cards, $lsmCard, $las_sucursales, $id_sucursal_exclusiva){
		//NOTA: las tablas no tienen restricciones
		//insetor los datos en la tabla Accounts
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
		//validacion para ver si la cuenta es P, que traiga el siguinte correlativo, de lo contrario que se quede con el valor que trae
		if($Accounts["AccountNumber"] == "ESP"){
			//traigo el maximo de la tabla Accounts
			$Siguiente_Numero_Recargable = $this->db->query("select max(convert( int, DB_CONFIGURACIONES.dbo.EliminarCaracteres([Account Number]))) + 1 AS SIGUENTE_NUMERO
 from Datapark.dbo.Accounts");
			$Accounts["AccountNumber"] = "P".$Siguiente_Numero_Recargable->row()->SIGUENTE_NUMERO;
			$Cards["AccountNumber"] = $Accounts["AccountNumber"];
		}
		$this->db->query("INSERT INTO Accounts([Account Number], [Account Name], [First Name],
										[Last Name], ZIP, Phone, Fax, [Last Modified Date], [Last Modified User], NoPayDeactivate, DeactivateLimit,
										Multiple, Email, AutoCharge, CarpoolType, bToApplySurcharge)
									VALUES(?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $Accounts);
		//inserto en la tabla Cards
		$this->db->query("INSERT INTO Cards(
		[Card Number], 
		intMediaType, 
		intFacility, 
		UsageCard, 
		[Account Number], 
		[From Date],
		[To Date], 
		[First Name], 
		[Last Name], 
		[Auto Expire],
		VIP,		
		Message, 
		Code, 
		BillingPeriod, 
		LocID,
		Rate, 
		ParkerNumber,
		CardSubtype, 
		dtCreated, 
		dtModified, 
		strModifiedByUser)
									VALUES(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)", $Cards);
		
		//inserto en la tabla lsmCard
		$this->db->query("INSERT INTO lsmCard(
						strCardNumber,
						intMediaType, 
						intUsageType,
						intValid,
						bitResync,
						intRawStatus,
						intFacility,
						intTimeZone,
						intAccessLevel,
						dtModified,
						dtTimeCreation,
						dtValidFromDate,
						dtValidToDate,
						intEntryLane,
						intExitLane,
						intMachineNumber,
						mAmount,
						intDiscount,
						intOperator,
						intRoomNumber,
						intTicketNumber,
						intCCType,
						bitPaid,
						intUsage, 
						intLinkedCardMediaType,
						bitBackout,  
						bitJam, 
						intPaymentLane,
						intHintOldCmd,
						intTargetControllerID,
						intInvoice,
						intStatusEx,
						intActiveAccessLevel,
						intModifyReason,
						intPassThruLane,
						intAlarm,
						intHWCardStatusCode,
						intSetupTimeZone,
						intMaxUsageCount,
						intCurrentUsageCount,
						bitCheckUsageCount,
						intReUsePeriod,
						bitFacilitySynced,
						intUsageTypeModifiers,
						intPaymentType,
						intDiscountMerchantID,
						bitWaitList,
						intSanction,
						intLprEntryId,
						intLprExitId,
						intExtendedValidFrom,
						intExtendedValidTo,
						intDiscountUsedLane,
						intPassback,
						intCommStatus,
						intActivityLane,
						bIsExternalOveragePayment,
						intOperationNumber,
						intSubUsageType)
						VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", $lsmCard);
						
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Accounts'".", 'INSERT', '".$this->session->userdata("usuario")."', '".'Se AGREGO la cuenta No. '.$Accounts['AccountNumber']."'  + char(10) +'".' 
							Se AGREGO la tarjeta No. '.$Cards['CardNumber'].' para la cuenta en cuestion en la tabla Cards'."'
						 + char(10) + '".' Se AGREGO un registro en la tabla lsmCard para la cuenta en cuestion'."')");
		
		 /*
				si se ha elegido una sucursal en particular, los datos de lsmcard se insertaran en todas la sucursales pero con el intValid = 0, indicando que la tarejte esta invalida en las demas sucursales, exceto en la elegida en el select id_sucursal_exclusiva
		*/
		foreach($las_sucursales as $valor){
		$la_db = $valor->sucursal_nombre_db.".dbo";
		if($id_sucursal_exclusiva != "multi" and $id_sucursal_exclusiva != -9){
			if($id_sucursal_exclusiva != $valor->id_sucursal){
				$lsmCard["intValid"] = 0;
			}
			else{
				$lsmCard["intValid"] = 1;
			}
		}
		//inserto en la tabla lsmCard
		$this->db->query("INSERT INTO $la_db.lsmCard(
						strCardNumber,
						intMediaType, 
						intUsageType,
						intValid,
						bitResync,
						intRawStatus,
						intFacility,
						intTimeZone,
						intAccessLevel,
						dtModified,
						dtTimeCreation,
						dtValidFromDate,
						dtValidToDate,
						intEntryLane,
						intExitLane,
						intMachineNumber,
						mAmount,
						intDiscount,
						intOperator,
						intRoomNumber,
						intTicketNumber,
						intCCType,
						bitPaid,
						intUsage, 
						intLinkedCardMediaType,
						bitBackout,  
						bitJam, 
						intPaymentLane,
						intHintOldCmd,
						intTargetControllerID,
						intInvoice,
						intStatusEx,
						intActiveAccessLevel,
						intModifyReason,
						intPassThruLane,
						intAlarm,
						intHWCardStatusCode,
						intSetupTimeZone,
						intMaxUsageCount,
						intCurrentUsageCount,
						bitCheckUsageCount,
						intReUsePeriod,
						bitFacilitySynced,
						intUsageTypeModifiers,
						intPaymentType,
						intDiscountMerchantID,
						bitWaitList,
						intSanction,
						intLprEntryId,
						intLprExitId,
						intExtendedValidFrom,
						intExtendedValidTo,
						intDiscountUsedLane,
						intPassback,
						intCommStatus,
						intActivityLane,
						bIsExternalOveragePayment,
						intOperationNumber,
						intSubUsageType)
						VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", $lsmCard);
	
									  
					}
		
		
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
	public function Agregar_CuentaY_tarjeta_Comunes($Accounts, $Cards, $lsmCard, $las_sucursales, $id_sucursal_exclusiva, $id_sucursal){
		//NOTA: las tablas no tienen restricciones
		//insetor los datos en la tabla Accounts
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
		$this->db->query("INSERT INTO Accounts([Account Number], [Account Name], [First Name],
										[Last Name], ZIP, Phone, Fax, [Last Modified Date], [Last Modified User], NoPayDeactivate, DeactivateLimit,
										Multiple, Email, AutoCharge, CarpoolType, bToApplySurcharge)
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $Accounts);
		//inserto en la tabla Cards
		$this->db->query("INSERT INTO Cards(
		[Card Number], 
		intMediaType, 
		intFacility, 
		UsageCard, 
		[Account Number], 
		[From Date],
		[To Date], 
		[First Name], 
		[Last Name], 
		[Auto Expire],
		VIP,		
		Message, 
		Code, 
		BillingPeriod, 
		LocID,
		Rate, 
		ParkerNumber,
		CardSubtype, 
		dtCreated, 
		dtModified, 
		strModifiedByUser)
									VALUES(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)", $Cards);
		
		//inserto en la tabla lsmCard
		$this->db->query("INSERT INTO lsmCard(
						strCardNumber,
						intMediaType, 
						intUsageType,
						intValid,
						bitResync,
						intRawStatus,
						intFacility,
						intTimeZone,
						intAccessLevel,
						dtModified,
						dtTimeCreation,
						dtValidFromDate,
						dtValidToDate,
						intEntryLane,
						intExitLane,
						intMachineNumber,
						mAmount,
						intDiscount,
						intOperator,
						intRoomNumber,
						intTicketNumber,
						intCCType,
						bitPaid,
						intUsage, 
						intLinkedCardMediaType,
						bitBackout,  
						bitJam, 
						intPaymentLane,
						intHintOldCmd,
						intTargetControllerID,
						intInvoice,
						intStatusEx,
						intActiveAccessLevel,
						intModifyReason,
						intPassThruLane,
						intAlarm,
						intHWCardStatusCode,
						intSetupTimeZone,
						intMaxUsageCount,
						intCurrentUsageCount,
						bitCheckUsageCount,
						intReUsePeriod,
						bitFacilitySynced,
						intUsageTypeModifiers,
						intPaymentType,
						intDiscountMerchantID,
						bitWaitList,
						intSanction,
						intLprEntryId,
						intLprExitId,
						intExtendedValidFrom,
						intExtendedValidTo,
						intDiscountUsedLane,
						intPassback,
						intCommStatus,
						intActivityLane,
						bIsExternalOveragePayment,
						intOperationNumber,
						intSubUsageType)
						VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", $lsmCard);
						
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Accounts'".", 'INSERT', '".$this->session->userdata("usuario")."', '".'Se AGREGO la cuenta No. '.$Accounts['AccountNumber']."'  + char(10) +'".' 
							Se AGREGO la tarjeta No. '.$Cards['CardNumber'].' para la cuenta en cuestion en la tabla Cards'."'
						 + char(10) + '".' Se AGREGO un registro en la tabla lsmCard para la cuenta en cuestion'."')");
		
		//pongo a 0 el intValid en todas las sucursales y luego abajo recorro para actulizar las que seran validas
		$lsmCard["intValid"] = 0;
		foreach($las_sucursales as $valor){
			
		$la_db = $valor->sucursal_nombre_db.".dbo";
		
		//inserto en la tabla lsmCard
		$this->db->query("INSERT INTO $la_db.lsmCard(
						strCardNumber,
						intMediaType, 
						intUsageType,
						intValid,
						bitResync,
						intRawStatus,
						intFacility,
						intTimeZone,
						intAccessLevel,
						dtModified,
						dtTimeCreation,
						dtValidFromDate,
						dtValidToDate,
						intEntryLane,
						intExitLane,
						intMachineNumber,
						mAmount,
						intDiscount,
						intOperator,
						intRoomNumber,
						intTicketNumber,
						intCCType,
						bitPaid,
						intUsage, 
						intLinkedCardMediaType,
						bitBackout,  
						bitJam, 
						intPaymentLane,
						intHintOldCmd,
						intTargetControllerID,
						intInvoice,
						intStatusEx,
						intActiveAccessLevel,
						intModifyReason,
						intPassThruLane,
						intAlarm,
						intHWCardStatusCode,
						intSetupTimeZone,
						intMaxUsageCount,
						intCurrentUsageCount,
						bitCheckUsageCount,
						intReUsePeriod,
						bitFacilitySynced,
						intUsageTypeModifiers,
						intPaymentType,
						intDiscountMerchantID,
						bitWaitList,
						intSanction,
						intLprEntryId,
						intLprExitId,
						intExtendedValidFrom,
						intExtendedValidTo,
						intDiscountUsedLane,
						intPassback,
						intCommStatus,
						intActivityLane,
						bIsExternalOveragePayment,
						intOperationNumber,
						intSubUsageType)
						VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", $lsmCard);
	
									  
					}
		
		//acualizo las sucursuales que seran comunes
		foreach($id_sucursal as $valor){
			$sucursales_comunes	= $this->Traer_Sucrusal_Por_ID($valor);
			$la_db = $sucursales_comunes->sucursal_nombre_db.".dbo";
			$lsmCardValid = array(
				"intValid"=>1,
				"strCardNumber"=>$lsmCard["strCardNumber"],
				"intMediaType"=>$lsmCard["intMediaType"],
				"intFacility"=>$lsmCard["intFacility"]
			);
			$this->db->query("UPDATE $la_db.lsmCard SET intValid = ? WHERE strCardNumber =? AND intMediaType =? AND intFacility =?", $lsmCardValid);
		}
		
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
	public function Traer_Sucrusal_Por_ID($id_sucursal){
		$resultado = $this->db->query("SELECT id_sucursal, sucursal_nombre, sucursal_nombre_db, sucursal_prefijo FROM DB_CONFIGURACIONES.dbo.adm_Sucursal WHERE id_sucursal =?", $id_sucursal);
		$fila = $resultado->row(); 
		return $fila;
	}
	
}