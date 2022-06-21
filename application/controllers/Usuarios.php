<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

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
		 //comprobamos si el usuario está logueado
		$estalogueado	= $this->session->userdata("chequear");
		if($estalogueado === true)
		{
		}
		else
		{
			
			//si no estoy logueado que me envie a index
			redirect(base_url());
			exit;
		}
		//cargo los modelos anecestiar
		$this->load->model("usuarios/Usuariosactualizar");
		$this->load->model("usuarios/Usuariosbuscar");
		$this->load->model("usuarios/Usuariosinsertar");
		$this->load->model("usuarios/Usuarioseliminar");
	}
	public function VerSiUsuarioTieneAccesoAlaOpcion($id_modulo_opcion){
		if (in_array("$id_modulo_opcion", $this->session->userdata('ids_modulo_opciones'))) {
				
		}else{
				redirect(base_url()."datapark/ErrorDeAcceso");
				exit;
		}
	}
	public function VistaPerfil()
	{
		$mostrar["contenido"] = "usuarios/vista_perfil";
		$this->load->view("plantilla", $mostrar);
	}
	public function ActualizarDatosUsuario()
	{
		$this->form_validation->set_rules("usuario", "Usuario","required",
				array(
						'required'      => 'El %s es requerido.'
					)
			);
		$this->form_validation->set_rules("nombre_usuario", "Nombre","required",
				array(
						'required'      => 'Digite el %s.'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
			 
			 
					//armo un array para enviar los datos
				  $adm_Usuario = array(
						"usuario"=>$this->input->post("usuario"),
						"nombre_usuario"=>$this->input->post("nombre_usuario")
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Usuariosactualizar->ActualizarDatosUsuario($adm_Usuario);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
				}
				
	}
	public function ActualizarCredencialesUsuario()
	{
		$this->form_validation->set_rules("clave_usuario", "Contrase&ntilde;a","required|min_length[5]|max_length[10]",
				array(
						'required'      => 'Debe digitar la %s',
						'min_length'	=> 'El m&iacute;nimo de caracteres permitidos para la %s es %s',
						'max_length'	=> 'El m&aacute;ximo de caracteres parmitidos para la %s es %s'
					)
			);
		$this->form_validation->set_rules("clave_usuarioV", "Contrase&ntilde;a Anterior","required|callback_ChequearClaveAntigua",
				array(
						'required'      => 'Digite la %s.'
					)
			);
		$this->form_validation->set_rules("clave_usuarioC", "Contrase&ntilde;a Nueva (Confirmaci&oacute;n)","required|matches[clave_usuario]",
				array(
						'required'     	=> 'Digite la %s.',
						'matches'		=> 'La %s no coincide'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Usuario = array(
						"usuario"=>$this->session->userdata('usuario'),
						"clave_usuario"=>$this->input->post("clave_usuario")
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Usuariosactualizar->ActualizarCredencialesUsuario($adm_Usuario);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	//CALLBACK para validar la contraseña actual del usuario
	public function ChequearClaveAntigua($clave_usuarioV)
	{
		$verificarClaveAntigua = $this->Usuariosbuscar->ChequearClaveAntigua($this->session->userdata('usuario'), $clave_usuarioV);
		if($verificarClaveAntigua == 0)//no se encontraron resultados
		{
			$this->form_validation->set_message("ChequearClaveAntigua", 'La contrase&ntilde;a Anteior que ha ingresado no coincide');
			return FALSE;
		}	
		return TRUE;
		
	}
	public function VistaUsuario()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(6);
		$mostrar["contenido"] = "usuarios/vista_nuevo_perfil";
		$this->load->view("plantilla", $mostrar);		
	}
	public function RegistrarUsuario()
	{
		$this->form_validation->set_rules("usuario", "Usuario","required|min_length[5]|max_length[10]|callback_ChequearExistenciaUsuario",
				array(
						'required'      => 'Debe digitar el %s',
						'min_length'	=> 'El m&iacute;nimo de caracteres permitidos para el %s es %s',
						'max_length'	=> 'El m&aacute;ximo de caracteres parmitidos para el %s es %s'
					)
			);
		$this->form_validation->set_rules("nombre_usuario", "Nombre Usario","required",
				array(
						'required'      => 'Digite el %s.'
					)
			);
		$this->form_validation->set_rules("clave_usuario", "Contrase&ntilde;a","required|min_length[5]|max_length[10]",
				array(
						'required'     	=> 'Digite la %s.',
						'min_length'	=> 'El m&iacute;nimo de caracteres permitidos para la %s es %s',
						'max_length'	=> 'El m&aacute;ximo de caracteres parmitidos para la %s es %s'
					)
			);
		$this->form_validation->set_rules("clave_usuarioC", "Contrase&ntilde;a Nueva (Confirmaci&oacute;n)","required|matches[clave_usuario]",
				array(
						'required'     	=> 'Digite la %s.',
						'matches'		=> 'La %s no coincide'
					)
			);
		
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Usuario = array(
						"usuario"=>$this->input->post('usuario'),
						"nombre_usuario"=>$this->input->post("nombre_usuario"),
						"clave_usuarioC"=>$this->input->post('clave_usuarioC')
					  );
				
					//envio los datos al modelo para actualizar
					$insertar = $this->Usuariosinsertar->RegistrarUsuario($adm_Usuario);
					if($insertar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	//CALLBACK para verificar si el usuario existe
	public function ChequearExistenciaUsuario($usuario)
	{
		$resultadoUsuario = $this->Usuariosbuscar->ChequearExistenciaUsuario($usuario);
		if($resultadoUsuario > 0)//el usuario ya existe
		{
			$this->form_validation->set_message("ChequearExistenciaUsuario", 'El usuario que se intenta registrar ya existe');
			return FALSE;
		}	
		return TRUE;
		
	}
	public function ListaUsuarios()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(7);
		$mostrar["ListaUarios"] 	= $this->Usuariosbuscar->ListaUarios();
		$mostrar["contenido"] 			= "usuarios/vista_listado_usuarios";
		$this->load->view("plantilla", $mostrar);

	}
	public function DesactivarUsuario()
	{
		$this->form_validation->set_rules("id_usuario", "Usuario","required",
				array(
						'required'      => 'Debe selecionar el %s'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Usuario = array(
						"id_usuario"=>$this->input->post('id_usuario')
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Usuariosactualizar->DesactivarUsuario($adm_Usuario);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	public function ActivarUsuario()
	{
		$this->form_validation->set_rules("id_usuario", "Usuario","required",
				array(
						'required'      => 'Debe selecionar el %s'
					)
			);
				
		if ($this->form_validation->run() == FALSE)
           {
               echo validation_errors();
           }
		  else{
					
					//armo un array para enviar los datos
				  $adm_Usuario = array(
						"id_usuario"=>$this->input->post('id_usuario')
					  );
				
					//envio los datos al modelo para actualizar
					$actualizar = $this->Usuariosactualizar->ActivarUsuario($adm_Usuario);
					if($actualizar){
						echo 1;
					}
					else{
						echo 0;
					}
			 
			}
				
	}
	public function VistaAsignarPermisos()
	{
		//verifico si el usuario tiene permisos a esta opcion enviando el id_modulo_opcion que es unica
		$this->VerSiUsuarioTieneAccesoAlaOpcion(7);
		$mostrar["TraerOpcionesDelMenu"] 	= $this->Usuariosbuscar->TraerOpcionesDelMenu($this->uri->segment(3));
		$mostrar["TraerSucursalesAsigandasaUsuario"] 	= $this->Usuariosbuscar->TraerSucursalesAsigandasaUsuario($this->uri->segment(3));
		$mostrar["contenido"] 				= "usuarios/vista_asignar_permisos";
		$this->load->view("plantilla", $mostrar);

	}
	public function AsignarPermisos()
	{
		$this->form_validation->set_rules("id_usuario", "Usuario","required",
				array(
						'required'      => 'Debe selecionar el %s'
					)
			);
		$this->form_validation->set_rules("id_modulo_opcion[]", "Opci&oacute;n","required",
				array(
						'required'      => 'Debe selecionar alguna %s'
					)
			);
		$this->form_validation->set_rules("id_sucursal[]", "Sucursal","required",
				array(
						'required'      => 'Debe selecionar alguna %s'
					)
			);	
		/*$this->form_validation->set_rules("insertarActualizar[]", "Valor Condicional","required",
				array(
						'required'      => 'Falta el %s'
					)
			);*/
				
		if ($this->form_validation->run() == FALSE)
           {
               $respuesta = array(
					"respuesta"=>0,
					"mensaje"=>validation_errors()
					);
				echo json_encode($respuesta);
           }
		  else{
				$id_usuario					= $this->input->post("id_usuario");
				$id_modulo_opcionArreglo	= $this->input->post("id_modulo_opcion");
				$InsertarPermisos = false;
				//elimino las opciones actuales del id_usuario
				$this->Usuarioseliminar->EliminarOpcionesUsuarios($id_usuario);
				//variable para verificar cuantos opciones he chequeado
				$total_coleccion	= count($id_modulo_opcionArreglo);
				//itero la coleccion de las opciones seleccionadas
				for($i=0; $i < $total_coleccion; $i++){
						$adm_Usuario = array(
							"id_usuario"=>$id_usuario,
							"id_modulo_opcion"=>$id_modulo_opcionArreglo[$i]
						);		
						$InsertarPermisos = $this->Usuariosinsertar->InsertarPermisos($adm_Usuario);
					}
				
				////PROCESO PARA LAS SUCURSALES////
				
				$id_sucursalArreglo = $this->input->post("id_sucursal");
				//elimino las sucursules actuales del id_usuario
				$this->Usuarioseliminar->EliminarSucursalesAsigandasAusuario($id_usuario);
				//variable para verificar cuantas sucursales he chequeado
				$total_coleccionSurcursal	= count($id_sucursalArreglo);
				//itero la coleccion de las opciones seleccionadas
				for($i=0; $i < $total_coleccionSurcursal; $i++){	
						$adm_UsuariosEnSucursales  = array(
							"id_usuario"=>$id_usuario,
							"id_sucursal"=>$id_sucursalArreglo[$i]
						);	
					//inserto las sucursales seleccionadas.
					$this->Usuariosinsertar->InsertarSucursalesPermitidasAusaurio($adm_UsuariosEnSucursales);
					}
				/////FIN PROCESO SUCURSALES
				
				if($InsertarPermisos){
						$respuesta = array(
							"respuesta"=>1,
							"mensaje"=>""
							);
						echo json_encode($respuesta);
					}
				else{
						$respuesta = array(
							"respuesta"=>2,
							"mensaje"=>"Errores al Generar, solicite ayuda a un administrador"
							);
						echo json_encode($respuesta);
					}
			 
			}
				
	}
}