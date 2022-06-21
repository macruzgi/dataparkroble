<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo inserta registros.
*/
class Generalinsertar extends CI_Model{ 
	public function __construct(){
		parent::__construct();
		/*
		//validacion para ver que db se debe cargar
		$this->db  = $this->load->database();
		if($this->session->id_sucursal == 2){
			$this->db = $this->load->database('metroCentro', TRUE);
		}
		else if($this->session->id_sucursal == 3){
			$this->db = $this->load->database('metroSur', TRUE);
		}
		*/
		
	}
	public function NombreConexionRemota($id_sucursal){
		$resultado = $this->db->query("SELECT conexion_nombre FROM DB_CONFIGURACIONES.dbo.conf_Conexiones_Remotas 
			WHERE id_sucursal = ?", $id_sucursal);
		$fila = $resultado->row(); 
		return $fila->conexion_nombre;
	}
	public function InsetarDatosAservidorRemoto($Accounts, $TraerdatosDeLaCuentaYtarjetas, $buscarCards){
		
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($buscarCards["id_sucursal"]), true);
		//NOTA: las tablas no tienen restricciones
		//inserto los datos en la tabla Accounts
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->SERVIDOR->trans_start();
		
		$this->SERVIDOR->query("INSERT INTO Accounts([Account Number], [Account Name], [First Name],
										[Last Name], ZIP, Phone, Fax, [Last Modified Date], [Last Modified User], NoPayDeactivate, DeactivateLimit,
										Multiple, Email, AutoCharge, CarpoolType, bToApplySurcharge)
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)", $Accounts);
		//recorro las tarjetas traidas y las inserto en el servidor respectivo
		foreach($TraerdatosDeLaCuentaYtarjetas["datosTarjetas"] as $filasEncontradas):
				  $Cards	= array(
						"CardNumber"=>$filasEncontradas->CardNumber,
						"intMediaType"=>$filasEncontradas->intMediaType, //Proximity, Magstripe, etc...
						"intFacility"=>$filasEncontradas->intFacility,
						"UsageCard"=>$filasEncontradas->UsageCard, //0=Monthly, 3=Debit, 6=Service, etc..., si no no funciona lo de auto voiding
						"AccountNumber"=>$filasEncontradas->AccountNumber,
						"FromDate"=>$filasEncontradas->FromDate,
						"ToDate"=>$filasEncontradas->ToDate,
						"FirstName"=>$filasEncontradas->FirstName,//posible se trunque la infor ya que solo acepta 16 caracteres
						"LastName"=>$filasEncontradas->LastName,//posible se trunque la infor ya que solo acepta 16 caracteres
						"AutoExpire"=>$filasEncontradas->AutoExpire, //0 que no expira 1=expira
						"VIP"=>$filasEncontradas->VIP,
						"Message"=>$filasEncontradas->Message,
						"Code"=>$filasEncontradas->Code,  //Changue Code =default de la pestaña Biling
						"BillingPeriod"=>$filasEncontradas->BillingPeriod,  //Biling Period de la pestaña Biling
						"LocID"=>$filasEncontradas->LocID,
						"Rate"=>$filasEncontradas->Rate,
						"ParkerNumber"=>$filasEncontradas->ParkerNumber,
						"CardSubtype"=>$filasEncontradas->CardSubtype,
						"strPhone"=>'',//"SUCURSAL: ".$this->session->id_sucursal,
						"dtCreated"=>$filasEncontradas->dtCreated,
						"dtModified"=>$filasEncontradas->dtModified,
						"strModifiedByUser"=>$filasEncontradas->strModifiedByUser
					  );
			
		 
		//inserto en la tabla Cards
		$this->SERVIDOR->query("INSERT INTO Cards(
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
		strPhone,		
		dtCreated, 
		dtModified, 
		strModifiedByUser)
									VALUES(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)", $Cards);
		
			//inserto en la bitacora
		$this->SERVIDOR->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Accounts'".", 'INSERT', '".$this->session->userdata("usuario")."', '".'Se AGREGO la cuenta EXCLUSIVA No. '.$Accounts['AccountNumber']."'  + char(10) +'".' 
							Se AGREGO la tarjeta No. '.$Cards['CardNumber'].' para la cuenta en cuestion en la tabla Cards'."'
						 + char(10) + '".' NO se AGREGA registro en la tabla lsmCard para la tarjeta en cuestion, ya que esta tabla siempre se replica, no hay forma de filtrar'."')");
		endforeach;
		/*
		//foreach para recorrer las lsmCard
		foreach($TraerdatosDeLaCuentaYtarjetas["lsmCard"] as $filasEncontradas):
			//vrifico si ya hay registro en lsmCard, si hay no insertar para evitar error de llave primaria
			$existeRegistroLsmCard = $this->SERVIDOR->query("SELECT count(strCardNumber) AS CUENTA FROM lsmCard  WHERE strCardNumber = ?", $filasEncontradas->strCardNumber);
			$fila = $existeRegistroLsmCard->row(); 
			if($fila->CUENTA == 0){
			//armo un array para enviar los datos
					$lsmCard	= array(
						"strCardNumber"=>$filasEncontradas->strCardNumber,
						"intMediaType"=>$filasEncontradas->intMediaType,
						"intUsageType"=>$filasEncontradas->intUsageType,
						"intValid"=>$filasEncontradas->intValid, //Vld en cart manager que siempre este valida
						"bitResync"=>$filasEncontradas->bitResync,
						"intRawStatus"=>$filasEncontradas->intRawStatus,
						"intFacility"=>$filasEncontradas->intFacility,
						"intTimeZone"=>$filasEncontradas->intTimeZone,
						"intAccessLevel"=>$filasEncontradas->intAccessLevel,
						"dtModified"=>$filasEncontradas->dtModified,
						"dtTimeCreation"=>$filasEncontradas->dtTimeCreation,
						"dtValidFromDate"=>$filasEncontradas->dtValidFromDate,
						"dtValidToDate"=>$filasEncontradas->dtValidToDate, 
						"intEntryLane"=>$filasEncontradas->intEntryLane,
						"intExitLane"=>$filasEncontradas->intExitLane,
						"intMachineNumber"=>$filasEncontradas->intMachineNumber,
						"mAmount"=>$filasEncontradas->mAmount, //Amount de la pestaña Biling en el registro de Cards
						"intDiscount"=>$filasEncontradas->intDiscount,
						"intOperator"=>$filasEncontradas->intOperator,
						"intRoomNumber"=>$filasEncontradas->intRoomNumber,
						"intTicketNumber"=>$filasEncontradas->intTicketNumber,
						"intCCType"=>$filasEncontradas->intCCType,
						"bitPaid"=>$filasEncontradas->bitPaid,
						"intUsage"=>$filasEncontradas->intUsage, 
						"intLinkedCardMediaType"=>$filasEncontradas->intLinkedCardMediaType,
						"bitBackout"=>$filasEncontradas->bitBackout,  
						"bitJam"=>$filasEncontradas->bitJam,  
						"intPaymentLane"=>$filasEncontradas->intPaymentLane,
						"intHintOldCmd"=>$filasEncontradas->intHintOldCmd,
						"intTargetControllerID"=>$filasEncontradas->intTargetControllerID,
						"intInvoice"=>$filasEncontradas->intInvoice,
						"intStatusEx"=>$filasEncontradas->intStatusEx,
						"intActiveAccessLevel"=>$filasEncontradas->intActiveAccessLevel,
						"intModifyReason"=>$filasEncontradas->intModifyReason,
						"intPassThruLane"=>$filasEncontradas->intPassThruLane,
						"intAlarm"=>$filasEncontradas->intAlarm,
						"intHWCardStatusCode"=>$filasEncontradas->intHWCardStatusCode,
						"intSetupTimeZone"=>$filasEncontradas->intSetupTimeZone,
						"intMaxUsageCount"=>$filasEncontradas->intMaxUsageCount,
						"intCurrentUsageCount"=>$filasEncontradas->intCurrentUsageCount,
						"bitCheckUsageCount"=>$filasEncontradas->bitCheckUsageCount,
						"intReUsePeriod"=>$filasEncontradas->intReUsePeriod,
						"bitFacilitySynced"=>$filasEncontradas->bitFacilitySynced,
						"intUsageTypeModifiers"=>$filasEncontradas->intUsageTypeModifiers,
						"intPaymentType"=>$filasEncontradas->intPaymentType,
						"intDiscountMerchantID"=>$filasEncontradas->intDiscountMerchantID,
						"bitWaitList"=>$filasEncontradas->bitWaitList,
						"intSanction"=>$filasEncontradas->intSanction,
						"intLprEntryId"=>$filasEncontradas->intLprEntryId,
						"intLprExitId"=>$filasEncontradas->intLprExitId,
						"intExtendedValidFrom"=>$filasEncontradas->intExtendedValidFrom,
						"intExtendedValidTo"=>$filasEncontradas->intExtendedValidTo,
						"intDiscountUsedLane"=>$filasEncontradas->intDiscountUsedLane,
						"intPassback"=>$filasEncontradas->intPassback,
						"intCommStatus"=>$filasEncontradas->intCommStatus,
						"intActivityLane"=>$filasEncontradas->intActivityLane,
						"bIsExternalOveragePayment"=>$filasEncontradas->bIsExternalOveragePayment,
						"intOperationNumber"=>$filasEncontradas->intOperationNumber,
						"intSubUsageType"=>$filasEncontradas->intSubUsageType							
					  );							
				//inserto en la tabla lsmCard
				$this->SERVIDOR->query("INSERT INTO lsmCard(
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
		endforeach;
		*/
		//finalizao la transaccion
		$this->SERVIDOR->trans_complete();
		
		//comprobando si la transaccion ha tenido exito
		if($this->SERVIDOR->trans_status() === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function EnviarTarjetaAservidor($buscarCards, $Cards){
		
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($buscarCards["id_sucursal"]), true);
		//NOTA: las tablas no tienen restricciones
		//inserto los datos en la tabla Cards, no se inserta en la tabla lsmCard porque esas siempre se insertan en todos los servidores ya que no hay filtro posible para eviatar que se propaguen
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->SERVIDOR->trans_start();
		
		//inserto en la tabla Cards
		$this->SERVIDOR->query("INSERT INTO Cards(
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
		strPhone,		
		dtCreated, 
		dtModified, 
		strModifiedByUser)
									VALUES(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)", $Cards);
		
			//inserto en la bitacora
		$this->SERVIDOR->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Cards'".", 'INSERT', '".$this->session->userdata("usuario")."', '".'Se AGREGO la TARJETA No. '.$Cards['CardNumber']."'  + char(10) +'".' 
							Se AGREGO a la CUENTA No. '.$Cards['AccountNumber'].' la Tarjeta  '.$Cards['CardNumber'].' en la tabla Cards'."'
						 + char(10) + '".' NO se AGREGO registro en la tabla lsmCard para la tarjeta en cuestion, ya que estas se propoagan siempre'."')");

		/*
		//foreach para recorrer las lsmCard
		foreach($TraerdatosDeLaCuentaYtarjetas["lsmCard"] as $filasEncontradas):
			//vrifico si ya hay registro en lsmCard, si hay no insertar para evitar error de llave primaria
			$existeRegistroLsmCard = $this->SERVIDOR->query("SELECT count(strCardNumber) AS CUENTA FROM lsmCard  WHERE strCardNumber = ?", $filasEncontradas->strCardNumber);
			$fila = $existeRegistroLsmCard->row(); 
			if($fila->CUENTA == 0){
			//armo un array para enviar los datos
					$lsmCard	= array(
						"strCardNumber"=>$filasEncontradas->strCardNumber,
						"intMediaType"=>$filasEncontradas->intMediaType,
						"intUsageType"=>$filasEncontradas->intUsageType,
						"intValid"=>$filasEncontradas->intValid, //Vld en cart manager que siempre este valida
						"bitResync"=>$filasEncontradas->bitResync,
						"intRawStatus"=>$filasEncontradas->intRawStatus,
						"intFacility"=>$filasEncontradas->intFacility,
						"intTimeZone"=>$filasEncontradas->intTimeZone,
						"intAccessLevel"=>$filasEncontradas->intAccessLevel,
						"dtModified"=>$filasEncontradas->dtModified,
						"dtTimeCreation"=>$filasEncontradas->dtTimeCreation,
						"dtValidFromDate"=>$filasEncontradas->dtValidFromDate,
						"dtValidToDate"=>$filasEncontradas->dtValidToDate, 
						"intEntryLane"=>$filasEncontradas->intEntryLane,
						"intExitLane"=>$filasEncontradas->intExitLane,
						"intMachineNumber"=>$filasEncontradas->intMachineNumber,
						"mAmount"=>$filasEncontradas->mAmount, //Amount de la pestaña Biling en el registro de Cards
						"intDiscount"=>$filasEncontradas->intDiscount,
						"intOperator"=>$filasEncontradas->intOperator,
						"intRoomNumber"=>$filasEncontradas->intRoomNumber,
						"intTicketNumber"=>$filasEncontradas->intTicketNumber,
						"intCCType"=>$filasEncontradas->intCCType,
						"bitPaid"=>$filasEncontradas->bitPaid,
						"intUsage"=>$filasEncontradas->intUsage, 
						"intLinkedCardMediaType"=>$filasEncontradas->intLinkedCardMediaType,
						"bitBackout"=>$filasEncontradas->bitBackout,  
						"bitJam"=>$filasEncontradas->bitJam,  
						"intPaymentLane"=>$filasEncontradas->intPaymentLane,
						"intHintOldCmd"=>$filasEncontradas->intHintOldCmd,
						"intTargetControllerID"=>$filasEncontradas->intTargetControllerID,
						"intInvoice"=>$filasEncontradas->intInvoice,
						"intStatusEx"=>$filasEncontradas->intStatusEx,
						"intActiveAccessLevel"=>$filasEncontradas->intActiveAccessLevel,
						"intModifyReason"=>$filasEncontradas->intModifyReason,
						"intPassThruLane"=>$filasEncontradas->intPassThruLane,
						"intAlarm"=>$filasEncontradas->intAlarm,
						"intHWCardStatusCode"=>$filasEncontradas->intHWCardStatusCode,
						"intSetupTimeZone"=>$filasEncontradas->intSetupTimeZone,
						"intMaxUsageCount"=>$filasEncontradas->intMaxUsageCount,
						"intCurrentUsageCount"=>$filasEncontradas->intCurrentUsageCount,
						"bitCheckUsageCount"=>$filasEncontradas->bitCheckUsageCount,
						"intReUsePeriod"=>$filasEncontradas->intReUsePeriod,
						"bitFacilitySynced"=>$filasEncontradas->bitFacilitySynced,
						"intUsageTypeModifiers"=>$filasEncontradas->intUsageTypeModifiers,
						"intPaymentType"=>$filasEncontradas->intPaymentType,
						"intDiscountMerchantID"=>$filasEncontradas->intDiscountMerchantID,
						"bitWaitList"=>$filasEncontradas->bitWaitList,
						"intSanction"=>$filasEncontradas->intSanction,
						"intLprEntryId"=>$filasEncontradas->intLprEntryId,
						"intLprExitId"=>$filasEncontradas->intLprExitId,
						"intExtendedValidFrom"=>$filasEncontradas->intExtendedValidFrom,
						"intExtendedValidTo"=>$filasEncontradas->intExtendedValidTo,
						"intDiscountUsedLane"=>$filasEncontradas->intDiscountUsedLane,
						"intPassback"=>$filasEncontradas->intPassback,
						"intCommStatus"=>$filasEncontradas->intCommStatus,
						"intActivityLane"=>$filasEncontradas->intActivityLane,
						"bIsExternalOveragePayment"=>$filasEncontradas->bIsExternalOveragePayment,
						"intOperationNumber"=>$filasEncontradas->intOperationNumber,
						"intSubUsageType"=>$filasEncontradas->intSubUsageType							
					  );							
				//inserto en la tabla lsmCard
				$this->SERVIDOR->query("INSERT INTO lsmCard(
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
		endforeach;
		*/
		//finalizao la transaccion
		$this->SERVIDOR->trans_complete();
		
		//comprobando si la transaccion ha tenido exito
		if($this->SERVIDOR->trans_status() === true){
			return true;
		}
		else{
			return false;
		}
	}

}