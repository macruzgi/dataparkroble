<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Tarjetasbuscar extends CI_Model{ 
//NOTA: esta funcion se utiliza en dos funciones en el controlador Tarjetas VistaRecargarTarjeta y VistaAjustarRecarga
	public function BusquedaInteractivaTarjetas($buscar_tarjeta){
		$buscar_tarjeta = utf8_decode($buscar_tarjeta);
		$resultado = $this->db->query("SELECT TOP 100 car.[Card Number] as Tarjeta, car.intMediaType, car.intFacility,
			car.[First Name] AS CARD_FirstName, car.[Last Name] AS CARD_LastName,
		ac.[Account Number] as AccountNumber,ac.[Account Name] as AccountName,
				ac.[First Name] as FirstName, ac.[Last Name] as LastName, abs(ac.[AccountBalance]) as AccountBalance,
				concar.strName,
				cmct.strDescription				
			FROM Accounts ac
			INNER JOIN Cards car ON(ac.[Account Number]= car.[Account Number])
			INNER JOIN cfgCardsMediaDesc concar ON(car.intMediaType = concar.intMediaType)
			INNER JOIN cmMapCardType  cmct ON(car.UsageCard = cmct.intCardType)
				WHERE car.[Card Number] like '%$buscar_tarjeta%' 
				or ac.[Account Number] like '%$buscar_tarjeta%' 
				or ac.[Account Name] like '%$buscar_tarjeta%'
				or car.[First Name] like '%$buscar_tarjeta%'
				or car.[Last Name] like '%$buscar_tarjeta%'");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function BuscarMovimientosTarjeta($payments){
		$resultado = $this->db->query('SELECT TOP 5 pay.[Payment Date] as PaymentDate, CONVERT(nvarchar(100),ABS(pay.[Amount])) Amount, pay.[Payment Method] as PaymentMethod, pay.[Payer], pay.[Notes] as FACTURA,
		car.[Card Number] as TARJETA,
		ac.[Account Number] as AccountNumber,ac.[Account Name] as AccountName,
		ac.[First Name] as FirstName, ac.[Last Name] as LastName, abs(ac.[AccountBalance]) as AccountBalance
	FROM Payments pay 
		INNER JOIN Cards car ON(car.[Card Number] = pay.[Card Number] AND car.intMediaType = pay.intMediaType AND car.intFacility = pay.intFacility)
		INNER JOIN  Accounts ac ON(ac.[Account Number] = car.[Account Number])
				WHERE pay.[Card Number] = '."'".$payments['CardNumber']."'".'
					AND pay.intMediaType = '.$payments['intMediaType'].'
					AND pay.intFacility  = '.$payments['intFacility']
				.' ORDER BY PaymentDate desc');
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function TraerDatosTarjeta($usuario, $clave){
		$resultado = $this->db->query("select usuario, nombre_usuario, estado_usuario
		 from DB_CONFIGURACIONES.dbo.adm_Usuario where usuario = '$usuario' and clave_usuario = HASHBYTES('MD5', '$clave')");
		return $resultado->row();
	}
	public function TraerIntFacility(){
		$resultado = $this->db->query("SELECT 'NADA' AS MENSAJE, (SELECT intFacility FROM DB_CONFIGURACIONES.dbo.adm_Tarjetas where estado_facility = 1) as intFacility");
		$fila = $resultado->row();
		return $fila->intFacility;
	}
	//NOTA: esta funcion se utiliza en dos funciones del controlador Tarjetas en BuscarTransaccion y RevertirRecarga
	public function BuscarTransaccion($Payments){
		$resultado = $this->db->query("SELECT RecNo,  Notes, [Account Number] AS AccountNumber, [Card Number] AS CardNumber, Amount, [Payment Date] as FECHA, Payer, intMediaType ,intFacility   
		FROM Payments
		WHERE Notes = ? 
		AND convert(varchar, [Payment Date], 23) = convert(varchar, GETDATE(), 23) /*23 fromato de fecha en yyyy-mm-dd*/", $Payments);
		return $resultado->row();
	}
	//NOTA: esta funcion se utiliza en dos funciones del controlador Tarjetas en RevertirRecarga y AjustarRecarga
	public function TraerBalanceAcutal($account_number){
		$resultado = $this->db->query("SELECT AccountBalance FROM Accounts WHERE [Account Number] = '$account_number'");
		$fila = $resultado->row();
		return $fila->AccountBalance;
	}
	public function BuscarUltimaRecarga($Payments){
		$resultado = $this->db->query("SELECT TOP 1 RecNo
			  ,[Account Number]	AccountNumber
			  ,[Card Number]	CardNumber
			  ,[Payment Date]	PaymentDate
			  ,Amount
			  ,Payer
			  ,Notes
			  ,intMediaType
			  ,intFacility
			FROM Payments WHERE [Card Number] = ? AND [Account Number] =?  AND intMediaType = ? AND intFacility = ?
				AND convert(varchar, [Payment Date], 23) = convert(varchar, GETDATE(), 23) /*23 fromato de fecha en yyyy-mm-dd*/
				ORDER BY RecNo DESC", $Payments);
		return $resultado->row();
	}
	public function ChequearExisteFacturaTrasaccion($factura){
		$resultado = $this->db->query("SELECT COUNT(RecNo) AS CUENTA FROM Payments WHERE Notes = ?", $factura);
		$fila = $resultado->row();
		return $fila->CUENTA;
	}
	public function TaerListadoFacilityCode(){
		$resultado = $this->db->query("SELECT id_tarjeta, intFacility, 
			  CASE estado_facility
				WHEN 1 THEN 'ACTIVO'
				ELSE 'INACTIVO'
			 END AS estado_facility, fecha
			 FROM DB_CONFIGURACIONES.dbo.adm_Tarjetas
			 ORDER BY id_tarjeta DESC");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function ChequearExistenciaFacilityCode($intFacility){
		$resultado = $this->db->query("SELECT COUNT(intFacility) AS CUENTA FROM DB_CONFIGURACIONES.dbo.adm_Tarjetas WHERE intFacility = ?", $intFacility);
		$fila = $resultado->row();
		return $fila->CUENTA;
	}
	public function TaerFacilityCodeActivos(){
		$resultado = $this->db->query("SELECT id_tarjeta, intFacility 
			 FROM DB_CONFIGURACIONES.dbo.adm_Tarjetas
				WHERE estado_facility = 1");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function TraerTimesZones(){
		$resultado = $this->db->query("SELECT intTimeZoneID FROM cfgTimeZonesDescriptions");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;	
	}
	public function TraerTarjetasDeCuenta($Cards){
		$resultado = $this->db->query("SELECT c.[Card Number] CardNumber, c.intMediaType, c.intFacility, c.[From Date] FromDate, c.[To Date] ToDate,
c.[First Name] + ' ' + c.[Last Name] CARD_NOMBRE,
CASE c.[Auto Expire]
	WHEN 1 THEN 'SI' ELSE 'NO'
END AS AUTOEXPIRA,
c.dtCreated, a.ZIP as ES_COMUNITARIA/*,
CASE */
			/*WHEN intMediaType = 4 AND UsageCard = 3 THEN 'PR-Proximidad Recargable'
			WHEN intMediaType = 4 AND UsageCard = 0 THEN 'PM-Proximidad Mensual'
			WHEN intMediaType = 4 AND UsageCard = 6 THEN 'PC-Proximidad Contrato'
			WHEN intMediaType = 2 AND UsageCard = 3 THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'*//*
			WHEN SUBSTRING([Account Number],1,2) = 'PR' THEN 'PR-Proximidad Recargable'
			WHEN SUBSTRING([Account Number],1,2) = 'PM' THEN 'PM-Proximidad Mensual'
			WHEN SUBSTRING([Account Number],1,2) = 'PC' THEN 'PC-Proximidad Contrato'
			WHEN SUBSTRING([Account Number],1,2) = 'MR' THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'
			ELSE 'NO'
		END AS NOMBRE_TIPO_TARJETA*/
FROM Cards c
INNER JOIN Accounts a 
	ON(a.[Account Number] = c.[Account Number]) 
	WHERE c.[Account Number] = ?
	ORDER BY c.ID DESC", $Cards);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;	
	}
	public function TraerDatosDeTarjetaParaEditar($Cards){
		$resultado = $this->db->query("SELECT TOP 1 car.[Card Number] CardNumber, car.intMediaType, car.intFacility, 
car.[From Date] FromDate, car.[To Date] ToDate,
car.[First Name] FirstName, car.[Last Name] LastName,
car.[Auto Expire] AutoExpire,
car.Message DUI,
/*CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 3 THEN 'PR'
			WHEN car.intMediaType = 4 AND car.UsageCard = 0 THEN 'PM'
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN 'PC'
			WHEN car.intMediaType = 2 AND car.UsageCard = 3 THEN 'MR'
		END AS TIPO_TARJETA,
		*/
SUBSTRING(car.[Account Number],1,2) TIPO_TARJETA,
CASE 
			WHEN SUBSTRING(car.[Account Number],1,2) = 'PR' THEN 'PR-Proximidad Recargable'
			WHEN SUBSTRING(car.[Account Number],1,2) = 'PM' THEN 'PM-Proximidad Mensual'
			WHEN SUBSTRING(car.[Account Number],1,2) = 'PC' THEN 'PC-Proximidad Contrato'
			WHEN SUBSTRING(car.[Account Number],1,2) = 'MR' THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'
			ELSE 'NO'
		END AS NOMBRE_TIPO_TARJETA,
/*
CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 3 THEN 'PR-Proximidad Recargable'
			WHEN car.intMediaType = 4 AND car.UsageCard = 0 THEN 'PM-Proximidad Mensual'
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN 'PC-Proximidad Contrato'
			WHEN car.intMediaType = 2 AND car.UsageCard = 3 THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'
		END AS NOMBRE_TIPO_TARJETA,
CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN [To Date]
			ELSE NULL
		END AS ToDate,*/
car.UsageCard,
car.CardSubtype,
car.Rate,
car.VIP,
ls.intTimeZone,
ls.intAccessLevel
FROM Cards car
INNER JOIN lsmCard ls ON(ls.strCardNumber = car.[Card Number])
	WHERE car.[Account Number] =? 
	AND car.[Card Number] =? 
	AND car.intMediaType =? 
	AND car.intFacility = ?", $Cards);
		return $resultado->row();
	}
	//SIN USO
	public function DatosDeLaTarjetaParaValidar($CardsDatos){   
		$resultado = $this->db->query("SELECT [Card Number] CardNumber, intMediaType, intFacility FROM Cards 
		WHERE [Card Number] =?
		AND   [Account Number] =? 
		AND intMediaType =?
		AND intFacility =?", $CardsDatos);
		return $resultado->row();	
	}
	public function Traer_lsmCard_Independiente($lsmCard_filtro){
		$db 		= $lsmCard_filtro["sucursal_nombre_db"];
		$resultado  = $this->db->query("SELECT strCardNumber, intMediaType, intFacility,
dtValidFromDate, dtValidToDate, intValid,
CASE 
 WHEN intValid = 1 THEN 'checked'
 ELSE '' 
 END as ESTADO_VALID,
'$db' AS DB
FROM $db.dbo.lsmCard  WHERE
 strCardNumber =?
	AND intMediaType =?
	AND intFacility = ?", 
	array($lsmCard_filtro["strCardNumber"], 
			$lsmCard_filtro["intMediaType"],
			$lsmCard_filtro["intFacility"]
		)
	);
		return $resultado->row();
	}
	//se usa en varias funciones Tarjetas:Desactivar_Tarjeta, Tarjetas:RecargarTarjeta, 
	public function Verificar_intValid_lsmCard($lsmCard){
		$db 		= $lsmCard["sucursal_nombre_db"];
		$resultado  = $this->db->query("SELECT strCardNumber, intMediaType, intFacility, intValid
FROM $db.dbo.lsmCard  WHERE
 strCardNumber =?
	AND intMediaType =?
	AND intFacility = ?", 
	array($lsmCard["CardNumber"], 
			$lsmCard["intMediaType"],
			$lsmCard["intFacility"]
		)
	);
		return $resultado->row()->intValid;
	}
	public function Traer_lsmCard_Validas_Comunitarias($lsmCard_filtro){
		$db 		= $lsmCard_filtro["sucursal_nombre_db"];
		$resultado  = $this->db->query("SELECT COUNT(*) AS CONTEO
FROM $db.dbo.lsmCard  WHERE
 strCardNumber =?
	AND intMediaType =?
	AND intFacility = ?
	AND intValid =1", 
	array($lsmCard_filtro["strCardNumber"], 
			$lsmCard_filtro["intMediaType"],
			$lsmCard_filtro["intFacility"]
		)
	);
		return $resultado->row()->CONTEO;
	}
}