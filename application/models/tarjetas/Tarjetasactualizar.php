<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualiza registros.
*/
class Tarjetasactualizar extends CI_Model{ 
	public function DesactivarFacilityCode($adm_Tarjetas){
		//inicio transaccion
		$this->db->trans_start();
		$resultado = $this->db->query("UPDATE DB_CONFIGURACIONES.dbo.adm_Tarjetas SET estado_facility=0 
						WHERE id_tarjeta =?", $adm_Tarjetas['id_tarjeta']);
		
		//inserto en la bitacora
		$this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('adm_Tarjetas', 'UPDATE', '".$this->session->usuario."', "."'Se ACTUALIZO el Facility Code: ".$adm_Tarjetas['intFacility']." para DESACTIVARSE')");
							
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
	public function ActivarFacilityCode($adm_Tarjetas){
		//inicio transaccion
		$this->db->trans_start();
		$resultado = $this->db->query("UPDATE DB_CONFIGURACIONES.dbo.adm_Tarjetas SET estado_facility=1 
						WHERE id_tarjeta =?", $adm_Tarjetas['id_tarjeta']);
		
		//inserto en la bitacora
		$this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('adm_Tarjetas', 'UPDATE', '".$this->session->usuario."', "."'Se ACTUALIZO el Facility Code: ".$adm_Tarjetas['intFacility']." para ACTIVARSE')");
							
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
	public function ModificarTarjeta($Cards, $lsmCard, $CardsCondiciones, $id_sucursal, $las_sucursales, $ES_COMUNITARIA){
		//NOTA: las tablas no tienen restricciones
			
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
		//inserto en la tabla Cards
		$this->db->query("UPDATE Cards SET 
		intMediaType=?, 
		intFacility=?, 
		UsageCard=?, 
		[To Date]=?, 
		[First Name]=?, 
		[Last Name]=?, 
		[Auto Expire]=?,
		VIP=?,
		Message=?, 
		Code=?,
		Rate=?,
		CardSubtype=?,
		dtModified=?, 
		strModifiedByUser=?
						 WHERE [Account Number] =? 
							AND [Card Number] =?", array(
													$Cards["intMediaType"],
													$Cards["intFacility"],
													$Cards["UsageCard"],
													$Cards["ToDate"],
													$Cards["FirstName"],
													$Cards["LastName"],
													$Cards["AutoExpire"],
													$Cards["VIP"],
													$Cards["Message"],
													$Cards["Code"],
													$Cards["Rate"],
													$Cards["CardSubtype"],
													$Cards["dtModified"],
													$Cards["strModifiedByUser"],
													$CardsCondiciones["AccountNumber"],
													$CardsCondiciones["CardNumber"]
													));
		
		//actualizo en la tabla lsmCard
		$this->db->query("UPDATE  lsmCard SET
						intMediaType =?, 
						intUsageType =?,
						intValid=?,
						intRawStatus =?,
						intFacility =?,
						intTimeZone =?,
						intAccessLevel =?,
						dtModified =?,
						dtValidToDate =?,
						intActiveAccessLevel =?,
						intSetupTimeZone =?,
						bitFacilitySynced =?
					WHERE strCardNumber =?", array(
											$lsmCard["intMediaType"],
											$lsmCard["intUsageType"],
											$lsmCard["intValid"],
											$lsmCard["intRawStatus"],
											$lsmCard["intFacility"],
											$lsmCard["intTimeZone"],
											$lsmCard["intAccessLevel"],
											$lsmCard["dtModified"],
											$lsmCard["dtValidToDate"],
											$lsmCard["intActiveAccessLevel"],
											$lsmCard["intSetupTimeZone"],
											$lsmCard["bitFacilitySynced"],
											$CardsCondiciones["CardNumber"]));
						
		//inserto en la bitacora
		$this->db->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Cards'".", 'UPDATE', '".$this->session->userdata("usuario")."', '".'Se MODIFICO la tarjeta No. '.$CardsCondiciones['CardNumber'].' para la cuenta No. '.$CardsCondiciones['AccountNumber'].' en la tabla Cards'."'
						 + char(10) + '".' Se MODIFICO un registro en la tabla lsmCard para la tarjeta en cuestion'."')");
		//primer if son recargables P el campo ZIP=ES_COMUNITARIA de la tabla Accounts no tiene nada y se ha colocado en el textbox ES_COMUNITARIA del frm VistaAgregarTarjeta
		if($ES_COMUNITARIA == ''){
			//actualizo todas las sucursales el lsmCard
			foreach($las_sucursales as $la_sucursal){
				$la_db = $la_sucursal->sucursal_nombre_db.".dbo";
				//actualizo en la tabla lsmCard
				$this->db->query("UPDATE  $la_db.lsmCard SET
								intMediaType =?, 
								intUsageType =?,
								intValid=?,
								intRawStatus =?,
								intFacility =?,
								intTimeZone =?,
								intAccessLevel =?,
								dtModified =?,
								dtValidToDate =?,
								intActiveAccessLevel =?,
								intSetupTimeZone =?,
								bitFacilitySynced =?
							WHERE strCardNumber =?", array(
													$lsmCard["intMediaType"],
													$lsmCard["intUsageType"],
													$lsmCard["intValid"],
													$lsmCard["intRawStatus"],
													$lsmCard["intFacility"],
													$lsmCard["intTimeZone"],
													$lsmCard["intAccessLevel"],
													$lsmCard["dtModified"],
													$lsmCard["dtValidToDate"],
													$lsmCard["intActiveAccessLevel"],
													$lsmCard["intSetupTimeZone"],
													$lsmCard["bitFacilitySynced"],
													$CardsCondiciones["CardNumber"]));
			}
		}
		//segundo if para tarjetes EXCLUSIVAS el campo ZIP=ES_COMUNITARIA de la tabla Accounts no tiene el nombre de la db y se ha colocado en el textbox ES_COMUNITARIA del frm VistaAgregarTarjeta
		if($ES_COMUNITARIA != "" && $ES_COMUNITARIA != "CU"){
			foreach($las_sucursales as $valor){
				$la_db = $valor->sucursal_nombre_db.".dbo";
				//si el nombre de la db de las sucursales recorridas es distinta al nombre de la db verficada del campo ZIP=ES_COMUNITARIA, significa que a esas se seterara el intValid a 0, ya que en el array original $lsmCard el intValid viene a 1
				if($ES_COMUNITARIA != $valor->sucursal_nombre_db){
					$lsmCard["intValid"] = 0;
				}
				else{
					$lsmCard["intValid"] = 1;
				}
				//actualizo en la tabla lsmCard
				$this->db->query("UPDATE  $la_db.lsmCard SET
								intMediaType =?, 
								intUsageType =?,
								intValid=?,
								intRawStatus =?,
								intFacility =?,
								intTimeZone =?,
								intAccessLevel =?,
								dtModified =?,
								dtValidToDate =?,
								intActiveAccessLevel =?,
								intSetupTimeZone =?,
								bitFacilitySynced =?
							WHERE strCardNumber =?", array(
													$lsmCard["intMediaType"],
													$lsmCard["intUsageType"],
													$lsmCard["intValid"],
													$lsmCard["intRawStatus"],
													$lsmCard["intFacility"],
													$lsmCard["intTimeZone"],
													$lsmCard["intAccessLevel"],
													$lsmCard["dtModified"],
													$lsmCard["dtValidToDate"],
													$lsmCard["intActiveAccessLevel"],
													$lsmCard["intSetupTimeZone"],
													$lsmCard["bitFacilitySynced"],
													$CardsCondiciones["CardNumber"]));
			}
		}
		/*validacion para las cuentas comunitarias donde el valor del campo ZIP=ES_COMUNITARIA es CU CUENTA UNIVERSAL*/
		if($ES_COMUNITARIA == "CU"){
			$lsmCard["intValid"] = 0;
			//actulizao todas las tarjetas al intValid a 0 para todas las sucuarlas y luego las actulizo a 1 de acuerdo a las sucursales seleccionadas en el frm VistaRegistroTarjeta
			foreach($las_sucursales as $valor){
				$la_db = $valor->sucursal_nombre_db.".dbo";
				//actualizo en la tabla lsmCard
				$this->db->query("UPDATE  $la_db.lsmCard SET
								intMediaType =?, 
								intUsageType =?,
								intValid=?,
								intRawStatus =?,
								intFacility =?,
								intTimeZone =?,
								intAccessLevel =?,
								dtModified =?,
								dtValidToDate =?,
								intActiveAccessLevel =?,
								intSetupTimeZone =?,
								bitFacilitySynced =?
							WHERE strCardNumber =?", array(
													$lsmCard["intMediaType"],
													$lsmCard["intUsageType"],
													$lsmCard["intValid"],
													$lsmCard["intRawStatus"],
													$lsmCard["intFacility"],
													$lsmCard["intTimeZone"],
													$lsmCard["intAccessLevel"],
													$lsmCard["dtModified"],
													$lsmCard["dtValidToDate"],
													$lsmCard["intActiveAccessLevel"],
													$lsmCard["intSetupTimeZone"],
													$lsmCard["bitFacilitySynced"],
													$CardsCondiciones["CardNumber"]));
			}
			//una vez actualizo el intValid a 0 en todas las sucursales, actualizo a 1 las 	seleccionadas en el frm las que estaran activas intValid = 1 
			foreach($id_sucursal as $id_de_sucursal){
					$sucursales_comunes	= $this->Traer_Sucrusal_Por_ID($id_de_sucursal);
					$la_db = $sucursales_comunes->sucursal_nombre_db.".dbo";
					$lsmCardValid = array(
						"intValid"=>1,
						"strCardNumber"=>$CardsCondiciones["CardNumber"],
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
	public function Deshabilitar_Tarjeta_En_Todas_Las_Sucursales($lsmCard){
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->db->trans_start();
		
		//para Datapark
		$this->db->query("UPDATE lsmCard SET intValid = ? WHERE strCardNumber =? AND intMediaType =? AND intFacility =?", 
					array($lsmCard["intValid"],
						$lsmCard["CardNumber"],
						$lsmCard["intMediaType"],
						$lsmCard["intFacility"]
					)
					
					);
		
		//desactivo las tarjetas en todas las sucursales poniendoles 0 al intValid
		foreach($lsmCard["las_sucursales"] as $la_sucursal){
					$la_db = $la_sucursal->sucursal_nombre_db.".dbo";
					
					$this->db->query("UPDATE $la_db.lsmCard SET intValid = ? WHERE strCardNumber =? AND intMediaType =? AND intFacility =?", 
					array($lsmCard["intValid"],
						$lsmCard["CardNumber"],
						$lsmCard["intMediaType"],
						$lsmCard["intFacility"]
					)
					
					);
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