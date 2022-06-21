<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Cuentasbuscar extends CI_Model{ 
	public function ListarCuentasTodas(){
		$resultado = $this->db->query("SELECT ISNULL(car.[Card Number], 'NO ASIGNADA') as Tarjeta, ac.[Account Number] as AccountNumber,ac.[Account Name] as AccountName,
				ac.[First Name] as FirstName, ac.[Last Name] as LastName, ac.[AccountBalance],
				 car.[Card Number] AS CardNumber, car.[First Name] + ' '+ car.[Last Name] AS CARD_NOMBRE
			FROM Accounts ac
			LEFT JOIN Cards car ON(ac.[Account Number]= car.[Account Number])
			ORDER BY car.[Card Number] DESC");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function VerificarSiExisteTarjeta($Cards/*$AccountNumber, $CardNumber, $intMediaType, $intFacility*/){
		/*  NOTA: se comenta proque el formulario ha cambiado
		$resultado = $this->db->query("SELECT (SELECT COUNT([Account Number])  FROM Accounts WHERE [Account Number]='$AccountNumber') AS RESULTADO_CUENTA,		
		(SELECT COUNT([Card Number]) FROM Cards WHERE [Card Number] ='$CardNumber' AND intMediaType =$intMediaType AND intFacility ='$intFacility') AS RESULTADO_TARJETA");
		return $resultado->row();
		*/   
		$resultado = $this->db->query("SELECT COUNT([Card Number]) AS CUENTA FROM Cards 
		WHERE [Card Number] =?", $Cards);
		$fila = $resultado->row();
		return $fila->CUENTA;	
	}
	//SIN USO
	public function TaerDatosCuentaSeleccionada($Accounts){
		$resultado = $this->db->query("SELECT ac.ID, ac.[Account Number] AccountNumber, ac.[Account Name] AccountName, ac.[First Name] FirstName, ac.[Last Name] LastName,
		ac.Phone, ac.Fax, ac.Email,
		car.[Card Number] CardNumber, car.intMediaType, car.intFacility,
		CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 3 THEN 'PR'
			WHEN car.intMediaType = 4 AND car.UsageCard = 0 THEN 'PM'
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN 'PC'
			WHEN car.intMediaType = 2 AND car.UsageCard = 3 THEN 'MR'
		END AS tipo_tarjeta,
		CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 3 THEN 'PR-Proximidad Recargable'
			WHEN car.intMediaType = 4 AND car.UsageCard = 0 THEN 'PM-Proximidad Mensual'
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN 'PC-Proximidad Contrato'
			WHEN car.intMediaType = 2 AND car.UsageCard = 3 THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'
		END AS NOMBRE_TIPO_TARJETA,
		CASE 
			WHEN car.intMediaType = 4 AND car.UsageCard = 6 THEN car.[To Date]
			ELSE NULL
		END AS ToDate
		FROM Accounts ac
			INNER JOIN Cards car ON(car.[Account Number] = ac.[Account Number])
		WHERE ac.ID = ? AND ac.[Account Number] = CONVERT(VARCHAR, ?) ", $Accounts);
		return $resultado->row();
			
	}
	public function ChequearExistenciaCuenta($AccountNumber){
		$resultado = $this->db->query("SELECT COUNT([Account Number]) as CUENTA
		 FROM Accounts WHERE [Account Number] = ?", array($AccountNumber));
		$fila = $resultado->row(); 
		return $fila->CUENTA;
	}
	//NOTA: esta funcion se ocupa en dos funciones de controladores Cuentas:BusquedaInteractivaCuentas y Cuentas:BusquedaInteractivaCuentasEditar
	public function BusquedaInteractivaCuentas($buscar_cuenta){
		$resultado = $this->db->query("SELECT top 100 [Account Number] AccountNumbe,  [Account Name] AccountName, Multiple/*,
CASE 
			WHEN SUBSTRING([Account Number],1,2) = 'PR' THEN 'PR'
			WHEN SUBSTRING([Account Number],1,2) = 'PM' THEN 'PM'
			WHEN SUBSTRING([Account Number],1,2) = 'PC' THEN 'PC'
			WHEN SUBSTRING([Account Number],1,2) = 'MR' THEN 'MR'
			ELSE 'NO'
		END TIPO_TARJETA,
CASE 
			WHEN SUBSTRING([Account Number],1,2) = 'PR' THEN 'PR-Proximidad Recargable'
			WHEN SUBSTRING([Account Number],1,2) = 'PM' THEN 'PM-Proximidad Mensual'
			WHEN SUBSTRING([Account Number],1,2) = 'PC' THEN 'PC-Proximidad Contrato'
			WHEN SUBSTRING([Account Number],1,2) = 'MR' THEN 'MR-Magn&eacute;tica Recargable (tickete recargable)'
			ELSE 'NO'
		END AS NOMBRE_TIPO_TARJETA	*/	
FROM Accounts 
WHERE [Account Number] LIKE ? OR [Account Name] LIKE ?", array('%'.$buscar_cuenta.'%', '%'.$buscar_cuenta.'%'));
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	//NOTA esta funcion se utiliza en dos funciones en los controladores: Cuentas:TraerDatosDeCuentaEditar, Tarjetas:TraerDatosDeTarjetaParaEditar,Tarjetas:RegistrarTarjeta, Tarjetas:RecargarTarjeta
	public function TraerDatosDeCuentaEditar($AccountNumber){
		$resultado = $this->db->query("SELECT TOP 1 ac.ID, ac.[Account Number] AccountNumber, ac.[Account Name] AccountName, ac.[First Name] FirstName, ac.[Last Name] LastName,
		ac.Phone, ac.Fax, ac.Email, ac.ZIP AS ES_COMUNITARIA
		FROM Accounts ac
		where ac.[Account Number] = ?", $AccountNumber);
		return $resultado->row();
			
	}
}