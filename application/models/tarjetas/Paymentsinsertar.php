<?php

/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo inserta registros.
*/
class Paymentsinsertar extends CI_Model{ 
	public function AgregarRecarga($payments, $balanceActual, $id_sucursal, $las_sucursales, $ES_COMUNITARIA){
		//insetor los datos en la tabla payments
		//$resultado = $this->db->insert("Payments", $payments);
		//inicio transaccion
		$this->db->trans_start();
		$this->db->query("INSERT INTO Payments([Account Number], [Card Number], [Due Date],
										[Payment Date], Amount, [Payment Method], [Check/Card Number], [Card Type], Payer, [Notes],
										[Batch Number], [Billing Period], [CardType], [FromDate], [ToDate],
										strHash, strMask,
										[intMediaType], [intFacility], [intTaxType], [mnTax], [intReceiptNumber])
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $payments);
		
		
		//actualizo la el AcountBalance de la tabla Acounts
		$this->db->query('UPDATE Accounts SET AccountBalance = AccountBalance -'.$payments['Amount']. 
						'WHERE [Account Number] ='."'".$payments['[Account Number]']."'");
				
		//actualizo la tabla lsmCard para que siempre que recargue la tarjeta la ponga valida Vld en cart manager
		$this->db->query('UPDATE lsmCard SET intValid = 1 
							WHERE  strCardNumber ='."'".$payments['[Card Number]']."'".' 
							AND intMediaType = '.$payments['intMediaType']. ' 
							AND intFacility  = '.$payments['intFacility']);
		
		
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Payments'".", 'INSERT', '".$this->session->userdata("usuario")."', '".'Se RECARGO la tarjeta No. '.$payments['[Card Number]'].' para la cuenta No. '.$payments['[Account Number]'].' con un monto de: '.$payments['Amount']."'  + char(10) +'".' 
						Se actualizo el AccountBalance de la tabla Accounts de '.$balanceActual.' con + '.$payments['Amount'].' para la cuenta en cuestion'."'
						 + char(10) + '".' Se actualizo el intValid a 1 de la tabla lsmCard para la cuenta en cuestion'."')");
		
		//primer if es para las tarjetas recargables P, donde el campo ZIP de la tabla Accounts tiene valor ""
		if($ES_COMUNITARIA == ""){
			//recorro las sucursales y actualizo
			foreach($las_sucursales as $la_sucural){
				$la_db = $la_sucural->sucursal_nombre_db.".dbo";
				//inserto en Payments
				$this->db->query("INSERT INTO $la_db.Payments(
										[Account Number], 
										[Card Number], 
										[Due Date],
										[Payment Date], 
										Amount, 
										[Payment Method], 
										[Check/Card Number], 
										[Card Type], 
										Payer, 
										[Notes],
										[Batch Number], 
										[Billing Period], 
										[CardType], 
										[FromDate], 
										[ToDate],
										strHash, 
										strMask,
										[intMediaType], 
										[intFacility], 
										[intTaxType], 
										[mnTax], 
										[intReceiptNumber]
										)
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $payments);
				//actualizo la tabla lsmCard para que siempre que recargue la tarjeta la ponga valida Vld en cart manager
				$this->db->query("UPDATE $la_db.lsmCard SET intValid = 1 
							WHERE  strCardNumber =? 
							AND intMediaType =? 
							AND intFacility  =?",
								array($payments['[Card Number]'],
								$payments['intMediaType'],
								$payments['intFacility']
									
								)
							);
		
			}
		}
		//segundo if para tarjetes EXCLUSIVAS el campo ZIP=ES_COMUNITARIA de la tabla Accounts  tiene el nombre de la db, recorro las sucursales e inserto el payments donde corresponda en la sucursal exclusiva 
		if($ES_COMUNITARIA != "" && $ES_COMUNITARIA != "CU"){
			//recorro las sucursales y actualizo
			foreach($las_sucursales as $la_sucural){
				$la_db = $la_sucural->sucursal_nombre_db.".dbo";
				//si el nombre de la db de las sucursales recorridas es distinta al nombre de la db verficada del campo ZIP=ES_COMUNITARIA, significa que a esas no se inertara el payments solo a la sucursla exclusiva definida en el campo ZIP de la tabla Accounts
				if($ES_COMUNITARIA == $la_sucural->sucursal_nombre_db){
					//inserto en Payments
					$this->db->query("INSERT INTO $la_db.Payments(
										[Account Number], 
										[Card Number], 
										[Due Date],
										[Payment Date], 
										Amount, 
										[Payment Method], 
										[Check/Card Number], 
										[Card Type], 
										Payer, 
										[Notes],
										[Batch Number], 
										[Billing Period], 
										[CardType], 
										[FromDate], 
										[ToDate],
										strHash, 
										strMask,
										[intMediaType], 
										[intFacility], 
										[intTaxType], 
										[mnTax], 
										[intReceiptNumber]
										)
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $payments);
					//actualizo la tabla lsmCard para que siempre que recargue la tarjeta la ponga valida Vld en cart manager
					$this->db->query("UPDATE $la_db.lsmCard SET intValid = 1 
							WHERE  strCardNumber =? 
							AND intMediaType =? 
							AND intFacility  =?",
								array($payments['[Card Number]'],
								$payments['intMediaType'],
								$payments['intFacility']
									
								)
							);
				}
		
			}
		}
		/*tercer if validacion para las cuentas comunitarias donde el valor del campo ZIP=ES_COMUNITARIA es CU CUENTA UNIVERSAL*/
		if($ES_COMUNITARIA == "CU"){
			//recorro la surcursales validas he inserto los payments
			foreach($id_sucursal as $la_sucural):
				$la_db = $la_sucural["sucursal_nombre_db"].".dbo";
				//inserto en Payments
				$this->db->query("INSERT INTO $la_db.Payments(
										[Account Number], 
										[Card Number], 
										[Due Date],
										[Payment Date], 
										Amount, 
										[Payment Method], 
										[Check/Card Number], 
										[Card Type], 
										Payer, 
										[Notes],
										[Batch Number], 
										[Billing Period], 
										[CardType], 
										[FromDate], 
										[ToDate],
										strHash, 
										strMask,
										[intMediaType], 
										[intFacility], 
										[intTaxType], 
										[mnTax], 
										[intReceiptNumber]
										)
									VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", $payments);
				//actualizo la tabla lsmCard para que siempre que recargue la tarjeta la ponga valida Vld en cart manager
					$this->db->query("UPDATE $la_db.lsmCard SET intValid = 1 
							WHERE  strCardNumber =? 
							AND intMediaType =? 
							AND intFacility  =?",
								array($payments['[Card Number]'],
								$payments['intMediaType'],
								$payments['intFacility']
									
								)
							);
			endforeach;
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
}