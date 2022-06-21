<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo inserta registros.
*/
class Tarjetasinsertar extends CI_Model{ 
	public function RegistrarFacilityCode($adm_Tarjetas){
		//inicio transaccion
		$this->db->trans_start();
		$resultado = $this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Tarjetas (intFacility,estado_facility)
									VALUES(?, 1)", $adm_Tarjetas);
		$this->db->query("INSERT INTO cfgFacilityCodes (intCode)
									VALUES(?)", $adm_Tarjetas);
		//inserto en la bitacora
		$this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('adm_Tarjetas', 'INSERT', '".$this->session->userdata("usuario")."', "."'Se AGREGO el Facility Code: ".$adm_Tarjetas['intFacility']."'  + char(10) + '"."  Y se INSERTO en la tabla cfgFacilityCodes el valor de intFacility en el campo intCode')");
							
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
	public function RegistrarTarjeta($Cards, $lsmCard, $id_sucursal, $las_sucursales, $Ver_Tipo_De_Cuenta){
		//NOTA: las tablas no tienen restricciones
			
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
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
							VALUES('."'Cards'".", 'INSERT', '".$this->session->userdata("usuario")."', '".' 
							Se AGREGO la tarjeta No. '.$Cards['CardNumber'].' para la cuenta No. '.$Cards['AccountNumber'].' en la tabla Cards'."'
						 + char(10) + '".' Se AGREGO un registro en la tabla lsmCard para la cuenta en cuestion'."')");
		
		/*
				si se ha elegido una sucursal en particular, los datos de lsmcard se insertaran en todas la sucursales pero con el intValid = 0, indicando que la tarejte esta invalida en las demas sucursales, luego se actulizara a 1 la que se hayan selecciondo traidas en la variable id_sucursal[], siempre y cuando la tarjeta sea comunitaria
		*/
		
		
		/*if($ES_COMUNITARIA == 1){
			$lsmCard["intValid"] = 0;
		}*/
		//si el campo ZIP=ES_COMUNITARIA es CU, la cuenta y tarjetas es comunitaria cuenta universal
		//si el campo ZIP=ES_COMUNITARIA tiene el nombre de las bases de datos, entonces, la cuenta y tarjetas son exclusiva de esa db
		
		//primer if es P=RECARGABLE, el campo ZIP= ES_COMUNITARIA no tinene ningun valor
		if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA == ''){
				//inserto las P=RECARGABLES
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
		}
		//segundo if son Cuenta y Tarjetas EXPLUSIVAS, el campo ZIP=ES_COMUNITARIA tiene el nombre de la db a la que corresponden esa cuenta y tarjetas
		if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "" && $Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "CU"){
			foreach($las_sucursales as $valor){
				$la_db = $valor->sucursal_nombre_db.".dbo";
				//si el nombre de la db de las sucursales recorridas es distinta al nombre de la db verficada del campo ZIP=ES_COMUNITARIA, significa que a esas se seterara el intValid a 0, ya que en el array original $lsmCard el intValid viene a 1
				if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA != $valor->sucursal_nombre_db){
					$lsmCard["intValid"] = 0;
				}
				else{
					$lsmCard["intValid"] = 1;
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
		}
		//tercer if son Cuentas y Tarjetas COMUNITARIAS, el campo ZIP=ES_COMUNITARIA con valor de 'CU' CUENTA UNIVERSAL
		if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA == "CU"){
			//inserto todas las comunitaras a 0 luego se hace el update para las sucursales seleccionadas en id_sucursal[] respectivavente seleccionadas en el frm
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
	
									  
			}//end del foreach
				
			//una vez inserto el intValid a 0 en todas las sucursales, actualizo a 1 las 	seleccionadas en el frm las que estaran activas intValid = 1 
			foreach($id_sucursal as $id_de_sucursal){
					$sucursales_comunes	= $this->Traer_Sucrusal_Por_ID($id_de_sucursal);
					$la_db = $sucursales_comunes->sucursal_nombre_db.".dbo";
					$lsmCardValid = array(
						"intValid"=>1,
						"strCardNumber"=>$lsmCard["strCardNumber"],
						"intMediaType"=>$lsmCard["intMediaType"],
						"intFacility"=>$lsmCard["intFacility"]
					);
					$this->db->query("UPDATE $la_db.lsmCard SET intValid = ? WHERE strCardNumber =? AND intMediaType =? AND intFacility =?", $lsmCardValid);
			}
			
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