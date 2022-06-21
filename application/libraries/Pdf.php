<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';
 
class Pdf extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
    	   $this->SetFont('times', 'B', 10);
        // Title
       // $this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
        // Logo
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 155, 8, 13, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 29, 8, 13, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
      
    }
	
	 

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $fyh =date("d-m-Y H:m:s");
        $this->SetY(-20);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
       // $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');     
	   $this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');
          
    }
	
	
}
/* application/libraries/Pdf.php */

class Pdf2 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
        //$this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
       
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 250, 10, 10, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 29, 10, 10, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
      
    }
    
    
    
    
    
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
        //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');
    }
    
    
}



class Pdf3 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
       
    }
    
    
    
    
    
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
        //$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }
    
    
}





class Pdf4 extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
        //$this->Cell(0, 15, 'Dirección Nacional de Medicamentos República de El Salvador', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
       
        $image_file = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file, 300, 10, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);

        $image_file2 = K_PATH_IMAGES.'dnmlogo.png';
        $this->Image($image_file2, 50, 10, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
      
    }
    
   
    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
        // Page number
       // $this->Cell(0, 10, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');

 
    }  




    
    
}
class PdfCertificacionesSinSesion extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	
		/*
			si las imagines las tengo en otra carpete hacer esto
			$image_file = './images/escudo.png';
			$this->Image($image_file, 165, 8, 13, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
			*/
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
        // Set font helveticaI courierI
     
        // $image_file = K_PATH_IMAGES.'dnmlogo.png';
       //$this->Image($image_file, 180, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfSolicitudDenegada extends TCPDF
{
	public $usuario="";
	public $herramienta=""; 
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		 $this->SetFont('times', 'B', 10); 
		 $this->Cell(0,5,'________________________________________________',0,1,'C');
		$this->Cell(0,5,'DRA. REINA LEONOR MORALES DE ACOSTA',0,1,'C');
		$this->Cell(0,5,'DIRECTOR(A) EJECUTIVO(A)',0,1,'C');
		$this->SetFont('times', 'B', 6);
		$this->Cell(0,5,$this->usuario,0,1,'R');
		$this->Cell(0,5,$this->herramienta,0,1,'R');
		
		$this->ln(5);
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfSolicitudPreveinido extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
        // Set font helveticaI courierI
     
        // $image_file = K_PATH_IMAGES.'dnmlogo.png';
       //$this->Image($image_file, 180, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfGenerales extends TCPDF
{
	public $usuario="";//variable publica rque recibe el usurio desde las vista o controladores
	public $tituloReporte=""; //variable publica rque recibe el numero de herramiente desde las vista o controladores
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
		
         $this->SetFont('courier', 'B', 10);
        // Title
		$this->Cell(0,5,'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA',0,1,'C');
		$this->Cell(0,5,'CEPA, EL SALVADOR',0,1,'C');
		
		$this->Cell(0,45,$this->tituloReporte,0,1,'C');	
       
        //$image_file = K_PATH_IMAGES.'dnmlogo.png';
		// el ante ante penultimo 0 es para que no muestre en marco la imagen, el 29 es para que me lo muestre mas a la izquierda, el 45 es para lo ancho el 30 para lo alto
       $this->Image("./images/CEPA_Logo.jpg", 29, 8, 45, 30, 'JPG', 'http://www.cepa.gob.sv/', '', true, 150, '', false, false, 0, false, false, false);

       //$image_file2 = K_PATH_IMAGES.'logosv.gif';
        //$this->Image("./images/logosv.gif", 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		$this->ln(5);
        $this->SetFont('courier', 'I', 7);
		$this->Cell(0,5,'San Luis Talpa, La Paz',0,1,'C');
		//$this->Cell(0,4,'Edificio Torre Roble, San Salvador, El Salvador; Comutador: +503 2537-1300',0,1,'C');
		//$this->Cell(0, 5, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->SetFont('courier', 'I', 6);
		//$this->Cell(0, 2, 'Fecha y Hora de impresión: '.date("d/m/Y H:i:s"),0,1,'C');
		$this->Cell(35, 5, 'Usuario: '.$this->usuario."-".date("d/m/Y H:i:s"), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		//$this->Cell(20, 5, date("d/m/Y H:i:s"), 0, false, 'L', 0, '', 0, false, 'T', 'M');    
		$this->Cell(195, 5, 'Pág. '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
		
    }  
    
}
class PdfDictamenes extends TCPDF
{
	public $usuario="";
	public $herramienta=""; 
    function __construct()
    {
        parent::__construct();
    }
    
      //Page header
    public function Header() {
           $this->SetFont('times', 'B', 10);
        // Title
 
		$this->Cell(0,5,'REPÚBLICA DE EL SALVADOR, C.A.',0,1,'C');
		$this->Cell(0,5,'DIRECCIÓN NACIONAL DE MEDICAMENTOS',0,1,'C');
		//$this->Cell(0,4,'ESTABLECIMIENTOS FARMACEUTICOS',0,1,'C');
		//$this->Cell(0,4,'LISTA DE CHEQUEO',0,1,'C');	

       
        $image_file = K_PATH_IMAGES.'dnmlogo.png';
       $this->Image($image_file, 165, 8, 28, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

       $image_file2 = K_PATH_IMAGES.'logosv.gif';
        $this->Image($image_file2, 29, 8, 28, '', 'GIF', '', 'T', false, 300, '', false, false, 0, false, false, false);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        //this->SetY(-15);
        // Set font
		 $this->SetFont('times', 'B', 10); 
		 $this->Cell(0,5,'________________________________________________',0,1,'C');
		$this->Cell(0,5,"LIC. VICTOR MANUEL DOMÍNGUEZ",0,1,'C');
		$this->Cell(0,5,'JEFE DE LA UNIDAD JURÍDICA',0,1,'C');
		$this->SetFont('times', 'B', 6);
		$this->Cell(0,5,$this->usuario,0,1,'R');
		$this->Cell(0,5,$this->herramienta,0,1,'R');
		
		$this->ln(5);
        $this->SetFont('times', 'I', 7);
		$this->Cell(0,5,'Urb. Jardines del Volcán y Av. Jayaque, Ed. El Gran Bazar, 4ta planta',0,1,'C');
		$this->Cell(0,5,'Ciudad Merliot, Santa Tecla',0,1,'C');
		$this->Cell(0,4,'PBX: (503) 2522-5000; 2522-5001',0,1,'C');
		$this->Cell(0,4,'Correo: info@medicamentos.gob.sv / web: www.medicamentos.gob.sv',0,1,'C');	
    }  
    
}
class PdfCells extends TCPDF
{

	public $usuario="";
	public $tituloReporte=""; 
	 //Page header
    public function Header() {
        // Logo
           //$image_file = K_PATH_IMAGES.'dnmlogo.png';
		// el ante ante penultimo 0 es para que no muestre en marco la imagen, el 29 es para que me lo muestre mas a la izquierda, el 30 es para lo ancho el 15 para lo alto
       $this->Image("./images/CEPA_Logo.jpg", 29, 8, 30, 15, 'JPG', 'http://www.cepa.gob.sv', '', true, 150, '', false, false, 0, false, false, false);
	   $this->SetFont('courier', 'B', 12);
		$this->Cell(0,5,'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA',0,1,'C');
		$this->Cell(0,5,'CEPA, EL SALVADOR',0,1,'C');
        $this->ln(2);
        // Title
        $this->Cell(0, 15, $this->tituloReporte, 0, false, 'C', 0, '', 0, false, 'M', 'M');
	
    }
	// Colored table
	public function ContenidoTabla($header,$data) {
		
		// Colors, line width and bold font
		$this->SetFillColor(6, 105, 162);//color de fonde de los encabezados
		$this->SetTextColor(255);// coor del texto de los encabezados
		$this->SetDrawColor(6, 0, 0);//color del border del contorno de las lineas
		$this->SetLineWidth(0.3);
		$this->SetFont('', 'B');
		// Header
		$w = array(36, 50, 85, 50, 30);
		$num_headers = count($header);
		for($i = 0; $i < $num_headers; ++$i) {
			$this->Cell($w[$i], 7, $header[$i], 1, 0, 'C', 1);
		}
		$this->Ln();
		// Color and font restoration, intercalod de lineas
		$this->SetFillColor(224, 235, 255);
		$this->SetTextColor(0);
		$this->SetFont('');
		// Data
		$fill = 0;
		foreach($data as $row) {
			$this->Cell($w[0], 6, $row->Tarjeta, 'LR', 0, 'L', $fill);
			$this->Cell($w[1], 6, $row->AccountNumber, 'LR', 0, 'L', $fill);
			$this->Cell($w[2], 6, $row->AccountName, 'LR', 0, 'L', $fill);
			$this->Cell($w[3], 6, /*$row->LastName." ".*/$row->FirstName, 'LR', 0, 'L', $fill); // la ultima L es alineacion  left
			$this->Cell($w[4], 6, abs(number_format($row->AccountBalance, 2)), 'LR', 0, 'R', $fill);
			$this->Ln();
			$fill=!$fill;
		}
		$this->Cell(array_sum($w), 0, '', 'T');
	}
	

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-20);
        // Set font
        $this->SetFont('courier', 'I', 7);
		$this->Cell(0,5,'San Luis Talpa, La Paz',0,1,'C');
		//$this->Cell(0,4,'Edificio Torre Roble, San Salvador, El Salvador; Comutador: +503 2537-1300',0,1,'C');
        // Page number
        $this->Cell(0, 10, 'Página '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->Cell(0,5,date("d-m-Y H:m:s"),0,1,'R');
		$this->Cell(0,5,$this->usuario,0,1,'R');
    }
}

/* application/libraries/Pdf.php */