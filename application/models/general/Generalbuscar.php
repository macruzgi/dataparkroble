<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Generalbuscar extends CI_Model{ 
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
	public function TraerSucursales(){
		$resultado = $this->db->query("SELECT id_sucursal, sucursal_nombre,sucursal_nombre_db, sucursal_prefijo FROM DB_CONFIGURACIONES.dbo.adm_Sucursal WHERE sucursal_estado = 1");
		
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	//NOTA: esta funcion se utiliza en funciones en el controlador Cuentas:EnviarCuentaYtarjetasAcentrosComercial, Cuentas:QuitarCuentaYtarjetas, Cuentas:EnviarTarjetaAservidor
	public function VerExisteCuentaEnSucursal($buscarCards){
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($buscarCards["id_sucursal"]), true);
		
		$resultado = $this->SERVIDOR->query("SELECT COUNT([Account Number]) AS CUENTA FROM Accounts WHERE [Account Number] = ?", array($buscarCards["AccountNumber"]));
		$fila = $resultado->row(); 
		return $fila->CUENTA;
	}
	public function TraerdatosDeLaCuentaYtarjetas($buscarCards){
		
		$resultado = $this->db->query("SELECT 
		[Account Number] AccountNumber, 
		[Account Name] AccountName, 
		[First Name] FirstName,
		[Last Name] LastName,
		ZIP, 
		Phone, 
		Fax, 
		[Last Modified Date] LastModifiedDate, 
		[Last Modified User] LastModifiedUser, 
		NoPayDeactivate, 
		DeactivateLimit,
		Multiple, 
		Email, 
		AutoCharge, 
		CarpoolType, 
		bToApplySurcharge 
		FROM Accounts WHERE [Account Number] = ?", array($buscarCards["AccountNumber"]));
		$fila = $resultado->row(); 
		
		$resultadoTarjetas = $this->db->query("SELECT [Card Number] CardNumber, 
		intMediaType, 
		intFacility, 
		UsageCard, 
		[Account Number] AccountNumber, 
		[From Date] FromDate,
		[To Date] ToDate, 
		[First Name] FirstName, 
		[Last Name] LastName, 
		[Auto Expire] AutoExpire,
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
		strModifiedByUser FROM Cards WHERE [Account Number] =?",
		array($buscarCards["AccountNumber"]));
		
		$datosEnArray = array();
		if($resultadoTarjetas->num_rows() > 0){
			
			foreach($resultadoTarjetas->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		/*
		$resultadoLsmCard = $this->db->query("SELECT 
						ls.strCardNumber,
						ls.intMediaType, 
						ls.intUsageType,
						ls.intValid,
						ls.bitResync,
						ls.intRawStatus,
						ls.intFacility,
						ls.intTimeZone,
						ls.intAccessLevel,
						ls.dtModified,
						ls.dtTimeCreation,
						ls.dtValidFromDate,
						ls.dtValidToDate,
						ls.intEntryLane,
						ls.intExitLane,
						ls.intMachineNumber,
						ls.mAmount,
						ls.intDiscount,
						ls.intOperator,
						ls.intRoomNumber,
						ls.intTicketNumber,
						ls.intCCType,
						ls.bitPaid,
						ls.intUsage, 
						ls.intLinkedCardMediaType,
						ls.bitBackout,  
						ls.bitJam, 
						ls.intPaymentLane,
						ls.intHintOldCmd,
						ls.intTargetControllerID,
						ls.intInvoice,
						ls.intStatusEx,
						ls.intActiveAccessLevel,
						ls.intModifyReason,
						ls.intPassThruLane,
						ls.intAlarm,
						ls.intHWCardStatusCode,
						ls.intSetupTimeZone,
						ls.intMaxUsageCount,
						ls.intCurrentUsageCount,
						ls.bitCheckUsageCount,
						ls.intReUsePeriod,
						ls.bitFacilitySynced,
						ls.intUsageTypeModifiers,
						ls.intPaymentType,
						ls.intDiscountMerchantID,
						ls.bitWaitList,
						ls.intSanction,
						ls.intLprEntryId,
						ls.intLprExitId,
						ls.intExtendedValidFrom,
						ls.intExtendedValidTo,
						ls.intDiscountUsedLane,
						ls.intPassback,
						ls.intCommStatus,
						ls.intActivityLane,
						ls.bIsExternalOveragePayment,
						ls.intOperationNumber,
						ls.intSubUsageType 
				FROM lsmCard ls
					INNER JOIN Cards car ON(car.[Card Number] = ls.strCardNumber)
					INNER JOIN Accounts aco ON(aco.[Account Number] = car.[Account Number])
				WHERE  aco.[Account Number] =?",
				array(
					$buscarCards["AccountNumber"]
				));
		$lsmCard = array();
		if($resultadoLsmCard->num_rows() > 0){
			
			foreach($resultadoLsmCard->result() as $filasEncontradas){
				$lsmCard[] = $filasEncontradas;
			}
		}
		*/
		return array(
			"datosCuenta"=>$fila, 
			"datosTarjetas"=>$datosEnArray/*,
			"lsmCard"=>$lsmCard*/);
		
	}
	public function VerSiExisteTarjetaEnServidor($buscarCards){
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($buscarCards["id_sucursal"]), true);

		$resultado = $this->SERVIDOR->query("SELECT COUNT([Card Number]) AS CUENTA FROM Cards WHERE [Card Number] =? AND [Account Number] =?", array($buscarCards["CardNumber"],$buscarCards["AccountNumber"]));
		$fila = $resultado->row(); 
		return $fila->CUENTA;
	}
	//NOTA: esa funcion se usa en los controladores Tarjetas:VistaReporteRecarga, Tarjetas:VistaReporteCargos, Inicio:TraerDatosParaGraficasBarraSucursales
	public function TraerSucursalesPermitidasAusuario($id_usuario){
		$resultado = $this->db->query("SELECT su.id_sucursal, su.sucursal_nombre 
FROM DB_CONFIGURACIONES.dbo.adm_Sucursal su
INNER JOIN DB_CONFIGURACIONES.dbo.adm_UsuariosEnSucursales usuen
	ON(usuen.id_sucursal = su.id_sucursal)
WHERE usuen.id_usuario = ?
AND su.sucursal_estado = 1", array($id_usuario));
		
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}	
	public function Traer_Sucrusal_Por_ID($id_sucursal){
		$resultado = $this->db->query("SELECT id_sucursal, sucursal_nombre, sucursal_nombre_db, sucursal_prefijo FROM DB_CONFIGURACIONES.dbo.adm_Sucursal WHERE id_sucursal =?", $id_sucursal);
		$fila = $resultado->row(); 
		return $fila;
	}
	public function Verificar_Existe_Nombre_DB($sucursal_nombre_db){
		$resultado = $this->db->query("SELECT count(*) as RESULTADO 
		FROM DB_CONFIGURACIONES.dbo.adm_Sucursal WHERE sucursal_nombre_db =?", $sucursal_nombre_db);
		$fila = $resultado->row(); 
		return $fila->RESULTADO;
	}
}