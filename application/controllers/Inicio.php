<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inicio extends CI_Controller {

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
		$this->load->model("graficas/Graficas");
		
	}
	public function index()
	{
		//$this->load->view('welcome_message');
		$mostrar["contenido"] = "vista_inicio";
		$this->load->view("plantilla", $mostrar);

	}
	public function TraerDatosParaGraficas(){
		$fecha_hoy = date("Y-m-d");
		$TraerDatosParaGraficas = $this->Graficas->TraerDatosParaGraficas($fecha_hoy);
		/*$PORCENTAJE_VENTA_SITIO01	= 0;
		$PORCENTAJE_VENTA_SITIO02	= 0;
		$PORCENTAJE_VENTA_SITIO03	= 0;
		if($TraerDatosParaGraficas->TOTAL_VENTAS_GRAL > 0){
				$PORCENTAJE_VENTA_SITIO01=number_format(($TraerDatosParaGraficas->TOTAL_VENTA_SITIO01 * 100) / $TraerDatosParaGraficas->TOTAL_VENTAS_GRAL, 2);
				$PORCENTAJE_VENTA_SITIO02=number_format(($TraerDatosParaGraficas->TOTAL_VENTA_SITIO02 * 100) / $TraerDatosParaGraficas->TOTAL_VENTAS_GRAL, 2);
				$PORCENTAJE_VENTA_SITIO03=number_format(($TraerDatosParaGraficas->TOTAL_VENTA_SITIO03 * 100) / $TraerDatosParaGraficas->TOTAL_VENTAS_GRAL, 2);
			}
			*/
		$respuesta = array(
			/*"TOTAL_VENTA_SITIO01"=>number_format($TraerDatosParaGraficas->TOTAL_VENTA_SITIO01, 2),
			"TOTAL_COBROS_SITIO01"=>number_format($TraerDatosParaGraficas->TOTAL_COBROS_SITIO01, 2),
			"TOTAL_VENTA_SITIO02"=>number_format($TraerDatosParaGraficas->TOTAL_VENTA_SITIO02, 2),
			"TOTAL_COBROS_SITIO02"=>number_format($TraerDatosParaGraficas->TOTAL_COBROS_SITIO02, 2),
			"TOTAL_VENTA_SITIO03"=>number_format($TraerDatosParaGraficas->TOTAL_VENTA_SITIO03, 2),
			"TOTAL_COBROS_SITIO03"=>number_format($TraerDatosParaGraficas->TOTAL_COBROS_SITIO03, 2),*/
			"TOTAL_VENTAS_GRAL"=>number_format($TraerDatosParaGraficas->TOTAL_VENTAS_GRAL, 2),
			"TOTAL_COBROS_GRAL"=>number_format($TraerDatosParaGraficas->TOTAL_COBROS_GRAL, 2)/*,
			"PORCENTAJE_VENTA_SITIO01"=>$PORCENTAJE_VENTA_SITIO01,
			"PORCENTAJE_VENTA_SITIO02"=>$PORCENTAJE_VENTA_SITIO02,
			"PORCENTAJE_VENTA_SITIO03"=>$PORCENTAJE_VENTA_SITIO03*/
		);
		echo json_encode($respuesta);
	}
	public function TraerDatosParaGraficasLinea(){
		$fecha_hoy = date("Y-m-d");
		$TraerDatosParaGraficasLineaRecargas 	= $this->Graficas->TraerDatosParaGraficasLineaRecargas($fecha_hoy);
		$TraerDatosParaGraficasLineaCargos 		= $this->Graficas->TraerDatosParaGraficasLineaCargos($fecha_hoy);
		$datos =array(
			"Recargas"=>$TraerDatosParaGraficasLineaRecargas,
			"Cargos"=>$TraerDatosParaGraficasLineaCargos
		);
		
		echo json_encode($datos);
	}
	public function Cambios(){
		//esta vista es para ver los cambios que se han realizado en el sistema cada vez que se haga una actualizacion, la vista sera accesible para todos pero le pondre validacion para que no sea del todo publica; se evaluara si e ingresado a la url el año y el dia actual
		if($this->uri->segment(3) != date("Yd")){
			exit;
		}
		$mostrar["contenido"] = "vista_registro_de_cambios";
		$this->load->view("plantilla", $mostrar);
	}
}
