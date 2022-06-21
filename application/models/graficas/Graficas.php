<?php

/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Graficas extends CI_Model{ 
	public function TraerDatosParaGraficas($fecha_hoy){
		$resultado = $this->db->query("SELECT 
(SELECT ISNULL(SUM(Amount), 0)  
	FROM Payments WHERE YEAR([Payment Date]) = YEAR(GETDATE()) 
						AND MONTH([Payment Date]) = MONTH(GETDATE()) 
						AND DAY([Payment Date]) = DAY(GETDATE())
) AS TOTAL_VENTAS_GRAL,
(SELECT ISNULL(SUM(Amount), 0)  
	FROM Invoices WHERE YEAR(InvDate) = YEAR(GETDATE()) 
						AND MONTH(InvDate) = MONTH(GETDATE())  
						AND DAY(InvDate) = DAY(GETDATE())
) AS TOTAL_COBROS_GRAL");
		return $resultado->row();
	}
	public function TraerDatosParaGraficasLineaRecargas($fecha_hoy){
		
		$resultado = $this->db->query("EXECUTE DB_CONFIGURACIONES.dbo.pa_TraerRecargas");
		return $resultado->row();
		/*$resultado = $this->db->query("
 SELECT '1' AS SERVIDOR,
 CASE DATENAME(weekday,pay.[Payment Date])
	WHEN 'Sunday' THEN  'DOMINGO'
	WHEN 'Monday' THEN	'LUNES'
	WHEN 'Tuesday' THEN	'MARTES'
	WHEN 'Wednesday' THEN 'MIERCOLES'
	WHEN 'Thursday' THEN 'JUEVES'
	WHEN 'Friday' THEN	'VIERNES'
	WHEN 'Saturday' THEN	'SABADO'
 END AS NOMBRE_DIA, DAY(pay.[Payment Date]) AS DIA,  MONTH(pay.[Payment Date]) AS MES,
SUM(ABS(pay.Amount)) AS TOTAL_VENTA_DIA
FROM Payments pay
WHERE CONVERT(varchar, pay.[Payment Date], 23) >=  DATEADD(DAY, -7, convert(varchar, '$fecha_hoy', 23)) 
GROUP BY DAY(pay.[Payment Date]), DATENAME(weekday,pay.[Payment Date]), MONTH(pay.[Payment Date])
ORDER BY MES,DIA");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
		*/	 
	}
	public function TraerDatosParaGraficasLineaCargos($fecha_hoy){
		$resultado = $this->db->query("EXECUTE DB_CONFIGURACIONES.dbo.pa_TraerCargos");
		return $resultado->row();
		/*$resultado = $this->db->query("
 SELECT '1' AS SERVIDOR,
 CASE DATENAME(weekday,invo.InvDate)
	WHEN 'Sunday' THEN  'DOMINGO'
	WHEN 'Monday' THEN	'LUNES'
	WHEN 'Tuesday' THEN	'MARTES'
	WHEN 'Wednesday' THEN 'MIERCOLES'
	WHEN 'Thursday' THEN 'JUEVES'
	WHEN 'Friday' THEN	'VIERNES'
	WHEN 'Saturday' THEN	'SABADO'
 END AS NOMBRE_DIA, DAY(invo.InvDate) AS DIA, MONTH(invo.InvDate) AS MES,
SUM(ABS(invo.Amount)) AS TOTAL_CARGOS_DIA
FROM Invoices invo
WHERE CONVERT(varchar, invo.InvDate, 23) >=  DATEADD(DAY, -7, convert(varchar, '$fecha_hoy', 23))
GROUP BY DAY(invo.InvDate), DATENAME(weekday,invo.InvDate), MONTH(invo.InvDate)
ORDER BY MES,DIA");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
			*/
	}
}