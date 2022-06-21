<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualiza registros.
*/
class Usuariosactualizar extends CI_Model{ 
	public function ActualizarDatosUsuario($adm_Usuario){
	
		$resultado = $this->db->query('UPDATE DB_CONFIGURACIONES.dbo.adm_Usuario SET nombre_usuario ='."'".$adm_Usuario['nombre_usuario']."' ".' WHERE usuario ='."'".$adm_Usuario['usuario']."'");
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function ActualizarCredencialesUsuario($adm_Usuario){
	
		$resultado = $this->db->query('UPDATE DB_CONFIGURACIONES.dbo.adm_Usuario SET clave_usuario =HASHBYTES('."'MD5',"."'".$adm_Usuario['clave_usuario']."') ".'
							WHERE usuario ='."'".$adm_Usuario['usuario']."'");
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function DesactivarUsuario($adm_Usuario){
	
		$resultado = $this->db->query('UPDATE DB_CONFIGURACIONES.dbo.adm_Usuario SET estado_usuario = 0
							WHERE id_usuario =?', $adm_Usuario);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function ActivarUsuario($adm_Usuario){
	
		$resultado = $this->db->query('UPDATE DB_CONFIGURACIONES.dbo.adm_Usuario SET estado_usuario = 1
							WHERE id_usuario =?', $adm_Usuario);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
}