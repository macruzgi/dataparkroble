<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Reportesbuscar extends CI_Model{ 
	public function GenerarReporteCuentas(){
		$resultado = $this->db->query("SELECT ISNULL(car.[Card Number], 'NO ASIGNADA') as Tarjeta, ac.[Account Number] as AccountNumber,ac.[Account Name] as AccountName,
				ac.[First Name] as FirstName, ac.[Last Name] as LastName, ac.[AccountBalance] 
			FROM Accounts ac
			LEFT JOIN Cards car ON(ac.[Account Number]= car.[Account Number]) order by ac.ID DESC");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function TraerRecargasPorFecha($Payments){
		$resultado = $this->db->query("SELECT pay.RecNo, pay.[Account Number] AccountNumber, pay.[Payment Date] AS PaymentDate, 
  CONVERT(nvarchar(100),ABS(pay.Amount)) Amount, pay.Notes AS NO_FACTURA_TRANSACCION,
  pay.Payer AS USUARIO,
  a.[Account Name] AS NOMBRE_CUENTA,
  car.[Card Number] AS CardNumber, car.[First Name] + ' '+ car.[Last Name] AS CARD_NOMBRE
  FROM Payments pay
	INNER JOIN Accounts a ON(a.[Account Number] = pay.[Account Number])
	INNER JOIN Cards car ON(car.[Card Number] = pay.[Card Number] AND car.[Account Number]= pay.[Account Number])
	WHERE	CONVERT(VARCHAR, pay.[Payment Date], 23) >= ? 
	AND CONVERT(VARCHAR,pay.[Payment Date], 23) <= ?
	ORDER BY pay.[Due Date] DESC", $Payments);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	//NOTA: se dejo de usar
	public function GenerarReporteRecargasPorFecha($Payments){
		$resultado = $this->db->query("SELECT pay.RecNo, pay.[Account Number] AccountNumber, pay.[Payment Date] AS PaymentDate, 
  CONVERT(nvarchar(100),ABS(pay.Amount)) Amount, pay.Notes AS NO_FACTURA_TRANSACCION,
  pay.Payer AS USUARIO,
 a.[Account Name] AS NOMBRE_CUENTA
  FROM Payments pay
	INNER JOIN Accounts a ON(a.[Account Number] = pay.[Account Number])
	WHERE	CONVERT(VARCHAR, pay.[Payment Date], 23) >= ? 
	AND CONVERT(VARCHAR,pay.[Payment Date], 23) <= ?
	ORDER BY pay.[Due Date] DESC", $Payments);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	public function TraerCargosPorFecha($Invoices){
		$resultado = $this->db->query("SELECT inv.RowNo, inv.[Account Number] AccountNumber, inv.InvDate, 
  CONVERT(nvarchar(100),ABS(inv.Amount)) Amount, inv.CardNumber,
  a.[Account Name] AS NOMBRE_CUENTA,
	ISNULL(car.[First Name] + ' '+ car.[Last Name], '') AS CARD_NOMBRE
  FROM Invoices inv
	INNER JOIN Accounts a ON(a.[Account Number] = inv.[Account Number])
	INNER JOIN Cards car ON(car.[Card Number] = inv.CardNumber)
	WHERE	CONVERT(VARCHAR, inv.InvDate, 23) >= ? 
	AND CONVERT(VARCHAR,inv.InvDate, 23) <= ?
	ORDER BY inv.InvDate DESC", $Invoices);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
	//NOTA: se dejo de usar
	public function GenerarReporteCargosPorFecha($Invoices){
		$resultado = $this->db->query("SELECT inv.RowNo, inv.[Account Number] AccountNumber, inv.InvDate, 
  CONVERT(nvarchar(100),ABS(inv.Amount)) Amount, inv.CardNumber,
  a.[Account Name] AS NOMBRE_CUENTA
  FROM Invoices inv
	INNER JOIN Accounts a ON(a.[Account Number] = inv.[Account Number])
	WHERE	CONVERT(VARCHAR, inv.InvDate, 23) >= ? 
	AND CONVERT(VARCHAR,inv.InvDate, 23) <= ?
	ORDER BY inv.InvDate DESC", $Invoices);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			
	}
}