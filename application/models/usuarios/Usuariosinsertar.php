<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo actualiza registros.
*/
class Usuariosinsertar extends CI_Model{ 
	public function RegistrarUsuario($adm_Usuario){
		
		$resultado = $this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Usuario(usuario, clave_usuario, nombre_usuario)
		VALUES('".$adm_Usuario['usuario']."',HASHBYTES('MD5','".$adm_Usuario['clave_usuarioC']."'),'".$adm_Usuario['nombre_usuario']."')");
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function InsertarPermisos($adm_Usuario){
		
	
		$resultado = $this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion_Usuario(id_usuario, id_modulo_opcion, 
							tiene_permiso)
							VALUES(?,?,1)", $adm_Usuario);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function InsertarSucursalesPermitidasAusaurio($adm_UsuariosEnSucursales){
		
	
		$resultado = $this->db->query("INSERT INTO DB_CONFIGURACIONES.dbo.adm_UsuariosEnSucursales(id_usuario, id_sucursal)
							VALUES(?,?)", $adm_UsuariosEnSucursales);
		
		//comprobando si la transaccion ha tenido exito
		if($resultado === true){
			return true;
		}
		else{
			return false;
		}
	}
}