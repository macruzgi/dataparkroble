<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cuentas extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
		 //comprobamos si el usuario está logueado
		$estalogueado	= $this->session->userdata("chequear");
		if($estalogueado === true)
		{
		}
		else
		{
			
			//si no estoy logueado que me envie a index
			redirect(base_url());
			exit;
		}
		//cargo los modelos anecestiar
		//$this->load->model("cuentas/Cuentasbuscar");
		//$this->load->model("cuentas/Cuentasinsertar");
		//$this->load->model("cuentas/Cuentasactualizar");
		//$this->load->model("tarjetas/Tarjetasbuscar");
		$this->load->model(array("cuentas/Cuentasbuscar", "cuentas/Cuentasinsertar", "cuentas/Cuentasactualizar", "tarjetas/Tarjetasbuscar", "general/Generalbuscar"));
	}
	public function VerSiUsuarioTieneAccesoAlaOpcion($id_modulo_opcion){
		//esta funcion verifica si el usuario tiene permsios para acceder a la accion recibe como paramentro el id_modulo_opcion si el usuario no tiene permissos le redirige a una vista con un msj que no tiene acceso a tal proceso
			if (in_array("$id_modulo_opcion", $this->session->userdata('ids_modulo_opciones'))) {
				
			}else{
				redirect(base_url()."datapark/ErrorDeAcceso");
				exit;
			}
	}
	public function ListadoCuentas()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(3);
		$mostrar["ListarCuentasTodas"] 	= $this->Cuentasbuscar->ListarCuentasTodas();
		$mostrar["contenido"] 			= "cuentas/vista_listado_cuentas";
		$this->load->view("plantilla", $mostrar);

	}
	public function VistaRegistroCuenta(){
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(1);
		//traigo las sucursales
		$mostrar["TraerSucursales"] = $this->Generalbuscar->TraerSucursales();
		//traigo el listado de los FacilityCode activos
		$mostrar["TaerFacilityCodeActivos"]		= $this->Tarjetasbuscar->TaerFacilityCodeActivos();
		//si es actualizacion que traiga el dato respectivo
		$Accounts = array(
			"ID"=>$this->uri->segment(3,0),
			"AccountNumber"=>$this->uri->segment(4,0)
		);
		
		//$mostrar["TaerDatosCuentaSeleccionada"] = $this->Cuentasbuscar->TaerDatosCuentaSeleccionada($Accounts);
		//traigo los time Zone
		$mostrar["TraerTimesZones"]	= $this->Tarjetasbuscar->TraerTimesZones();
		$mostrar["contenido"] 		= "cuentas/vista_registro_tarjeta";
		$this->load->view("plantilla", $mostrar);

	}
	public function RegistrarCuentaYtarjeta(){
		
		$this->form_validation->set_rules("AccountName", "Nombre de la Cuenta","required",
				array(
						'required'      => 'Digite el %s.'
					)
			);
		$this->form_validation->set_rules("CardNumber", "No. de la Tarjeta",'required|numeric',
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("FirstName", "Nombre","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres para %s es %s'
					)
			);
		$this->form_validation->set_rules("LastName", "Apelldio","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres para %s es %s'
					)
				);
		$this->form_validation->set_rules("dui", "DUI","required",
					array(
						'required'     => 'Digite el %s sin guiones'
						//'numeric'      => 'El valor de la %s debe ser numerica'
					)
				);
		$this->form_validation->set_rules("intFacility", "Facility Code","required|numeric",
					array(
						'required'     => 'Elija el %s',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("tipo_tarjeta", "Tipo de Tarjeta","required",
					array(
						'required'     => 'Elija el %s'
					)
				);
		$this->form_validation->set_rules("intTimeZone", "Time Zone","required",
					array(
						'required'     => 'Digite el %s'
					)
				);
		$this->form_validation->set_rules("intAccessLevel", "Acces Level","required",
					array(
						'required'     => 'Digite el %s'
					)
				);
		$this->form_validation->set_rules("UsageCard", "Type","required|numeric",
					array(
						'required'     => 'Elija el %s',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("intMediaType", "Media","required|numeric",
					array(
						'required'     => 'Elija la %s',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rico'
					)
				);
				//si el UsageCard es Debit=3 el CardSubtype y el Rate son obligatorios
		if($this->input->post("UsageCard") == 3){
			
			$this->form_validation->set_rules("CardSubtype", "Complemento de Type","required|numeric",
					array(
						'required'     => 'Elija un %s',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rico'
					)
				);
			$this->form_validation->set_rules("Rate", "Rate","required",
					array(
						'required'     => 'Elija un %s'
					)
				);
		}
		/*
		$this->form_validation->set_rules("es_recargable", "La Tarjeta es Recargable","required|numeric",
					array(
						'required'     => 'Debe elegir %s',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rico'
					)
				);
				*/
		if($this->input->post("id_sucursal_exclusiva") == "multi"){
		$this->form_validation->set_rules("id_sucursal[]", "Centros Comerciales","required|numeric",
					array(
						'required'     => 'Seleccione los %s a los que pertenecerá la Cuenta y la Tarjeta',
						'numeric'      => 'El valor de los %s debe ser num&eacute;rico'
					)
				);
		}
		//si la cuenta no es recargable el campo AccountNumber es obligatorio
		if($this->input->post("id_sucursal_exclusiva") != "-9"){
				  
			$this->form_validation->set_rules("AccountNumber", "No. de Cuenta","required",
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rica'
					)
			);
		
		}
		
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
			  /*echo $this->input->post("ToDate"); echo 4; exit;
			 //valido si la vecha ingresada es menor a la de hoy
			  if($this->input->post("tipo_tarjeta") == "PC" || $this->input->post("tipo_tarjeta") == "PM"){
				 if(date("Y-m-d", strtotime($this->input->post("ToDate"))) <= date("Y-m-d")){
					 
						 echo 4; exit;
				 }
			 }
			 */
			 //eso aplicaba solo para cepa que era dependiedo el tipo de tarjeta se le concatebaba el prefijo (PR, PM,) etc...
			 //$AccountNumber 	= $this->input->post("tipo_tarjeta").$this->input->post("AccountNumber");
			 $id_sucursal_exclusiva	= $this->input->post("id_sucursal_exclusiva");
			 $ZIP 					= "";
			
			//valido si la cuenta tendra prefijo P, de las sucursales o de comunitaria
			//primer if es exclusiva
			if($id_sucursal_exclusiva != "multi" and $id_sucursal_exclusiva != -9){
				 $la_Sucursal       	= $this->Generalbuscar->Traer_Sucrusal_Por_ID($id_sucursal_exclusiva);
				 $AccountNumber 	= $la_Sucursal->sucursal_prefijo.$this->input->post("AccountNumber");
				 $ZIP = $la_Sucursal->sucursal_nombre_db;
				 //echo $AccountNumber; exit;
			}
			//segundo if es multisitio comunitaria cuenta universal
			else if($id_sucursal_exclusiva == "multi"){
				//aqui  se concatena la CU de CUENTA UNIVERSAL o lo que decidan
				$AccountNumber 	= "CU".$this->input->post("AccountNumber");
				 //echo $AccountNumber; exit;
				$ZIP = "CU";
			}
			//sino es recargable
			else{
				//aqui solo se concatena la P de recargable
			 $AccountNumber 	= "ESP";//"P".$this->input->post("AccountNumber");
			 //echo $AccountNumber; exit;
			}
			 
			 $CardNumber 		= $this->input->post("CardNumber");
			 $intMediaType 		= $this->input->post("intMediaType");
			 $UsageCard			= $this->input->post("UsageCard");
			 $intAccessLevel	= $this->input->post("intAccessLevel");
			 $id_sucursal		= $this->input->post("id_sucursal");
			 $FromDate			= date("Y-m-d");
			 $ToDate			= date("Y-m-d");
			 $dtValidToDate		= date("Y-m-d");
			 $Rate				= "";
			 $CardSubtype = $intUsageType = $bitFacilitySynced = $AutoExpire = $VIP = 0;
			 $Code			= 1; $intRawStatus = 260;
			 if($this->input->post("ToDate") != ""){
				  if(date("Y-m-d", strtotime($this->input->post("ToDate"))) <= date("Y-m-d")){
					  echo 4; exit;
				 }
				  $ToDate			= date("Y-m-d", strtotime($this->input->post("ToDate")));
				  $dtValidToDate	= $ToDate;
				  $AutoExpire		= 1;
				}
			 $ChequearExistenciaCuenta = $this->Cuentasbuscar->ChequearExistenciaCuenta($AccountNumber);
			 if($ChequearExistenciaCuenta > 0){
				 echo 5; exit;
			 }
			  
			  //si el UsageCard es Debit=3 el CardSubtype y el Rate debe setearse al valor tarido por el fomrulario
			  if($UsageCard == 3){
				  $Rate				= $this->input->post("Rate");
				  $CardSubtype  	= $this->input->post("CardSubtype");
				  $intAccessLevel	= 29;
			  }
			  //valido si es VIP  y  UsageCard es difernte de 3 el intAccessLevel sera 32
			  if($this->input->post("VIP")){
				  $VIP				= $this->input->post("VIP");
				  $intAccessLevel	= 32;
			  }
			  if($intAccessLevel == 32){
				  $VIP = 1;
			  }
			  //UsageCard=0:Monthly y intMediaType =2:Magstripe
			  if($UsageCard == 0 && $intMediaType == 2){
				
				  $intUsageType = 3; $intRawStatus = 4; $bitFacilitySynced = 1;
			  }
			  else if($UsageCard == 0 && $intMediaType == 4){
				   //UsageCard=0:Monthly y intMediaType=4:Proximity
				 $intUsageType = 3;  $bitFacilitySynced = 1;
			  }
			  else if($UsageCard == 3 && $intMediaType == 4){
				   //UsageCard=3:Debit y intMediaType=4:Proximity
				  $intUsageType = 3;  $bitFacilitySynced = 1;
			  }
			  else if($UsageCard == 3 && $intMediaType == 2){
				   //UsageCard=3:Debit y intMediaType=2:Magstripe
				  $intUsageType =3; $intRawStatus =4; $bitFacilitySynced=1;
			  }
			  
			
			
			  /*
		$CardsCallback = array(
			"CardNumber"=>$this->input->post("CardNumber"),
			"intMediaType"=>$intMediaType,
			"intFacility"=>$this->input->post("intFacility")
		);	
		*/
		//print_r($CardsCallback);
			 //NOTA: aqui queda quemado que solo una tarjeta por cuenta, para cambiar esto se debe camibar la forma de registar las tarjetas en el formulario
			 
			  $VerificarSiExisteTarjeta = $this->Cuentasbuscar->VerificarSiExisteTarjeta($CardNumber);
			  if($VerificarSiExisteTarjeta > 0){
				  echo 2; exit;
				}
				
				  	 
					//armo un array para enviar los datos
				  $Accounts = array(
						"AccountNumber"=>$AccountNumber,
						"AccountName"=>utf8_decode($this->input->post("AccountName")),
						"FirstName"=>'',//$this->input->post("FirstName"),
						"LastName"=>'',//$this->input->post("LastName"),
						"ZIP"=>$ZIP,//para indentificar las cuentas universales
						"Phone"=>$this->input->post("Phone"),
						"Fax"=>$this->input->post("dui"),
						"LastModifiedDate"=>date("Y-m-d H:i:s"),					
						"LastModifiedUser"=>$this->session->userdata("nombre_usuario")."-WEB",
						"NoPayDeactivate"=>1, //void below a 1 en la pestaña Balance de la cuenta
						"DeactivateLimit"=>0.0,// NoPayDeactivate indica que se desactivar la tarjea con el valor asignado en DeactivateLimit en este caso $0.0, pero la tarjeta debes ser Debit
						"Multiple"=>1,//account type (multiple o individial) simpre sera multiple
						"Email"=>$this->input->post("Email"),
						"AutoCharge"=>0,
						"CarpoolType"=>0,// pestaña Carpool, Carpool Type =None (0) preseleccionado, si esto se cambia debe cambiar se en el formulario
						"bToApplySurcharge"=>0		
					  );
				//print_r($Accounts); exit;
				  //armo un array para enviar los datos
				  $Cards	= array(
						"CardNumber"=>$CardNumber,
						"intMediaType"=>$intMediaType, //Proximity, Magstripe, etc...
						"intFacility"=>$this->input->post("intFacility"),
						"UsageCard"=>$UsageCard, //0=Monthly, 3=Debit, 6=Service, etc..., si no no funciona lo de auto voiding
						"AccountNumber"=>$AccountNumber,
						"FromDate"=>$FromDate,
						"ToDate"=>$ToDate,
						"FirstName"=>utf8_decode($this->input->post("FirstName")),//posible se trunque la infor ya que solo acepta 16 caracteres
						"LastName"=>utf8_decode($this->input->post("LastName")),//posible se trunque la infor ya que solo acepta 16 caracteres
						"AutoExpire"=>$AutoExpire, //0 que no expira 1=expira
						"VIP"=>$VIP,
						"Message"=>$this->input->post("dui"),
						"Code"=>$Code,  //Changue Code =default de la pestaña Biling
						"BillingPeriod"=>1,  //Biling Period de la pestaña Biling
						"LocID"=>1,
						"Rate"=>$Rate,
						"ParkerNumber"=>$AccountNumber,
						"CardSubtype"=>$CardSubtype,
						"dtCreated"=>date("Y-m-d H:i:s"),
						"dtModified"=>date("Y-m-d H:i:s"),
						"strModifiedByUser"=>$this->session->userdata("nombre_usuario")."-WEB"
					  );
					
					//valido la fecha ToDate para ver si es igual a la de hor
					//armo un array para enviar los datos
					$lsmCard	= array(
						"strCardNumber"=>$CardNumber,
						"intMediaType"=>$intMediaType,
						"intUsageType"=>$intUsageType,
						"intValid"=>1, //Vld en cart manager que siempre este valida
						"bitResync"=>0,
						"intRawStatus"=>$intRawStatus,
						"intFacility"=>$this->input->post("intFacility"),
						"intTimeZone"=>$this->input->post("intTimeZone"),
						"intAccessLevel"=>$intAccessLevel,
						"dtModified"=>date("Y-m-d H:i:s"),
						"dtTimeCreation"=>date("Y-m-d H:i:s"),
						"dtValidFromDate"=>$FromDate,
						"dtValidToDate"=>$dtValidToDate, 
						"intEntryLane"=>0,
						"intExitLane"=>0,
						"intMachineNumber"=>0,
						"mAmount"=>0.0, //Amount de la pestaña Biling en el registro de Cards
						"intDiscount"=>0,
						"intOperator"=>0,
						"intRoomNumber"=>0,
						"intTicketNumber"=>0,
						"intCCType"=>0,
						"bitPaid"=>0,
						"intUsage"=>0, 
						"intLinkedCardMediaType"=>1,
						"bitBackout"=>0,  
						"bitJam"=>0,  
						"intPaymentLane"=>0,
						"intHintOldCmd"=>0,
						"intTargetControllerID"=>255,
						"intInvoice"=>0,
						"intStatusEx"=>0,
						"intActiveAccessLevel"=>$intAccessLevel,
						"intModifyReason"=>16,
						"intPassThruLane"=>0,
						"intAlarm"=>0,
						"intHWCardStatusCode"=>0,
						"intSetupTimeZone"=>$this->input->post("intTimeZone"),
						"intMaxUsageCount"=>0,
						"intCurrentUsageCount"=>0,
						"bitCheckUsageCount"=>0,
						"intReUsePeriod"=>0,
						"bitFacilitySynced"=>$bitFacilitySynced,
						"intUsageTypeModifiers"=>0,
						"intPaymentType"=>0,
						"intDiscountMerchantID"=>0,
						"bitWaitList"=>0,
						"intSanction"=>0,
						"intLprEntryId"=>0,
						"intLprExitId"=>0,
						"intExtendedValidFrom"=>0,
						"intExtendedValidTo"=>0,
						"intDiscountUsedLane"=>0,
						"intPassback"=>0,
						"intCommStatus"=>0,
						"intActivityLane"=>0,
						"bIsExternalOveragePayment"=>0,
						"intOperationNumber"=>0,
						"intSubUsageType"=>0							
					  );
					  //print_r($lsmCard); 
					  //$lsmCard["intValid"] = 251;
					  //echo $lsmCard["intValid"];
					 // print_r($lsmCard);
					 // exit;
					  //traigo las sucursales para insertar los lsmCard a cada db independiente
					  $las_sucursales		= $this->Generalbuscar->TraerSucursales();
					 
					//si la tarjeta es comunitaria es decir estara en varios sitios se elije de una tabla las sucursales a las que pertenercera la tarjeta y cuenta y se ponen en el intValid = 1, las restatantes a 0.  De lo contrario, se procede al "else"n donde el proceso es similar pero sin centros comerciales elegidos desde una tabla
					if($id_sucursal_exclusiva == "multi"){
						//envio los datos al modelo para insrtar la recarga
						$insertar = $this->Cuentasinsertar->Agregar_CuentaY_tarjeta_Comunes($Accounts, $Cards, $lsmCard, $las_sucursales, $id_sucursal_exclusiva, $id_sucursal);
					}
					else{
						//envio los datos al modelo para insertar la recarga
						$insertar = $this->Cuentasinsertar->AgregarCuentaYtarjeta($Accounts, $Cards, $lsmCard, $las_sucursales, $id_sucursal_exclusiva);
					}
					
					
					if($insertar){
						echo 1;
					}
					else{
						echo 0;
					}				
		  }
	}
	//CALLBACK para verificar si CUENTA existe SIN USO
	public function ChequearExistenciaCuenta($AccountNumber)
	{
		$resultado = $this->Cuentasbuscar->ChequearExistenciaCuenta($AccountNumber);
		if($resultado > 0)//EXISTE
		{
			$this->form_validation->set_message("ChequearExistenciaCuenta", "Este n&uacute;mero de CUENTA ya existe");
			return FALSE;
		}	
		return TRUE;
		
	}
	//CALLBACK para verificar si TARJETA existe SIN USO
	public function ChequearExistenciaTarjeta($CardNumber, $CardsCallback)
	{
		print_r($CardsCallback);
		exit;
		/*
		$Cards = array(
			"CardNumber"=>$CardNumber,
			"intMediaType"=>$intMediaType,
			"intFacility"=>$intFacility
		);*/
		$resultado = $this->Cuentasbuscar->VerificarSiExisteTarjeta($CardsCallback);
		if($resultado > 0)//EXISTE
		{
			$this->form_validation->set_message("ChequearExistenciaTarjeta", "Este n&uacute;mero de TARJETA ya existe");
			return FALSE;
		}	
		return TRUE;
		
	}
	public function ActualizarCuenta()
	{
		
		$this->form_validation->set_rules("AccountNumber", "No. de la Cuenta","required",
				array(
						'required'      => 'Debe elegir un %s.'
					)
			);
		$this->form_validation->set_rules("AccountName", "Nombre de la Cuenta","required",
					array(
						'required'     => 'Digite el %s'
						//'numeric'      => 'El valor de la %s debe ser numerica'
					)
				);
		$this->form_validation->set_rules("Email", "E-mail","valid_email",
					array(
						'mail'     => 'Digite un %s v&aacute;lido'
					)
				);
		
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
			 
					//armo un array para enviar los datos
				  $Accounts = array(
						"AccountName"=>utf8_decode($this->input->post("AccountName")),
						"Phone"=>$this->input->post("Phone"),
						"LastModifiedDate"=>date("Y-m-d H:i:s"),					
						"LastModifiedUser"=>$this->session->userdata("nombre_usuario")."-WEB",
						"Email"=>$this->input->post("Email")
					  );
				   $condiciones = array(
						"AccountNumber"=>$this->input->post("AccountNumber")
				   );
				
				 
					//envio los datos al modelo para insrtar la recarga
					$actualizar = $this->Cuentasactualizar->ActualizarCuenta($Accounts, $condiciones);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}				
		  }
	}
	public function BusquedaInteractivaCuentas(){
		$this->form_validation->set_rules("buscar_cuenta", "Tarjeta","required",
					array(
						'required'      => 'Debe buscar una %s.'
					)
				);
		if($this->form_validation->run() == FALSE){
			echo validation_errors();
		}
		else{
			
			$buscar_cuenta						= $this->input->post("buscar_cuenta");
			$mostrar["TraerCuentasFiltradas"]	= $this->Cuentasbuscar->BusquedaInteractivaCuentas($buscar_cuenta);
			$this->load->view("cuentas/resultado_independiente_busqueda_cuentas", $mostrar);
		}
	}
	public function BusquedaInteractivaCuentasEditar(){
		$this->form_validation->set_rules("buscar_cuenta", "Cuenta","required",
					array(
						'required'      => 'Debe buscar una %s.'
					)
				);
		if($this->form_validation->run() == FALSE){
			echo validation_errors();
		}
		else{
			
			$buscar_cuenta						= $this->input->post("buscar_cuenta");
			$mostrar["TraerCuentasFiltradas"]	= $this->Cuentasbuscar->BusquedaInteractivaCuentas($buscar_cuenta);
			$this->load->view("cuentas/resultado_independiente_busqueda_cuentas_editar", $mostrar);
		}
	}
	public function TraerDatosDeCuentaEditar(){
		$this->form_validation->set_rules("AccountNumber", "No. de Cuenta","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		if ($this->form_validation->run() == FALSE)
           {
              
			   //echo validation_errors();
			   $respuesta = array(
								"respuesta"=>0,
								"mensaje"=>validation_errors()
								);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$AccountNumber = $this->input->post("AccountNumber");
				
				//traigo los datos encontrados
				$TraerDatosDeCuentaEditar = $this->Cuentasbuscar->TraerDatosDeCuentaEditar($AccountNumber);
				//resultados para formatear las tildes y ñ y el json los muestre, si no solo enviara el resultado de un solo
				$datos =  array(
						"AccountNumber"=>$TraerDatosDeCuentaEditar->AccountNumber,
						"AccountName"=>utf8_encode($TraerDatosDeCuentaEditar->AccountName),
						"FirstName"=>utf8_encode($TraerDatosDeCuentaEditar->FirstName),
						"LastName"=>utf8_encode($TraerDatosDeCuentaEditar->LastName),
						"Phone"=>$TraerDatosDeCuentaEditar->Phone,
						//"Fax"=>$TraerDatosDeCuentaEditar->Fax,
						"Email"=>$TraerDatosDeCuentaEditar->Email
					);
				
				if($TraerDatosDeCuentaEditar){
					$respuesta = array(
								"respuesta"=>1,
								"mensaje"=>$datos
								);
				}
				else {
					$respuesta = array(
								"respuesta"=>2,
								"mensaje"=>"No hay resultados para mostrar"
								);
				}
				echo json_encode($respuesta);
		}
	}
}
