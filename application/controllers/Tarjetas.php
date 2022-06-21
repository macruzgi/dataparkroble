<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tarjetas extends CI_Controller {

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
		//establezco la zona horario par El Salvador
		date_default_timezone_set('America/El_Salvador');
		 //comprobamos si el usuario está logueado
		$estalogueado	= $this->session->userdata("chequear");
		if($estalogueado === true)
		{
		}
		else
		{
			//si no estoy logueado que me envie a index
			redirect(base_url());
		}
		//cargo los modelos anecestiar
		$this->load->model(array(
				"tarjetas/Tarjetasbuscar",
				"tarjetas/Paymentsinsertar",
				"tarjetas/Paymentseliminar",
				"tarjetas/Paymentsactualizar",
				"tarjetas/Tarjetasinsertar",
				"tarjetas/Tarjetasactualizar",
				"reportes/Reportesbuscar",
				"cuentas/Cuentasbuscar",
				"general/Generalbuscar"
			)
		);
	}
	public function VerSiUsuarioTieneAccesoAlaOpcion($id_modulo_opcion){
		if (in_array("$id_modulo_opcion", $this->session->userdata('ids_modulo_opciones'))) {
				
		}else{
				redirect(base_url()."datapark/ErrorDeAcceso");
				exit;
		}
	}
	public function VistaRecargarTarjeta()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(2);
		$mostrar["contenido"] 			= "tarjetas/vista_recargar_tarjeta";
		$this->load->view("plantilla", $mostrar);

	}
	public function BusquedaInteractivaTarjetas()
	{
		
		$this->form_validation->set_rules("buscar_tarjeta", "Tarjeta","required",
					array(
						'required'      => 'Debe buscar una %s.'
					)
				);
		if($this->form_validation->run() == FALSE){
			echo validation_errors();
		}
		else{
			
			$buscar_tarjeta						= $this->input->post("buscar_tarjeta");
			$mostrar["TraerTajetasFiltradas"]	= $this->Tarjetasbuscar->BusquedaInteractivaTarjetas($buscar_tarjeta);
			$this->load->view("tarjetas/resultado_independiente", $mostrar);
		}
			
	}
	public function RecargarTarjeta()
	{
		$this->form_validation->set_rules("card_number", "Tarjeta","required|numeric",
				array(
						'required'      => 'Debe elegir una %s.'
					)
			);
		$this->form_validation->set_rules("account_number", "Cuenta","required",
				array(
						'required'      => 'Debe elegir un numero de  %s.'
					)
				);
		$this->form_validation->set_rules("valor_recarga", "Recarga","required|numeric",
					array(
						'required'     => 'Digite el valor de la %s.',
						'numeric'      => 'El valor de la %s debe ser numerica'
					)
				);
		$this->form_validation->set_rules("factura", "N&uacute;mero de factura o transacci&oacute;n","required|callback_ChequearExisteFacturaTrasaccion",
				array(
						'required'      => 'Digite el %s.'
					)
			);
		$this->form_validation->set_rules("intMediaType", "Tipo tarjeta","required|numeric",
					array(
						'required'     => 'Debe seleccionar el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("intFacility", "Facility COD","required|numeric",
					array(
						'required'     => 'Debe seleccionar el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("AccountBalance", "Balance","required|numeric",
					array(
						'required'     => 'Debe seleccionar el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		if ($this->form_validation->run() == FALSE)
           {
              
			   $respuesta = array(
						"respuesta"=>0,
						"mensaje"=>validation_errors()
						);	
				echo json_encode($respuesta);
           }
		  else{
			  //armo un array para enviar los datos
			  $payments	= array(
				"[Account Number]"=>$this->input->post("account_number"),
				"[Card Number]"=>$this->input->post("card_number"),
				"[Due Date]"=>date("Y-m-d H:i:s"),
				"[Payment Date]"=>date("Y-m-d H:i:s"),
				"Amount"=>abs($this->input->post("valor_recarga")),
				"[Payment Method]"=>"Cash",
				"CheckCardNumber"=>"",
				"CardType"=>"",
				"Payer"=>$this->session->userdata("nombre_usuario")."-WEB",
				"[Notes]"=>$this->input->post("factura"),
				"[Batch Number]"=>1,
				"[Billing Period]"=>1,
				"[CardType]"=>3,
				"[FromDate]"=>date("Y-m-d H:i:s"),
				"[ToDate]"=>date("Y-m-d H:i:s"),
				"strHash"=>"",
				"strMask"=>"",
				"intMediaType"=>$this->input->post("intMediaType"),
				"intFacility"=>$this->input->post("intFacility"),
				"[intTaxType]"=>0,
				"[mnTax]"=>0.0,
				"[intReceiptNumber]"=>1
				
			  );
				//traigo las sucursales
				$las_sucursales = $this->Generalbuscar->TraerSucursales();
			    //verifico si la cuenta esta totalmente desactivada
				$esta_valida_o_invalida =0;
				foreach($las_sucursales as $la_sucursal){
					$lsmCard = array(
						"CardNumber"=>$this->input->post("card_number"),
						"intMediaType"=>$this->input->post("intMediaType"),
						"intFacility"=>$this->input->post("intFacility"),
						"sucursal_nombre_db"=>$la_sucursal->sucursal_nombre_db
					);
					
					$Verificar_intValid_lsmCard = $this->Tarjetasbuscar->Verificar_intValid_lsmCard($lsmCard);
					//si esta valida que ponga a esta_valida_o_invalida a 1
					if($Verificar_intValid_lsmCard == 1){
						$esta_valida_o_invalida = 1; break;
					}
					
				}
				//si la variable esta_valida_o_invalida es 0 significa que la tarjeta esta desactivada en todas las sucursales y aviso que ya se ha desactivado
				if($esta_valida_o_invalida == 0){
					$respuesta = array(
						"respuesta"=>6,
						"mensaje"=>"La tarjeta está DESHABILITADA, para recargarla debe habilitarla EDITÁNDOLA"
					);
					echo json_encode($respuesta); exit;
				} 
				//validadcion par ver si la cuenta es recargable P, el campo 		ZIP=ES_COMUNITARIA tiene que estar vacio
				$Ver_Tipo_De_Cuenta = $this->Cuentasbuscar->TraerDatosDeCuentaEditar($this->input->post("account_number"));
				
				
				/////*****BLOQUE DE VALIDACION PARA TARJETAS EXCLUXIVAS*******//////
				//verificando el tipo de cuenta, si no es CU y el campo ZIP=ES_COMUNITARIA tine otro valor diferente de CU y diferente de nada significa que es exclusiva y hay que verificar si ese valor del ZIP pertenece a un nombre de un db, de lo contrario que de error de aviso
				if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "" && $Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "CU"){
						//busco el nombre de la db
						$Verificar_Existe_Nombre_DB = $this->Generalbuscar->Verificar_Existe_Nombre_DB($Ver_Tipo_De_Cuenta->ES_COMUNITARIA);
						//valido si existe la db
						if($Verificar_Existe_Nombre_DB == 0){
							$respuesta = array(
								"respuesta"=>5,
								"mensaje"=>"La Tarjeta es Exclusivas para un Centro Comercial, pero el elemento con nombre: ".$Ver_Tipo_De_Cuenta->ES_COMUNITARIA." no Existe. Solicite ayuda a un administrador"
							);
							echo json_encode($respuesta); exit;
						}
				}
				///////***FIN BLOQUE DE VALIDACION PARA TARJETAS Exclusivas*****//////
					
				//validacion para las cuentas COMUNITARIA, si es comunitaria, voy y traigo las lsmCard de las sucursales validas y lo agrego a los id_sucursal array indicando donde son validas
				$id_sucursal =array();
				if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA =="CU"){
					foreach($las_sucursales as $filasEncontradas):
							
							//traigo el lsmCard para la tarjeta para la cuenta respectiva de cada db independiente de ecuardo al la db de la sucursal recorridas 
							$lsmCard_filtro = array(
								"sucursal_nombre_db"=>$filasEncontradas->sucursal_nombre_db,
								"strCardNumber"=>$this->input->post("card_number"),
								"intMediaType"=>$this->input->post("intMediaType"),
								"intFacility"=>$this->input->post("intFacility")
							);
							$Traer_lsmCard_Validas_Comunitarias = $this->Tarjetasbuscar->Traer_lsmCard_Validas_Comunitarias($lsmCard_filtro);
							//si count es 1 esa tarjeta esta valida en la db recorrida y que agregue el id de la sucursal al array de id_sucursal
							if($Traer_lsmCard_Validas_Comunitarias == 1){
								$id_sucursal[] =array(
									"id_sucursal"=>$filasEncontradas->id_sucursal,
									"sucursal_nombre_db"=>$filasEncontradas->sucursal_nombre_db
									);
							}
														
						endforeach;
				}
				/*foreach($id_sucursal as $valor):
					echo $valor["sucursal_nombre_db"]."<br>";
				endforeach;
				print_r($id_sucursal); exit;*/
				///FIN BLOQUE DE validacion par las tarjetas comunitarias****
				//envio los datos al modelo para insertar la recarga
				$insertar = $this->Paymentsinsertar->AgregarRecarga($payments, $this->input->post("AccountBalance"), $id_sucursal, $las_sucursales, $Ver_Tipo_De_Cuenta->ES_COMUNITARIA);
				if($insertar){
					$respuesta = array(
						"respuesta"=>1,
						"AccountBalance"=>number_format($this->input->post("AccountBalance"), 2),
						"NuevoBalance"=>number_format($this->input->post("AccountBalance") + abs($this->input->post("valor_recarga")), 2),
						"Recarga"=>number_format(abs($this->input->post("valor_recarga")),2)
						);	
					echo json_encode($respuesta);
				}
				else{
					$respuesta = array(
						"respuesta"=>2,
						"AccountBalance"=>"Errores al Generar, consulte a un administrador",
						"NuevoBalance"=>"",
						"Recarga"=>""
						);	
					echo json_encode($respuesta);
				}
		  }
	}
	//CALLBACK para verificar si el NUMERO de la FACTURA o TRANSACCION ya existe
	public function ChequearExisteFacturaTrasaccion($factura)
	{
		$resultado = $this->Tarjetasbuscar->ChequearExisteFacturaTrasaccion($factura);
		if($resultado > 0)//el usuario ya existe
		{
			$this->form_validation->set_message("ChequearExisteFacturaTrasaccion", "El No. de Factura o Transacci&oacute;n ya existe");
			return FALSE;
		}	
		return TRUE;
		
	}
	public function BuscarMovimientosTarjeta()
	{
		$this->form_validation->set_rules("card_number", "Tarjeta","required|numeric",
				array(
						'required'      => 'Debe elegir una %s.'
					)
			);
		$this->form_validation->set_rules("intMediaType", "Tipo de tarjeta","required|numeric",
					array(
						'required'     => 'Debe seleccionar el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("intFacility", "Facility COD","required|numeric",
					array(
						'required'     => 'Debe seleccionar el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		
		if ($this->form_validation->run() == FALSE)
           {
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$payments	= array(
				
						"CardNumber"=>$this->input->post("card_number"),
						"intMediaType"=>$this->input->post("intMediaType"),
						"intFacility"=>$this->input->post("intFacility")
						
					  );
				
				//hago esto por las tildes y acentos el json no funciona con tildes y acentos, de lo contrario se enviaria el resutlado de un solo en json
				$datos = array();
				$BuscarMovimientosTarjeta = $this->Tarjetasbuscar->BuscarMovimientosTarjeta($payments);
				foreach($BuscarMovimientosTarjeta as $filasEncontradas):
						$datos[] = array(
								"PaymentDate"=>date("d-m-Y H:i:s", strtotime($filasEncontradas->PaymentDate)),
								"Amount"=>$filasEncontradas->Amount,
								"PaymentMethod"=>$filasEncontradas->PaymentMethod,
								"Payer"=>$filasEncontradas->Payer,
								"FACTURA"=>$filasEncontradas->FACTURA,
								"TARJETA"=>$filasEncontradas->TARJETA,
								"AccountNumber"=>$filasEncontradas->AccountNumber,
								"AccountName"=>utf8_encode($filasEncontradas->AccountName),
								"FirstName"=>utf8_encode($filasEncontradas->FirstName),
								"LastName"=>utf8_encode($filasEncontradas->LastName),
								"AccountBalance"=>$filasEncontradas->AccountBalance
						);
				//echo utf8_encode($filasEncontradas->CARD_NOMBRE)."<br>";
				endforeach;
				
				//envio los datos al modelo 
				echo json_encode($datos);
				exit;
				
		  }
	}
	public function VistaRevertirRecarga()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(4);
		$mostrar["contenido"] 			= "tarjetas/vista_revertir_recarga";
		$this->load->view("plantilla", $mostrar);

	}
	public function BuscarTransaccion()
	{
		$this->form_validation->set_rules("numero_transaccion", "No. de Factura o Transacci&oacute;n","required|numeric",
				array(
						'required'      => 'Debe digitar el %s.'
					)
			);
		
		
		if ($this->form_validation->run() == FALSE)
           {
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Payments	= array(
				
						"Notes"=>$this->input->post("numero_transaccion")
						
					  );
				
				//envio los datos al modelo 
				
				$BuscarTransaccion = $this->Tarjetasbuscar->BuscarTransaccion($Payments);
				if($BuscarTransaccion){
					$respuesta = array(
								"respuesta"=>1,
								"ID"=>$BuscarTransaccion->RecNo,
								"FacturaTrasaccion"=>$BuscarTransaccion->Notes,
								"NumeroCuenta"=>$BuscarTransaccion->AccountNumber,
								"NumeroTarjeta"=>$BuscarTransaccion->CardNumber,
								"Monto"=>number_format($BuscarTransaccion->Amount,2),
								"FECHA"=>date("d-m-Y H:i:s", strtotime($BuscarTransaccion->FECHA)),
								"Vendedor"=>$BuscarTransaccion->Payer
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
	public function RevertirRecarga(){
		$this->form_validation->set_rules("numero_transaccion", "No. de Factura o Transacci&oacute;n","required|numeric",
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("RecNo", "ID del movimiento","required|numeric",
					array(
						'required'     => 'El %s es requerido',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("Amount", "Monto de la recarga","required|numeric",
					array(
						'required'     => 'El %s es requerido',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("account_number", "No. de Cuenta","required",
					array(
						'required'     => 'El %s es requerido'
					)
				);
		
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
				
			  //traigo el balace acutal de la cuenta recargada
			  $AccountBalance = $this->Tarjetasbuscar->TraerBalanceAcutal($this->input->post("account_number"));
			  //traigo los datos de la trasaccion origial para utilizarlos
			  $Payments	= array(
				
						"Notes"=>$this->input->post("numero_transaccion")
						
					  );
			  $datosTransaccion = $this->Tarjetasbuscar->BuscarTransaccion($Payments);
			  $datosTransaccion = array(
								"CardNumber"=>$datosTransaccion->CardNumber,
								"intMediaType"=>$datosTransaccion->intMediaType,
								"intFacility"=>$datosTransaccion->intFacility
								);
			  
			  $balaceNuevo 	  = $AccountBalance + $this->input->post("Amount");
			  //valido si el nuevo balance es menor a 0 si es asi que se el AccountBalance se quede a 0 y no en numeros negativos
			  if(abs($balaceNuevo) <= 0){
				  $balaceNuevo = 0;
			  }
			  else {
				  $balaceNuevo = $balaceNuevo;
			  }
				
			  //armo un array para enviar los datos
			  $PaymentsData	= array(
				"balaceNuevo"=>$balaceNuevo,
				"AccountBalanceAnterior"=>$AccountBalance
				
			  );
			  $PaymentsCondicion	= array(
				"RecNo"=>$this->input->post("RecNo"),
				"numero_transaccion"=>$this->input->post("numero_transaccion"),
				"Amount"=>$this->input->post("Amount"),
				"account_number"=>$this->input->post("account_number"),
				
				
			  );
				//traigo las sucursales para revertir la recarga en todas sin filtros, independientemente sean recargables, comunes o exclusivas
				$las_sucursales = $this->Generalbuscar->TraerSucursales();
				
				//envio los datos al modelo para insrtar la recarga
				$eliminar = $this->Paymentseliminar->RevertirRecarga($PaymentsData, $PaymentsCondicion, $datosTransaccion, $las_sucursales);
				if($eliminar){
					$respuesta = array(
						"respuesta"=>1,
						"mensaje"=>"La recarga se ha revertido correctamente."
						);	
					echo json_encode($respuesta);
				}
				else{
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>"Hubieron ERRORES inesperados, informe a un administrador."
						);	
					echo json_encode($respuesta);
				}
		  }
	}
	public function VistaAjustarRecarga()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(5);
		$mostrar["contenido"] 			= "tarjetas/vista_ajustar_recarga";
		$this->load->view("plantilla", $mostrar);

	}
	public function BuscarUltimaRecargaDeTarjeta()
	{
		$this->form_validation->set_rules("card_number", "No. de Tarjeta","required|numeric",
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("account_number", "Cuenta","required",
					array(
						'required'     => 'La %s es requerido'
					)
				);
		$this->form_validation->set_rules("intMediaType", "intMediaType","required|numeric",
					array(
						'required'     => 'El %s es requerido',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("intFacility", "intFacility","required|numeric",
					array(
						'required'     => 'El %s es requerido'
					)
				);
		
		
		if ($this->form_validation->run() == FALSE)
           {
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Payments	= array(
				
						"card_number"=>$this->input->post("card_number"),
						"account_number"=>$this->input->post("account_number"),
						"intMediaType"=>$this->input->post("intMediaType"),
						"intFacility"=>$this->input->post("intFacility")
						
					  );
				
				//envio los datos al modelo 
				
				$BuscarUltimaRecarga = $this->Tarjetasbuscar->BuscarUltimaRecarga($Payments);
				if($BuscarUltimaRecarga){
					$respuesta = array(
								"respuesta"=>1,
								"ID"=>$BuscarUltimaRecarga->RecNo,
								"FacturaTrasaccion"=>$BuscarUltimaRecarga->Notes,
								"NumeroCuenta"=>$BuscarUltimaRecarga->AccountNumber,
								"NumeroTarjeta"=>$BuscarUltimaRecarga->CardNumber,
								"Monto"=>number_format($BuscarUltimaRecarga->Amount,2),
								"FECHA"=>date("d-m-Y H:i:s", strtotime($BuscarUltimaRecarga->PaymentDate)),
								"Vendedor"=>$BuscarUltimaRecarga->Payer
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
	public function AjustarRecarga()
	{
		$this->form_validation->set_rules("card_number", "No. de Tarjeta","required|numeric",
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("account_number", "Cuenta","required",
					array(
						'required'     => 'La %s es requerido'
					)
				);
		$this->form_validation->set_rules("intMediaType", "intMediaType","required|numeric",
					array(
						'required'     => 'El %s es requerido',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		$this->form_validation->set_rules("intFacility", "intFacility","required|numeric",
					array(
						'required'     => 'El %s es requerido'
					)
				);
		$this->form_validation->set_rules("valorRealRecarga", "Valor real","required|numeric",
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor del %s debe ser num&eacute;rica'
					)
			);
		
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
				
			  //traigo el balace acutal de la cuenta recargada
			  $AccountBalance = $this->Tarjetasbuscar->TraerBalanceAcutal($this->input->post("account_number"));
			  //traigo los datos de la trasaccion origial para utilizarlos
			  $Payments	= array(
				
						"card_number"=>$this->input->post("card_number"),
						"account_number"=>$this->input->post("account_number"),
						"intMediaType"=>$this->input->post("intMediaType"),
						"intFacility"=>$this->input->post("intFacility")
					  );
			  $datosUltimaRecarga = $this->Tarjetasbuscar->BuscarUltimaRecarga($Payments);
			  /*$datosUltimaRecarga = array(
								"CardNumber"=>$datosUltimaRecarga->CardNumber,
								"intMediaType"=>$datosUltimaRecarga->intMediaType,
								"intFacility"=>$datosUltimaRecarga->intFacility,
								"Amount"=>$datosUltimaRecarga->Amount
								);
			  */
			  $balaceOriginalAlQuitarUltimaRecarga 	  = $AccountBalance + $datosUltimaRecarga->Amount;
			  /*
			  //valido para ver si el valor de la recarga real digitado es mayor al de la ultima recarga realizada, si es asi qeu laze mensaje de error
			  if(abs($this->input->post("valorRealRecarga")) > $datosUltimaRecarga->Amount){
				  $respuesta = array(
						"respuesta"=>2,
						"mensaje"=>"ERROR: El valor digitado de la recarga es mayor que la Recarga a ajustar"
						);	
					echo json_encode($respuesta);
					exit;//aborto
			  }*/
			  //valido si el nuevo balance es menor a 0 si es asi que se el AccountBalance se quede a 0 y no en numeros negativos
			  if(abs($balaceOriginalAlQuitarUltimaRecarga) <= 0){
				  $balaceOriginalAlQuitarUltimaRecarga = 0;
			  }
			  else {
				  $balaceOriginalAlQuitarUltimaRecarga = $balaceOriginalAlQuitarUltimaRecarga;
			  }
				
			  //armo un array para enviar los datos y actualziar el AccountBalance
			  $PaymentsData	= array(
				"balaceNuevo"=>$balaceOriginalAlQuitarUltimaRecarga - abs($this->input->post("valorRealRecarga")),
				"AccountBalanceAnterior"=>$AccountBalance,
				"valorRealRecarga"=>abs($this->input->post("valorRealRecarga"))
				
			  );
			  $PaymentsCondicion	= array(
				"RecNo"=>$datosUltimaRecarga->RecNo,
				"Notes"=>$datosUltimaRecarga->Notes,
				"Amount"=>$datosUltimaRecarga->Amount,
				"account_number"=>$this->input->post("account_number")			
				
			  );
				//envio los datos al modelo para insrtar la recarga
				$eliminar = $this->Paymentsactualizar->AjustarRecarga($PaymentsData, $PaymentsCondicion);
				if($eliminar){
					$respuesta = array(
						"respuesta"=>1,
						"mensaje"=>"La recarga se ha AJUSTADO correctamente."
						);	
					echo json_encode($respuesta);
				}
				else{
					$respuesta = array(
						"respuesta"=>0,
						"mensaje"=>"Hubieron ERRORES inesperados, informe a un administrador."
						);	
					echo json_encode($respuesta);
				}
		  }
	}
	public function VistaFacilityCode()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(8);
		$mostrar["TaerListadoFacilityCode"] 	= $this->Tarjetasbuscar->TaerListadoFacilityCode();
		$mostrar["contenido"] 			= "tarjetas/vista_listado_facility_code";
		$this->load->view("plantilla", $mostrar);

	}
	public function AgregarFacilityCode()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(8);
		$mostrar["contenido"] = "tarjetas/vista_nuevo_facility_code";
		$this->load->view("plantilla", $mostrar);		
	}
	public function RegistrarFacilityCode()
	{
		$this->form_validation->set_rules("intFacility", "Facility Code","required|numeric|callback_ChequearExistenciaFacilityCode",
				array(
						'required'      => 'Debe digitar el %s',
						'min_length'	=> 'El %s debe ser num&eacute;rico'
					)
			);
						
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Tarjetas = array(
						"intFacility"=>$this->input->post('intFacility')
					  );
				
					//envio los datos al modelo
					$insertar = $this->Tarjetasinsertar->RegistrarFacilityCode($adm_Tarjetas);
					if($insertar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	//CALLBACK para verificar si el facilityCode existe
	public function ChequearExistenciaFacilityCode($intFacility)
	{
		$resultado = $this->Tarjetasbuscar->ChequearExistenciaFacilityCode($intFacility);
		if($resultado > 0)//el ya existe
		{
			$this->form_validation->set_message("ChequearExistenciaFacilityCode", 'El Facility Code que se intenta registrar ya existe');
			return FALSE;
		}	
		return TRUE;
		
	}
	public function DesactivarFacilityCode()
	{
		$this->form_validation->set_rules("id_tarjeta", "Facility Code","required",
				array(
						'required'      => 'Debe selecionar el %s'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Tarjetas = array(
						"id_tarjeta"=>$this->input->post('id_tarjeta'),
						"intFacility"=>$this->input->post('intFacility')
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Tarjetasactualizar->DesactivarFacilityCode($adm_Tarjetas);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	public function ActivarFacilityCode()
	{
		$this->form_validation->set_rules("id_tarjeta", "Facility Code","required",
				array(
						'required'      => 'Debe selecionar el %s'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Tarjetas = array(
						"id_tarjeta"=>$this->input->post('id_tarjeta'),
						"intFacility"=>$this->input->post('intFacility')
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Tarjetasactualizar->ActivarFacilityCode($adm_Tarjetas);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	public function VistaReporteRecarga(){
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(9);
		$this->form_validation->set_rules("FechaDesde", "Fecha Desde","required",
				array(
						'required'      => 'La %s es requerida'
					)
			);
		$this->form_validation->set_rules("FechaHasta", "Fecha Hasta","required",
					array(
						'required'     => 'La %s es requerida'
					)
				);
				
		
		if ($this->form_validation->run() == FALSE)
           {
              
			   
				
           }
		  else{
			 
				
				$Payments	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
			$mostrar["TraerRecargasPorFecha"] = $this->Reportesbuscar->TraerRecargasPorFecha($Payments);
		  }
		$mostrar["contenido"] = "tarjetas/vista_reporte_recargas";
		$this->load->view("plantilla", $mostrar);
	}
	public function VistaReporteCargos(){
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(10);
		$this->form_validation->set_rules("FechaDesde", "Fecha Desde","required",
				array(
						'required'      => 'La %s es requerida'
					)
			);
		$this->form_validation->set_rules("FechaHasta", "Fecha Hasta","required",
					array(
						'required'     => 'La %s es requerida'
					)
				);
				
		
		if ($this->form_validation->run() == FALSE)
           {
              
			   
				
           }
		  else{
			 
				
				$Invoices	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
			$mostrar["TraerCargosPorFecha"] = $this->Reportesbuscar->TraerCargosPorFecha($Invoices);
		  }
		$mostrar["contenido"] = "tarjetas/vista_reporte_cargos";
		$this->load->view("plantilla", $mostrar);
	}
	public function VistaRegistrarTarjeta(){
		$this->VerSiUsuarioTieneAccesoAlaOpcion(11);
		//traigo el listado de los FacilityCode activos
		$mostrar["TaerFacilityCodeActivos"]		= $this->Tarjetasbuscar->TaerFacilityCodeActivos();
		//traigo los time Zone
		$mostrar["TraerTimesZones"]	= $this->Tarjetasbuscar->TraerTimesZones();
		$mostrar["contenido"] 			= "tarjetas/vista_agregar_tarjeta";
		$this->load->view("plantilla", $mostrar);
	}
	public function TraerTarjetasDeCuenta(){
		$this->form_validation->set_rules("AccountNumber", "No. de Cuenta","required",
				array(
						'required'      => 'Digite el %s.'
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
			 
				
				$Cards	= array(
						"AccountNumber"=>$this->input->post("AccountNumber")						
					  );
				
				//traigo los datos encontrados
				$TraerTarjetasDeCuenta = $this->Tarjetasbuscar->TraerTarjetasDeCuenta($Cards);
				//recorro los resultados para formatear las tildes y ñ y el json los muestre sino no se muestran
				$datos = array();
				
				foreach($TraerTarjetasDeCuenta as $filasEncontradas):
					$ToDate = "N/A";
					if($filasEncontradas->AUTOEXPIRA == 'SI'){
						$ToDate= date("d-m-Y", strtotime($filasEncontradas->ToDate));
					}
					
				
					$datos[] = array(
						"CardNumber"=>$filasEncontradas->CardNumber,
						"intMediaType"=>$filasEncontradas->intMediaType,
						"intFacility"=>$filasEncontradas->intFacility,
						"FromDate"=>date("d-m-Y", strtotime($filasEncontradas->FromDate)),
						"ToDate"=>$ToDate,
						"CARD_NOMBRE"=>utf8_encode($filasEncontradas->CARD_NOMBRE),
						"AUTOEXPIRA"=>$filasEncontradas->AUTOEXPIRA,
						"dtCreated"=>date("d-m-Y H:i:s", strtotime($filasEncontradas->dtCreated)),
						"ES_COMUNITARIA"=>$filasEncontradas->ES_COMUNITARIA//,
						//"NOMBRE_TIPO_TARJETA"=>utf8_encode($filasEncontradas->NOMBRE_TIPO_TARJETA)
					);
				endforeach;
				//valido si es comunitaria par taer las sucurslaes
		       if($datos[0]["ES_COMUNITARIA"] == 'CU'){
					//traigo las sucursales para insertar los lsmCard a cada db independiente
					$las_sucursales		= $this->Generalbuscar->TraerSucursales();
			   }
			   else{
				   $las_sucursales ="";
			   }
				if($TraerTarjetasDeCuenta){
					$respuesta = array(
								"respuesta"=>1,
								"mensaje"=>$datos,
								"sucursales"=>$las_sucursales
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
	public function RegistrarTarjeta(){
			  
		$this->form_validation->set_rules("buscar_cuenta", "Buscar una Cuenta","required",
				array(
						'required'      => 'Debe %s.'
					)
			);
		$this->form_validation->set_rules("CardNumber", "No. de la Tarjeta",'required|numeric',
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("AccountNumber", "No. de la Cuenta",'required',
				array(
						'required'      => 'Digite el %s.'
					)
			);
		$this->form_validation->set_rules("FirstName", "Nombre","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres %s' 
					)
			);
		$this->form_validation->set_rules("LastName", "Apelldio","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres %s'
					)
				);
		$this->form_validation->set_rules("dui", "DUI","required",
					array(
						'required'     => 'Digite el %s'
						//'numeric'      => 'El valor de la %s debe ser numerica'
					)
				);
		$this->form_validation->set_rules("intFacility", "Facility Code","required|numeric",
					array(
						'required'     => 'Elija el %s',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		/*$this->form_validation->set_rules("tipo_tarjeta", "Tipo de Tarjeta","required",
					array(
						'required'     => 'Elija el %s'
					)
				);*/
		$this->form_validation->set_rules("intTimeZone", "Time Zone","required|callback_ChequearRangoNumerico",
					array(
						'required'     	=> 'Digite el %s'
					)
				);
		$this->form_validation->set_rules("intAccessLevel", "Acces Level","required|callback_ChequearRangoNumerico",
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
		 /*
		if($this->input->post("intMediaType") == 4){
			
			$this->form_validation->set_rules("ToDate", "Fecha de Vencimiento","required",
					array(
						'required'     => 'Elija una %s'
					)
				);
		}*/
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
		if($this->input->post("ES_COMUNITARIA") == 1){
			$this->form_validation->set_rules("id_sucursal[]", "Centros Comerciales","required|numeric",
					array(
						'required'     => 'Seleccione los %s a los que pertenecer&aacute;  la Tarjeta',
						'numeric'      => 'El valor de los %s debe ser num&eacute;rico'
					)
				);
		}
		if ($this->form_validation->run() == FALSE)
           {
               $respuesta = array(
					"respuesta"=>0,
					"mensaje"=>validation_errors()
				);
			   echo json_encode($respuesta);
           }
		  else{
			  //echo $this->input->post("ToDate"); echo 4; exit;
			 /*valido si la vecha ingresada es menor a la de hoy si el intMediaType = 4 (Media en el formulario)
			 if($this->input->post("ToDate") == "PC" || $this->input->post("tipo_tarjeta") == "PM"){
				 if(date("Y-m-d", strtotime($this->input->post("ToDate"))) <= date("Y-m-d")){
					 
						 $respuesta = array(
							"respuesta"=>4,
							"mensaje"=>"La fecha elejida debe ser mayor a la de hoy"
						);
					   echo json_encode($respuesta);
					exit;
				 }
			 }
			 */
			 
			 $AccountNumber 	= $this->input->post("AccountNumber");
			 $CardNumber 		= $this->input->post("CardNumber");
			 $intMediaType 		= $this->input->post("intMediaType");
			 $UsageCard			= $this->input->post("UsageCard");
			 $intAccessLevel	= $this->input->post("intAccessLevel");
			 $ES_COMUNITARIA	= $this->input->post("ES_COMUNITARIA");
			 $id_sucursal		= $this->input->post("id_sucursal");
			 $FromDate			= date("Y-m-d");
			 $ToDate			= date("Y-m-d");
			 $dtValidToDate		= date("Y-m-d");
			 $Rate				= "";
			 
			  $CardSubtype = $intUsageType = $bitFacilitySynced = $AutoExpire = $VIP = 0;
			  $Code			= 1; $intRawStatus = 260;
			  if($this->input->post("ToDate") != ""){
				  if(date("Y-m-d", strtotime($this->input->post("ToDate"))) <= date("Y-m-d")){
					 
						 $respuesta = array(
							"respuesta"=>4,
							"mensaje"=>"La fecha elejida debe ser mayor a la de hoy"
						);
					   echo json_encode($respuesta);
					exit;
				 }
				  $ToDate			= date("Y-m-d", strtotime($this->input->post("ToDate")));
				  $dtValidToDate	= $ToDate;
				  $AutoExpire		= 1;
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
			"CardNumber"=>$CardNumber,
			"intMediaType"=>$intMediaType,
			"intFacility"=>$this->input->post("intFacility")
		);	
		*/
		//print_r($CardsCallback);
		
			  $VerificarSiExisteTarjeta = $this->Cuentasbuscar->VerificarSiExisteTarjeta($CardNumber);
			  if($VerificarSiExisteTarjeta > 0){
				  $respuesta = array(
						"respuesta"=>2,
						"mensaje"=>"La Tarjeta ya existe.  Solicite ayuda a un administrador"
					);
				   echo json_encode($respuesta);
				 exit;
				}
				
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
					  //echo count($id_sucursal); exit;
					  //traigo los datos de la cuanta para verificar que tipo de cuenta es
					  $Ver_Tipo_De_Cuenta = $this->Cuentasbuscar->TraerDatosDeCuentaEditar($AccountNumber);
					  					  
					 //traigo las sucursales para insertar los lsmCard a cada db independiente
					 $las_sucursales		= $this->Generalbuscar->TraerSucursales();
					//envio los datos al modelo
					
					/////*****BLOQUE DE VALIDACION PARA TARJETAS EXCLUXIVAS*******//////
					//verificando el tipo de cuenta, si no es CU y el campo ZIP=ES_COMUNITARIA tine otro valor diferente de CU y diferente de nada significa que es exclusiva y hay que verificar si ese valor del ZIP pertenece a un nombre de un db, de lo contrario que de error de aviso
					if($Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "" && $Ver_Tipo_De_Cuenta->ES_COMUNITARIA != "CU"){
						//busco el nombre de la db
						$Verificar_Existe_Nombre_DB = $this->Generalbuscar->Verificar_Existe_Nombre_DB($Ver_Tipo_De_Cuenta->ES_COMUNITARIA);
						//valido si existe la db
						if($Verificar_Existe_Nombre_DB == 0){
							$respuesta = array(
								"respuesta"=>5,
								"mensaje"=>"La Cuenta y Tarjeta son Exclusivas para un Centro Comercial, pero la Base de Datos con nombre: ".$Ver_Tipo_De_Cuenta->ES_COMUNITARIA." no Existe. Solicite ayuda a un administrador"
							);
							echo json_encode($respuesta); exit;
						}
					}
					///////***FIN BLOQUE DE VALIDACION PARA TARJETAS Exclusivas*****//////
					
					/***BLOQUE DE VALIDACION PARA LAS CUENTAS Y TARJETAS COMUNITARIAS*/
						// {no pasa nada la validacion se hace en el modelo}
					/*FIN BLOQUE DE VALIDACION PARA CUENTAS Y TARJETAS COMUNITARIAS**/
					$insertar = $this->Tarjetasinsertar->RegistrarTarjeta($Cards, $lsmCard, $id_sucursal, $las_sucursales, $Ver_Tipo_De_Cuenta);
					if($insertar){
						echo 1;
					}
					else{
						echo 0;
					}				
		  }
	}
	//CALLBACK para verificar si el intAccessLevel y intTimeZone son menores o iguales a 63
	public function ChequearRangoNumerico($campo)
	{
		if($campo > 63 || $campo < 0)//es mayor a 63
		{
			$this->form_validation->set_message("ChequearRangoNumerico", "El valor de %s debe ser mayor o igual a 0 y menor o igual a 63");
			return FALSE;
		}	
		return TRUE;
		
	}
	public function TraerDatosDeTarjetaParaEditar(){
		$this->form_validation->set_rules("AccountNumber", "No. de Cuenta","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		$this->form_validation->set_rules("CardNumber", "No. de Tarjeta","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		$this->form_validation->set_rules("intMediaType", "Midia Type","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		$this->form_validation->set_rules("intFacility", "Facility Code","required",
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
			 
				
				$Cards	= array(
						"AccountNumber"=>$this->input->post("AccountNumber"),
						"CardNumber"=>$this->input->post("CardNumber"),
						"intMediaType"=>$this->input->post("intMediaType"),
						"intFacility"=>$this->input->post("intFacility")
					  );
				
				//traigo los datos encontrados
				$TraerDatosDeTarjetaParaEditar = $this->Tarjetasbuscar->TraerDatosDeTarjetaParaEditar($Cards);
				//resultados para formatear las tildes y ñ y el json los muestre, si no solo enviara el resultado de un solo
				$datos =  array(
						"CardNumber"=>$TraerDatosDeTarjetaParaEditar->CardNumber,
						"intMediaType"=>$TraerDatosDeTarjetaParaEditar->intMediaType,
						"intFacility"=>$TraerDatosDeTarjetaParaEditar->intFacility,
						"FromDate"=>date("d-m-Y", strtotime($TraerDatosDeTarjetaParaEditar->FromDate)),
						"ToDate"=>date("d-m-Y", strtotime($TraerDatosDeTarjetaParaEditar->ToDate)),
						"FirstName"=>utf8_encode($TraerDatosDeTarjetaParaEditar->FirstName),
						"LastName"=>utf8_encode($TraerDatosDeTarjetaParaEditar->LastName),
						"AutoExpire"=>$TraerDatosDeTarjetaParaEditar->AutoExpire,
						"DUI"=>$TraerDatosDeTarjetaParaEditar->DUI,
						"TIPO_TARJETA"=>$TraerDatosDeTarjetaParaEditar->TIPO_TARJETA,
						"NOMBRE_TIPO_TARJETA"=>$TraerDatosDeTarjetaParaEditar->NOMBRE_TIPO_TARJETA,
						"UsageCard"=>$TraerDatosDeTarjetaParaEditar->UsageCard,
						"CardSubtype"=>$TraerDatosDeTarjetaParaEditar->CardSubtype,
						"Rate"=>$TraerDatosDeTarjetaParaEditar->Rate,
						"VIP"=>$TraerDatosDeTarjetaParaEditar->VIP,
						//"ToDate"=>date("d-m-Y", strtotime($TraerDatosDeTarjetaParaEditar->ToDate)),
						"intTimeZone"=>$TraerDatosDeTarjetaParaEditar->intTimeZone,
						"intAccessLevel"=>$TraerDatosDeTarjetaParaEditar->intAccessLevel
					);
				//verifico si la cuenta es comunitaria o no
				$Es_Cuenta_Comunitaria = $this->Cuentasbuscar->TraerDatosDeCuentaEditar($Cards["AccountNumber"]);
				
				//si la cuenta es comunitaria que busque las sucursales y que traga los datos para ver si esta valida o no en cada uno de las dbs independientes.
				//armo los datos en un array
				$tblSucursales 					= 0;
				$lsmCard_De_DB_Independiente 	= array();
				if($Es_Cuenta_Comunitaria->ES_COMUNITARIA == 'CU'){
					$tblSucursales 		= 1;
					//traigo las sucursales para buscar las lsmCard en cada db independiente y ver donde esta valida y donde no
					$las_sucursales		= $this->Generalbuscar->TraerSucursales();
					
					
					foreach($las_sucursales as $filasEncontradas):
						//$ToDate = "N/A";
						//if($filasEncontradas->AUTOEXPIRA == 'SI'){
						//	$ToDate= date("d-m-Y", strtotime($filasEncontradas->ToDate));
						//}
						
						//traigo el lsmCard para la tarjeta para la cuenta respectiva de cada db independiente de ecuardo al la db de la sucursal recorridas
						$lsmCard_filtro = array(
							"sucursal_nombre_db"=>$filasEncontradas->sucursal_nombre_db,
							"strCardNumber"=>$this->input->post("CardNumber"),
							"intMediaType"=>$this->input->post("intMediaType"),
							"intFacility"=>$this->input->post("intFacility")
						);
						$Traer_lsmCard_Independiente = $this->Tarjetasbuscar->Traer_lsmCard_Independiente($lsmCard_filtro);
						
						$lsmCard_De_DB_Independiente[] = array(
							"id_sucursal"=>$filasEncontradas->id_sucursal,
							"sucursal_nombre"=>$filasEncontradas->sucursal_nombre,
							"ESTADO_VALID"=>$Traer_lsmCard_Independiente->ESTADO_VALID,
						);
					endforeach;
				}
				//print_r($lsmCard_De_DB_Independiente); exit;
				
				if($TraerDatosDeTarjetaParaEditar){
					$respuesta = array(
								"respuesta"=>1,
								"tblSucursales"=>$tblSucursales,
								"mensaje"=>$datos,
								"lsmCard"=>$lsmCard_De_DB_Independiente
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
	public function ModificarTarjeta(){
			  
		$this->form_validation->set_rules("buscar_cuenta", "Buscar una Cuenta","required",
				array(
						'required'      => 'Debe %s.'
					)
			);
		$this->form_validation->set_rules("CardNumber", "No. de la Tarjeta",'required|numeric',
				array(
						'required'      => 'Digite el %s.',
						'numeric'      => 'El valor de la %s debe ser num&eacute;rica'
					)
			);
		$this->form_validation->set_rules("AccountNumber", "No. de la Cuenta",'required',
				array(
						'required'      => 'Digite el %s.'
					)
			);
		$this->form_validation->set_rules("FirstName", "Nombre","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres %s' 
					)
			);
		$this->form_validation->set_rules("LastName", "Apelldio","required|max_length[16]",
				array(
						'required'      => 'Digite el %s.',
						'max_length'	=>'M&aacute;ximo de caracteres %s'
					)
				);
		$this->form_validation->set_rules("dui", "DUI","required",
					array(
						'required'     => 'Digite el %s'
						//'numeric'      => 'El valor de la %s debe ser numerica'
					)
				);
		$this->form_validation->set_rules("intFacility", "Facility Code","required|numeric",
					array(
						'required'     => 'Elija el %s',
						'numeric'      => 'El valor del %s debe ser num&eacute;rico'
					)
				);
		/*$this->form_validation->set_rules("tipo_tarjeta", "Tipo de Tarjeta","required",
					array(
						'required'     => 'Elija el %s'
					)
				);*/
		$this->form_validation->set_rules("intTimeZone", "Time Zone","required|callback_ChequearRangoNumerico",
					array(
						'required'     	=> 'Digite el %s'
					)
				);
		$this->form_validation->set_rules("intAccessLevel", "Acces Level","required|callback_ChequearRangoNumerico",
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
		//si el UsageCard es Debit=3; el CardSubtype y el Rate son obligatorios
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
		
		if($this->input->post("ES_COMUNITARIA") == "CU"){
			$this->form_validation->set_rules("id_sucursal[]", "Centros Comerciales","required|numeric",
					array(
						'required'     => 'Seleccione los %s a los que pertenecer&aacute; la Tarjeta',
						'numeric'      => 'El valor de los %s debe ser num&eacute;rico'
					)
			);
		}
		
		if ($this->form_validation->run() == FALSE)
           {
               $respuesta = array(
					"respuesta"=>0,
					"mensaje"=>validation_errors()
				);
			   echo json_encode($respuesta);
           }
		  else{
			 /* 
			  //echo $this->input->post("ToDate"); echo 4; exit;
			 //valido si la vecha ingresada es menor a la de hoy
			 if($this->input->post("tipo_tarjeta") == "PC" || $this->input->post("tipo_tarjeta") == "PM"){
				 if(date("Y-m-d", strtotime($this->input->post("ToDate"))) <= date("Y-m-d")){
					 
						 $respuesta = array(
							"respuesta"=>4,
							"mensaje"=>"La fecha elejida debe ser mayor a la de hoy"
						);
					   echo json_encode($respuesta);
					exit;
				 }
			 }
			 */
			 $AccountNumber 	= $this->input->post("AccountNumber");
			 $CardNumber 		= $this->input->post("CardNumber");
			 $intMediaType 		= $this->input->post("intMediaType");
			 $UsageCard			= $this->input->post("UsageCard");
			 $intAccessLevel	= $this->input->post("intAccessLevel");
			 $FromDate			= date("Y-m-d", strtotime($this->input->post("FromDate")));
			 $ToDate			= date("Y-m-d", strtotime($this->input->post("ToDate")));
			 $dtValidToDate		= date("Y-m-d", strtotime($this->input->post("ToDate")));
			 $id_sucursal		= $this->input->post("id_sucursal");
			 $ES_COMUNITARIA	= $this->input->post("ES_COMUNITARIA");
			 $Rate				= "";
			 $CardSubtype		= NULL;
			  //evaluo el intMediaType y el UsageCard
			  $intUsageType = $bitFacilitySynced= $AutoExpire= $VIP = 0;
			  $Code			= 1; $intRawStatus = 260;
			  if($this->input->post("ToDate") != ""){
				  if($ToDate <= $FromDate){
					 
						 $respuesta = array(
							"respuesta"=>4,
							"mensaje"=>"La fecha elejida debe ser mayor a la fecha: "
						);
					   echo json_encode($respuesta);
					exit;
				 }
				  $ToDate			= date("Y-m-d", strtotime($this->input->post("ToDate")));
				  $dtValidToDate	= $ToDate;
				  $AutoExpire		= 1;
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
			  //UsageCard =0:Monthly
			  if($intAccessLevel == 32 && $UsageCard == 0){
				  $VIP =1;
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
			
				  //armo un array para enviar los datos
				  $CardsCondiciones = array(
					"CardNumber"=>$CardNumber,
					"AccountNumber"=>$AccountNumber
				  );
				  $Cards	= array(
						"intMediaType"=>$intMediaType, //Proximity, Magstripe, etc...
						"intFacility"=>$this->input->post("intFacility"),
						"UsageCard"=>$UsageCard, //0=Monthly, 3=Debit, 6=Service, etc..., si no no funciona lo de auto voiding
						"ToDate"=>$ToDate,
						"FirstName"=>utf8_decode($this->input->post("FirstName")),//posible se trunque la infor ya que solo acepta 16 caracteres
						"LastName"=>utf8_decode($this->input->post("LastName")),//posible se trunque la infor ya que solo acepta 16 caracteres
						"AutoExpire"=>$AutoExpire, //0 que no expira 1=expira
						"VIP"=>$VIP,
						"Message"=>$this->input->post("dui"),
						"Code"=>$Code,
						"Rate"=>$Rate,
						"CardSubtype"=>$CardSubtype,
						"dtModified"=>date("Y-m-d H:i:s"),
						"strModifiedByUser"=>$this->session->userdata("nombre_usuario")."-WEB"
									
					  );
					
					//valido la fecha ToDate para ver si es igual a la de hor
					//armo un array para enviar los datos
					$lsmCard	= array(
						"intMediaType"=>$intMediaType,
						"intUsageType"=>$intUsageType,
						"intValid"=>1,
						"intRawStatus"=>$intRawStatus,
						"intFacility"=>$this->input->post("intFacility"),
						"intTimeZone"=>$this->input->post("intTimeZone"),
						"intAccessLevel"=>$intAccessLevel,
						"dtModified"=>date("Y-m-d H:i:s"),
						"dtValidToDate"=>$dtValidToDate, 
						"intActiveAccessLevel"=>$intAccessLevel,
						"intSetupTimeZone"=>$this->input->post("intTimeZone"),
						"bitFacilitySynced"=>$bitFacilitySynced							
					  );
					  
					//traigo las sucursales para poner los lsmCard a cada db independiente el intValid a 0, y luego con los id_sucursal recorer y poner las seleccionadeas en el frm a intValid a 1
					 $las_sucursales		= $this->Generalbuscar->TraerSucursales();
					 
					 /*la validacion para las recargables P se hace en el modelo*/
					 
					 /////*****BLOQUE DE VALIDACION PARA TARJETAS EXCLUXIVAS*******//////
					//verificando el tipo de cuenta, si no es CU y el campo ZIP=ES_COMUNITARIA tine otro valor diferente de CU y diferente de nada significa que es exclusiva y hay que verificar si ese valor del ZIP pertenece a un nombre de un db, de lo contrario que de error de aviso
					if($ES_COMUNITARIA != "" && $ES_COMUNITARIA != "CU"){
						//busco el nombre de la db
						$Verificar_Existe_Nombre_DB = $this->Generalbuscar->Verificar_Existe_Nombre_DB($ES_COMUNITARIA);
						//valido si existe la db
						if($Verificar_Existe_Nombre_DB == 0){
							$respuesta = array(
								"respuesta"=>5,
								"mensaje"=>"La Cuenta y Tarjeta son Exclusivas para un Centro Comercial, pero la Base de Datos con nombre: ".$ES_COMUNITARIA." no Existe. Solicite ayuda a un administrador"
							);
							echo json_encode($respuesta); exit;
						}
					}
					///////***FIN BLOQUE DE VALIDACION PARA TARJETAS Exclusivas*****//////
					
					/*la validacion para las cuantas comunitarias se hace en el modelo*/ 
					 
					//envio los datos al modelo 
					$insertar = $this->Tarjetasactualizar->ModificarTarjeta($Cards, $lsmCard, $CardsCondiciones, $id_sucursal, $las_sucursales, $ES_COMUNITARIA);
					if($insertar){
						echo 1;
					}
					else{
						echo 0;
					}				
		  }
	}
	public function Desactivar_Tarjeta(){
		$this->form_validation->set_rules("CardNumber", "No. de Tarjeta","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		$this->form_validation->set_rules("intMediaType", "Midia Type","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		$this->form_validation->set_rules("intFacility", "Facility Code","required",
				array(
						'required'      => 'Elija el %s.'
					)
			);
		if ($this->form_validation->run() == FALSE){
              
			   //echo validation_errors();
			   $respuesta = array(
								"respuesta"=>0,
								"mensaje"=>validation_errors()
								);
				echo json_encode($respuesta); exit;
        }
		//verificar si esa tarjeta est inactiva en todos las dbs
		//traigo las sucursales para iterar y ver si esta activa o inactiva la tarjeta en cada una de ellas
		$las_sucursales			= $this->Generalbuscar->TraerSucursales();
		$esta_valida_o_invalida 	= 0;
		$lsmCard = array(
			"CardNumber"=>$this->input->post("CardNumber"),
			"intMediaType"=>$this->input->post("intMediaType"),
			"intFacility"=>$this->input->post("intFacility"),
			"intValid"=>0,
			"sucursal_nombre_db"=>"",
			"las_sucursales"=>$las_sucursales
		);
		foreach($las_sucursales as $la_sucursal){
			$lsmCard["sucursal_nombre_db"] =$la_sucursal->sucursal_nombre_db;
			$Verificar_intValid_lsmCard = $this->Tarjetasbuscar->Verificar_intValid_lsmCard($lsmCard);
			//si esta valida que ponga a esta_valida_o_invalida a 1
			if($Verificar_intValid_lsmCard == 1){
				$esta_valida_o_invalida = 1; break;
			}
			
		}
		//si la variable esta_valida_o_invalida es 0 significa que la tarjeta esta desactivada en todas las sucursales y aviso que ya se ha desactivado
		if($esta_valida_o_invalida == 0){
			$respuesta = array(
				"respuesta"=>0,
				"mensaje"=>"La tarjeta ya está DESHABILITADA, para Habilitarla EDÍTELA"
			);
		    echo json_encode($respuesta); exit;
		}
		
		//sino se procede a deshabilitarla
		$deshabilitar = $this->Tarjetasactualizar->Deshabilitar_Tarjeta_En_Todas_Las_Sucursales($lsmCard);
		if($deshabilitar){
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>""
			);
		    echo json_encode($respuesta); exit;
		} 
		  
	}
	public function VistaPruebas(){
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		//$this->VerSiUsuarioTieneAccesoAlaOpcion(10);
		$mostrar["contenido"] = "tarjetas/vista_pruebas";
		$this->load->view("plantilla", $mostrar);
	}
}