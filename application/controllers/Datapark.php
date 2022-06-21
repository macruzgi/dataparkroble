<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Datapark extends CI_Controller {

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
		
		//cargo los modelos anecestiar
		$this->load->model("usuarios/Usuariosbuscar");
	}
	public function index()
	{
		//$this->load->view('welcome_message');
		//$mostrar["contenido"] = "vista_inicio";
		//$this->load->view("plantilla", $mostrar);
		
		///traer sucursales
		$mostrar["TraerSucursales"] = $this->Usuariosbuscar->TraerSucursales();
		//vista sin platilla porque se mostrara el login
		$this->load->view("vista_index", $mostrar);
	}
	public function IniciarSesion()
	{
		
		$this->form_validation->set_rules('usuario', 'Usuario', 'required');
		$this->form_validation->set_rules('clave', 'Clave', 'required');
		$this->form_validation->set_rules('id_sucursal', 'Sucursal', 'required');
		
		if ($this->form_validation->run() == FALSE)
		{
			//$this->load->view('vista_index');
			echo validation_errors();
		}
		else
		{
			//echo $clave_usuario = "HASHBYTES('MD5',".$this->input->post('clave').")"; exit;
					$usuario 	=$this->input->post('usuario');
					$clave		=$this->input->post('clave');
					$adm_usuario =array(
						"usuario"=>$this->input->post('usuario'),
						"clave_usuario"=>$this->input->post('clave'),
						"id_sucursal"=>$this->input->post('id_sucursal')
					);	
					///valido el usuario
					$usuarioEncontrado  = $this->Usuariosbuscar->IniciarSesion($adm_usuario);
					
					if($usuarioEncontrado){
						//traigo los permisos del usuario logueado
						$MenuUsuarioLogueado = $this->Usuariosbuscar->MenuUsuarioLogueado($usuario);
						//itero las opciones del menu para agregarlas a un array de la sesion y en los controladores evaluar solo si el usaurio posee permisos a esa vista
						$ids_modulo_opciones = array();
						foreach($MenuUsuarioLogueado as $opcionesEncontradas):
							$ids_modulo_opciones[] = $opcionesEncontradas->id_modulo_opcion;
							
						endforeach;
						
						//agrego los datos del asuario al array, el array de opciones del menu ids_modulo_opciones y las opciones del usuario logueado del mismo menu
						$datosEnSesion = array(
						'id_usuario'=>$usuarioEncontrado->id_usuario,
						'usuario'=>$usuarioEncontrado->usuario,
						'nombre_usuario'=>$usuarioEncontrado->nombre_usuario,
						'estado_usuario'=>$usuarioEncontrado->estado_usuario,
						'chequear'=>true,
						'MenuUsuarioLogueado'=>$MenuUsuarioLogueado,
						'ids_modulo_opciones'=>$ids_modulo_opciones,
						'id_sucursal'=>$usuarioEncontrado->id_sucursal,
						'sucursal_nombre'=>$usuarioEncontrado->sucursal_nombre
						);
						
						//agrego los datos a una sesion
						$this->session->set_userdata($datosEnSesion); 
						
						$respuesta = array(
							"respuesta"=>1,
							"mensaje"=>''
						);
						echo json_encode($respuesta);
					}
					else{
						$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Datos incorrectos o usuario est&aacute; inactivo, posiblemente el usuario no est&aacute; autorizado para iniciar sesi&oacute;n en el Centro Comercial seleccionado."
						);
						echo json_encode($respuesta);
					}			
		}
	}
	public function CerrarSesion()
	{
		$datosEnSesion = array(
		'chequear'=>false     
		);
		$this->session->sess_destroy();
		redirect(base_url());
		exit;
	}
	public function ErrorDeAcceso()
    {
		 //comprobamos si el usuario está logueado
		$estalogueado	= $this->session->userdata("chequear");
		if($estalogueado === true)
		{
			$mostrar["error"] = "ACCESO DENEGADO, SOLICITE AYUDA A UN ADMINISTRADOR.";
			$mostrar["contenido"] = "vista_acceso_denegado";
			$this->load->view("plantilla", $mostrar);
		}
		else
		{
			
			//si no estoy logueado que me envie a index
			redirect(base_url());
			exit;
		}		
    }
}
