<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualiza registros.
*/
class Usuarioseliminar extends CI_Model{ 
	public function EliminarOpcionesUsuarios($adm_Usuario){
	
		$resultado = $this->db->query("DELETE FROM DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion_Usuario WHERE id_usuario=?", $adm_Usuario);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function EliminarSucursalesAsigandasAusuario($id_usuario){
	
		$resultado = $this->db->query("DELETE FROM DB_CONFIGURACIONES.dbo.adm_UsuariosEnSucursales WHERE id_usuario=?", $id_usuario);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
}