<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reportes extends CI_Controller {

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
		$this->load->model("reportes/Reportesbuscar");
	}
	public function VerSiUsuarioTieneAccesoAlaOpcion($id_modulo_opcion){
		//esta funcion verifica si el usuario tiene permsios para acceder a la accion recibe como paramentro el id_modulo_opcion si el usuario no tiene permissos le redirige a una vista con un msj que no tiene acceso a tal proceso
			if (in_array("$id_modulo_opcion", $this->session->userdata('ids_modulo_opciones'))) {
				
			}else{
				redirect(base_url()."datapark/ErrorDeAcceso");
				exit;
			}
	}
	public function GenerarReporteCuentas()
	{
				set_time_limit(0);
				$GenerarReporteCuentas = $this->Reportesbuscar->GenerarReporteCuentas();
				
			
				$this->load->library('Pdf');
				$pdf = new PdfGenerales('L', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Listado de Cuentas";
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage('L','Letter');
				
				  
$encabezados = "";

$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0">
<tr>
<td width="70" style="text-align:center;"><b>Tarjeta</b></td>
<td width="10%" style="text-align:center;"><b>Account Number</b></td>
<td width="10%" style="text-align:center;"><b>Account Name</b></td>
<td width="60%" style="text-align:center;"><b>Name</b></td>
<td width="10%" style="text-align:center;"><b>Account Balance</b></td>
</tr>
EOD;
		
		foreach($GenerarReporteCuentas as $cuentasEncontradas):

$AccountBalance = number_format(abs($cuentasEncontradas->AccountBalance), 2);
				
$tbl .=<<<EOD
<tr>
<td>$cuentasEncontradas->Tarjeta</td>
<td>$cuentasEncontradas->AccountNumber</td>
<td>$cuentasEncontradas->AccountName</td>
<td>$cuentasEncontradas->LastName $cuentasEncontradas->FirstName</td>
<td style="text-align:right;">$AccountBalance</td>
</tr>
EOD;
			
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			$pdf->writeHTML($encabezados, true, false, true, false, '');
			$pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);

	}
	public function GenerarReporteCuentasExcel(){
		set_time_limit(0);
		$GenerarReporteCuentasExcel = $this->Reportesbuscar->GenerarReporteCuentas();
		
		//cargo la liberia
		$this->load->library('Phpexcel');
		$objPHPExcel = new ReporteExcelGral();
		$objPHPExcel->activeErrorReporting();
		$objPHPExcel->noCli();
		// Setetenado las propiedades del documento
		$objPHPExcel->getProperties()->setCreator("TAS de El Salvador")
					   ->setLastModifiedBy("TAS de El Salvador")
					   /*->setTitle("Office 2007 XLSX Test Document")
					   ->setSubject("Office 2007 XLSX Test Document")*/
					   ->setDescription("Listado de Cuentas")
					   /*->setKeywords("office 2007 openxml php")
					   ->setCategory("Test result file")*/;

		$objPHPExcel->getDefaultStyle()->getFont()->setName('Arial')
												  ->setSize(10);            
		//titulos a partir de la fila 4 en excel
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('A4', 'Tarjeta')
					->setCellValue('B4', 'Account Number')
					->setCellValue('C4', 'Account Name')
					->setCellValue('D4', 'Name')
					->setCellValue('E4', 'Account Balance');
		//combino las celdas de los titulos headers
		$objPHPExcel->setActiveSheetIndex(0)
					->mergeCells('A1:E1')
					->mergeCells('A2:E2')
					->mergeCells('A3:E3');
		//seteo los valores a las celdas combinadas 
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue("A1", 'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA')
					->setCellValue("A2", 'CEPA, EL SALVADOR')
					->setCellValue("A3", 'Listado de cuentas');
		/*
		$estilo = array( 
		  'borders' => array(
			'outline' => array(
			  'style' => PHPExcel_Style_Border::BORDER_THIN
			)
		  )
		);
		 $objPHPExcel->getActiveSheet()->getStyle('A1:D1')->applyFromArray($estilo);
		 */
		 $bordeCeldas = array(
			  'borders' => array(
				  'allborders' => array(
					  'style' => PHPExcel_Style_Border::BORDER_THIN
				  )
			  )
		  );
		//$objPHPExcel->getActiveSheet()->getStyle('A1:D3')->applyFromArray($styleArray);
		 //centrar el texto de los encabezados
		 $colorFondo_cell = array(
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'color' => array('rgb' => 'BFBABA')
				)
			); 
		$orientacionTexto = array(
		   'alignment' => array(
			   'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			   'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
				) 
			); 
		//aplico los formatos a las celdas la orientacion del texto, negrita y color de fondo respectivamente
		$objPHPExcel->getActiveSheet()->getStyle('A1:E3')->applyFromArray($orientacionTexto);
		$objPHPExcel->getActiveSheet()->getStyle("A1:E4")->getFont()->setBold(true);
		$objPHPExcel->getActiveSheet()->getStyle("A4:E4")->applyFromArray($colorFondo_cell);

		//la iteracon comenzara desde 5 las 4 filas restantes del excel son para los headers
		$inicioFilas = 5;
		foreach($GenerarReporteCuentasExcel as $cuentasEncontradas):
		
				$objPHPExcel->setActiveSheetIndex(0)
							->setCellValue("A$inicioFilas", $cuentasEncontradas->Tarjeta)
							->setCellValue("B$inicioFilas", $cuentasEncontradas->AccountNumber)
							->setCellValue("C$inicioFilas", $cuentasEncontradas->AccountName)
							->setCellValue("D$inicioFilas", $cuentasEncontradas->LastName.' '.$cuentasEncontradas->FirstName)
							->setCellValue("E$inicioFilas", number_format(abs($cuentasEncontradas->AccountBalance), 2));
				//aplico el border a todas las celdas
				$objPHPExcel->getActiveSheet()->getStyle("A4:E$inicioFilas")->applyFromArray($bordeCeldas);
				//pongo el texto de la ultima columan alineado a la derecha
				$objPHPExcel->getActiveSheet()
							->getStyle("E$inicioFilas")
								->getAlignment()
									->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
				$inicioFilas++;
		endforeach;
		//ancho de las colunmas ajustada al texto
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
		//titulo de la hoja activa
		$objPHPExcel->getActiveSheet()->setTitle('Listado de Cuentas');

		$objPHPExcel->setActiveSheetIndex(0);

		$objPHPExcel->getHeaders();

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save('php://output');
		
	}
	public function GenerarReporteCuentasP()
	{
		
				$GenerarReporteCuentas = $this->Reportesbuscar->GenerarReporteCuentas();
				//print_r($GenerarReportePaises);
				
			
				$this->load->library('Pdf');
									//PDF_PAGE_ORIENTATION	= L horizontal, P=vertical
				$pdf = new PdfCells("L", PDF_UNIT, "Letter", true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				$pdf->tituloReporte ="Listado de Cuentas";
				$pdf->usuario = "MaCruz-Gi";
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				// set default header data
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);
		
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				
				// set default monospaced font
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

				// set margins
												//PDF_MARGIN_TOP
				$pdf->SetMargins(PDF_MARGIN_LEFT, 35, PDF_MARGIN_RIGHT);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

				// set auto page breaks
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

				// set image scale factor
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				// ---------------------------------------------------------

				// set some language-dependent strings (optional)
				if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
					require_once(dirname(__FILE__).'/lang/eng.php');
					$pdf->setLanguageArray($l);
				}

				// set font
				$pdf->SetFont('courier', '', 15);

				// add a page
				$pdf->AddPage();

				// column titles
				$header = array('Tarjeta', 'Account Number', 'Account Name', 'Name', 'Balance');

				// data loading
				$data = $GenerarReporteCuentas;

				// print colored table
				$pdf->ContenidoTabla($header, $data);

				// ---------------------------------------------------------

				// close and output PDF document
				//$pdf->Output('example_011.pdf', 'I');
				
				//============================================================+
				// END OF FILE
				//============================================================+
				$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
				$respuesta = array(
					"respuesta"=>1,
					"mensaje"=>base_url().utf8_decode("Reporte.pdf")
					);	
			echo json_encode($respuesta);
	}
	public function TraerRecargasPorFecha(){
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
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Payments	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
				
				//envio los datos al modelo 
				$datos = array();
				$TraerRecargasPorFecha = $this->Reportesbuscar->TraerRecargasPorFecha($Payments);
				foreach($TraerRecargasPorFecha as $filasEncontradas):
						$datos[] = array(
								"RecNo"=>$filasEncontradas->RecNo,
								"AccountNumber"=>$filasEncontradas->AccountNumber,
								"PaymentDate"=>date("d-m-Y H:i:s", strtotime($filasEncontradas->PaymentDate)),
								"Amount"=>$filasEncontradas->Amount,
								"NO_FACTURA_TRANSACCION"=>$filasEncontradas->NO_FACTURA_TRANSACCION,
								"USUARIO"=>$filasEncontradas->USUARIO,
								"NOMBRE_CUENTA"=>utf8_encode($filasEncontradas->NOMBRE_CUENTA),
								"CardNumber"=>$filasEncontradas->CardNumber,
								"CARD_NOMBRE"=>utf8_encode($filasEncontradas->CARD_NOMBRE)
						);
				//echo utf8_encode($filasEncontradas->CARD_NOMBRE)."<br>";
				endforeach;
				echo json_encode($datos);
				
		  }
	}
	public function GenerarReporteRecargasPorFecha()
	{
				set_time_limit(0);
				$Payments	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
				$GenerarReporteRecargasPorFecha = $this->Reportesbuscar->GenerarReporteRecargasPorFecha($Payments);
				
			
				$this->load->library('Pdf');
				$pdf = new PdfGenerales('L', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Listado de Recargas desde la Fecha: ".date("d-m-Y", strtotime($Payments["FechaDesde"]))." hasta: ".date("d-m-Y", strtotime($Payments["FechaHasta"]));
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage('L','Letter');
				
				  
$encabezados = "";

$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0">
<tr>
<td width="80" style="text-align:center;"><b>ID Transacci&oacute;n</b></td>
<td width="15%" style="text-align:center;"><b>Tarjeta</b></td>
<td width="45%" style="text-align:center;"><b>Cuenta</b></td>
<td width="10%" style="text-align:center;"><b>No. Factura</b></td>
<td width="15%" style="text-align:center;"><b>Recarga</b></td>
</tr>
EOD;
		
		foreach($GenerarReporteRecargasPorFecha as $recargasEncontradas):

$Amount = number_format(abs($recargasEncontradas->Amount), 2);
				
$tbl .=<<<EOD
<tr>
<td>$recargasEncontradas->RecNo</td>
<td>$recargasEncontradas->AccountNumber</td>
<td>$recargasEncontradas->NOMBRE_CUENTA</td>
<td>$recargasEncontradas->NO_FACTURA_TRANSACCION</td>
<td style="text-align:right;">$Amount</td>
</tr>
EOD;
			
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			$pdf->writeHTML($encabezados, true, false, true, false, '');
			$pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);

	}
	public function TraerCargosPorFecha(){
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
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Invoices	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
				
				//envio los datos al modelo 
				
				$TraerCargosPorFecha = $this->Reportesbuscar->TraerCargosPorFecha($Invoices);
			
				echo json_encode($TraerCargosPorFecha);
				
		  }
	}
	public function GenerarReporteCargosPorFecha()
	{
				set_time_limit(0);
				$Invoices	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
				$GenerarReporteCargosPorFecha = $this->Reportesbuscar->GenerarReporteCargosPorFecha($Invoices);
				
			
				$this->load->library('Pdf');
				$pdf = new PdfGenerales('L', 'mm', 'Letter', true, 'UTF-8', false);
				$pdf->SetCreator(PDF_CREATOR);
				$pdf->SetAuthor('MaCruz-Gi');
				$pdf->SetTitle('Reporte');
				$pdf->SetSubject('Reporte');
				$pdf->SetKeywords('REPORTE, Reporte');
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config_alt.php de libraries/config
				$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING, array(0, 64, 255), array(0, 64, 128));
				$pdf->setFooterData($tc = array(0, 64, 0), $lc = array(0, 64, 128));
				// datos por defecto de cabecera, se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
				$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetMargins(25, PDF_MARGIN_TOP, 25);
				$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
				$pdf->SetTopMargin(50);
				$pdf->SetFooterMargin(25);//espacio del margen
				// se pueden modificar en el archivo tcpdf_config.php de libraries/config
				$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
				//relación utilizada para ajustar la conversión de los píxeles
				$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
				$pdf->setFontSubsetting(true);
				$pdf->SetFont('courier', '', 12, '', true);
				$pdf->tituloReporte ="Listado de Cargos desde la Fecha: ".date("d-m-Y", strtotime($Invoices["FechaDesde"]))." hasta: ".date("d-m-Y", strtotime($Invoices["FechaHasta"]));
				$pdf->usuario = $this->session->userdata("usuario");
				$pdf->AddPage('L','Letter');
				
				  
$encabezados = "";

$tbl =<<<EOD
<table border="1" cellpadding="0" cellspacing="0">
<tr>
<td width="20%" style="text-align:center;"><b>ID Transacci&oacute;n</b></td>
<td width="20%" style="text-align:center;"><b>Tarjeta</b></td>
<td width="45%" style="text-align:center;"><b>Cuenta</b></td>
<td width="15%" style="text-align:center;"><b>Cargo</b></td>
</tr>
EOD;
		
		foreach($GenerarReporteCargosPorFecha as $cargosEncontradas):

$Amount = number_format(abs($cargosEncontradas->Amount), 2);
				
$tbl .=<<<EOD
<tr>
<td>$cargosEncontradas->RowNo</td>
<td>$cargosEncontradas->CardNumber</td>
<td>$cargosEncontradas->NOMBRE_CUENTA</td>
<td style="text-align:right;">$Amount</td>
</tr>
EOD;
			
		endforeach;
$tbl .=<<<EOD
</table>
EOD;
			$pdf->writeHTML($encabezados, true, false, true, false, '');
			$pdf->writeHTML($tbl, true, false, true, false, '');
			$pdf->Output(utf8_decode("Reporte.pdf"), 'F');
			$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.pdf")
				);	
			echo json_encode($respuesta);

	}
	public function GenerarReporteRecargasPorFechaExcel(){
		set_time_limit(0);
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
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Payments	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
		$GenerarReporteCuentasExcel = $this->Reportesbuscar->GenerarReporteRecargasPorFecha($Payments);
		
		//cargo la liberia
		$this->load->library('Phpexcel');
		$objPHPExcel = new ReporteExcelGral();
		$objPHPExcel->activeErrorReporting();
		$objPHPExcel->noCli();
		// Setetenado las propiedades del documento
		$objPHPExcel->getProperties()->setCreator("TAS de El Salvador")
					   ->setLastModifiedBy("TAS de El Salvador")
					   /*->setTitle("Office 2007 XLSX Test Document")
					   ->setSubject("Office 2007 XLSX Test Document")*/
					   ->setDescription("Listado de Cuentas")
					   /*->setKeywords("office 2007 openxml php")
					   ->setCategory("Test result file")*/;

		$objPHPExcel->getDefaultStyle()->getFont()->setName('Arial')
												  ->setSize(10);            
		//titulos a partir de la fila 4 en excel
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('A4', 'ID Transacción')
					->setCellValue('B4', 'Tarjeta')
					->setCellValue('C4', 'Cuenta')
					->setCellValue('D4', 'No. Factura')
					->setCellValue('E4', 'Recarga');
		//combino las celdas de los titulos headers
		$objPHPExcel->setActiveSheetIndex(0)
					->mergeCells('A1:E1')
					->mergeCells('A2:E2')
					->mergeCells('A3:E3');
		//seteo los valores a las celdas combinadas 
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue("A1", 'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA')
					->setCellValue("A2", 'CEPA, EL SALVADOR')
					->setCellValue("A3", 'Listado Recargas desde la Fecha:'.date("d-m-Y", strtotime($Payments["FechaDesde"]))." hasta: ".date("d-m-Y", strtotime($Payments["FechaHasta"])));
		/*
		$estilo = array( 
		  'borders' => array(
			'outline' => array(
			  'style' => PHPExcel_Style_Border::BORDER_THIN
			)
		  )
		);
		 $objPHPExcel->getActiveSheet()->getStyle('A1:D1')->applyFromArray($estilo);
		 */
		 $bordeCeldas = array(
			  'borders' => array(
				  'allborders' => array(
					  'style' => PHPExcel_Style_Border::BORDER_THIN
				  )
			  )
		  );
		//$objPHPExcel->getActiveSheet()->getStyle('A1:D3')->applyFromArray($styleArray);
		 //centrar el texto de los encabezados
		 $colorFondo_cell = array(
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'color' => array('rgb' => 'BFBABA')
				)
			); 
		$orientacionTexto = array(
		   'alignment' => array(
			   'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			   'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
				) 
			); 
		//aplico los formatos a las celdas la orientacion del texto, negrita y color de fondo respectivamente
		$objPHPExcel->getActiveSheet()->getStyle('A1:E3')->applyFromArray($orientacionTexto);
		$objPHPExcel->getActiveSheet()->getStyle("A1:E4")->getFont()->setBold(true);
		$objPHPExcel->getActiveSheet()->getStyle("A4:E4")->applyFromArray($colorFondo_cell);

		//la iteracon comenzara desde 5 las 4 filas restantes del excel son para los headers
		$inicioFilas = 5;
		foreach($GenerarReporteCuentasExcel as $filasEncontradas):
		
				$objPHPExcel->setActiveSheetIndex(0)
							->setCellValue("A$inicioFilas", $filasEncontradas->RecNo)
							->setCellValue("B$inicioFilas", $filasEncontradas->AccountNumber)
							->setCellValue("C$inicioFilas", $filasEncontradas->NOMBRE_CUENTA)
							->setCellValue("D$inicioFilas", $filasEncontradas->NO_FACTURA_TRANSACCION)
							->setCellValue("E$inicioFilas", number_format(abs($filasEncontradas->Amount), 2));
				//aplico el border a todas las celdas
				$objPHPExcel->getActiveSheet()->getStyle("A4:E$inicioFilas")->applyFromArray($bordeCeldas);
				//pongo el texto de la ultima columan alineado a la derecha
				$objPHPExcel->getActiveSheet()
							->getStyle("E$inicioFilas")
								->getAlignment()
									->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
				$inicioFilas++;
		endforeach;
		//ancho de las colunmas ajustada al texto
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
		//titulo de la hoja activa
		$objPHPExcel->getActiveSheet()->setTitle('Listado de Recargas');

		$objPHPExcel->setActiveSheetIndex(0);

		

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save("Reporte.xlsx");
		// download file
        //header("Content-Type: application/vnd.ms-excel");
        //redirect(base_url()."Reporte.xlsx"); 
		$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.xlsx")
				);	
			echo json_encode($respuesta);
		
		  }
	}
	public function GenerarReporteCargosPorFechaExcel(){
		set_time_limit(0);
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
              
			   $respuesta = array(
							"respuesta"=>0,
							"mensaje"=>validation_errors()
							);
				echo json_encode($respuesta);
           }
		  else{
			 
				
				$Invoices	= array(
						"FechaDesde"=>date("Y-m-d", strtotime($this->input->post("FechaDesde"))),
						"FechaHasta"=>date("Y-m-d", strtotime($this->input->post("FechaHasta")))
						
					  );
		$GenerarReporteCargosPorFechaExcel = $this->Reportesbuscar->GenerarReporteCargosPorFecha($Invoices);
		
		//cargo la liberia
		$this->load->library('Phpexcel');
		$objPHPExcel = new ReporteExcelGral();
		$objPHPExcel->activeErrorReporting();
		$objPHPExcel->noCli();
		// Setetenado las propiedades del documento
		$objPHPExcel->getProperties()->setCreator("TAS de El Salvador")
					   ->setLastModifiedBy("TAS de El Salvador")
					   /*->setTitle("Office 2007 XLSX Test Document")
					   ->setSubject("Office 2007 XLSX Test Document")*/
					   ->setDescription("Listado de Cuentas")
					   /*->setKeywords("office 2007 openxml php")
					   ->setCategory("Test result file")*/;

		$objPHPExcel->getDefaultStyle()->getFont()->setName('Arial')
												  ->setSize(10);            
		//titulos a partir de la fila 4 en excel
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('A4', 'ID Transacción')
					->setCellValue('B4', 'Tarjeta')
					->setCellValue('C4', 'Cuenta')
					->setCellValue('D4', 'Cargo');
		//combino las celdas de los titulos headers
		$objPHPExcel->setActiveSheetIndex(0)
					->mergeCells('A1:D1')
					->mergeCells('A2:D2')
					->mergeCells('A3:D3');
		//seteo los valores a las celdas combinadas 
		$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue("A1", 'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA')
					->setCellValue("A2", 'CEPA, EL SALVADOR')
					->setCellValue("A3", 'Cargos desde :'.date("d-m-Y", strtotime($Invoices["FechaDesde"]))." hasta: ".date("d-m-Y", strtotime($Invoices["FechaHasta"])));
		/*
		$estilo = array( 
		  'borders' => array(
			'outline' => array(
			  'style' => PHPExcel_Style_Border::BORDER_THIN
			)
		  )
		);
		 $objPHPExcel->getActiveSheet()->getStyle('A1:D1')->applyFromArray($estilo);
		 */
		 $bordeCeldas = array(
			  'borders' => array(
				  'allborders' => array(
					  'style' => PHPExcel_Style_Border::BORDER_THIN
				  )
			  )
		  );
		//$objPHPExcel->getActiveSheet()->getStyle('A1:D3')->applyFromArray($styleArray);
		 //centrar el texto de los encabezados
		 $colorFondo_cell = array(
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'color' => array('rgb' => 'BFBABA')
				)
			); 
		$orientacionTexto = array(
		   'alignment' => array(
			   'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			   'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
				) 
			); 
		//aplico los formatos a las celdas la orientacion del texto, negrita y color de fondo respectivamente
		$objPHPExcel->getActiveSheet()->getStyle('A1:D3')->applyFromArray($orientacionTexto);
		$objPHPExcel->getActiveSheet()->getStyle("A1:D4")->getFont()->setBold(true);
		$objPHPExcel->getActiveSheet()->getStyle("A4:D4")->applyFromArray($colorFondo_cell);

		//la iteracon comenzara desde 5 las 4 filas restantes del excel son para los headers
		$inicioFilas = 5;
		foreach($GenerarReporteCargosPorFechaExcel as $filasEncontradas):
		
				$objPHPExcel->setActiveSheetIndex(0)
							->setCellValue("A$inicioFilas", $filasEncontradas->RowNo)
							->setCellValue("B$inicioFilas", $filasEncontradas->AccountNumber)
							->setCellValue("C$inicioFilas", $filasEncontradas->NOMBRE_CUENTA)
							->setCellValue("D$inicioFilas", number_format(abs($filasEncontradas->Amount), 2));
				//aplico el border a todas las celdas
				$objPHPExcel->getActiveSheet()->getStyle("A4:D$inicioFilas")->applyFromArray($bordeCeldas);
				//pongo el texto de la ultima columan alineado a la derecha
				$objPHPExcel->getActiveSheet()
							->getStyle("D$inicioFilas")
								->getAlignment()
									->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
				$inicioFilas++;
		endforeach;
		//ancho de las colunmas ajustada al texto
		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
		//titulo de la hoja activa
		$objPHPExcel->getActiveSheet()->setTitle('Listado de Cargos');

		$objPHPExcel->setActiveSheetIndex(0);

		

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
		$objWriter->save("Reporte.xlsx");
		// download file
        //header("Content-Type: application/vnd.ms-excel");
        //redirect(base_url()."Reporte.xlsx"); 
		$respuesta = array(
				"respuesta"=>1,
				"mensaje"=>base_url().utf8_decode("Reporte.xlsx")
				);	
			echo json_encode($respuesta);
		
		  }
	}
}
