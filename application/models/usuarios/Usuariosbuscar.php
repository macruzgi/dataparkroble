<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo busca registros.
*/
class Usuariosbuscar extends CI_Model{ 
	public function IniciarSesion($adm_usuario){
		
		$resultado = $this->db->query("SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.estado_usuario,
		su.id_sucursal, su.sucursal_nombre
		 FROM DB_CONFIGURACIONES.dbo.adm_Usuario u
		 INNER JOIN DB_CONFIGURACIONES.dbo.adm_UsuariosEnSucursales en 
		 on(en.id_usuario = u.id_usuario and en.id_sucursal =".$adm_usuario["id_sucursal"].")
		 INNER JOIN DB_CONFIGURACIONES.dbo.adm_Sucursal su
		  on(su.id_sucursal = ".$adm_usuario["id_sucursal"].")
		 WHERE u.usuario = '".$adm_usuario["usuario"]."' 
		 and u.clave_usuario = HASHBYTES('MD5','".$adm_usuario["clave_usuario"]."') 
		 AND u.estado_usuario = 1
		 AND su.sucursal_estado = 1");
		/*
		$resultado = $this->db->query("SELECT id_usuario, usuario, nombre_usuario, estado_usuario
		 from DB_CONFIGURACIONES.dbo.adm_Usuario WHERE usuario = '$usuario' and clave_usuario = HASHBYTES('MD5', '$clave') AND estado_usuario = 1");
		 */
		return $resultado->row();
	}
	public function ChequearClaveAntigua($usuario, $clave){
		$resultado = $this->db->query("select count(usuario) as CUENTA
		 from DB_CONFIGURACIONES.dbo.adm_Usuario where usuario = '$usuario' and clave_usuario=HASHBYTES('MD5', '$clave')");
		$fila = $resultado->row();
		return $fila->CUENTA;
	}
	public function MenuUsuarioLogueado($usuario){
		$resultado = $this->db->query("SELECT u.id_usuario, u.usuario, m.id_modulo, m.nombre_modulo, 
				mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion, m.icono_item
			FROM DB_CONFIGURACIONES.dbo.adm_Usuario u
			INNER JOIN DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion_Usuario mou ON(u.id_usuario = mou.id_usuario)
			INNER JOIN DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion mo ON(mo.id_modulo_opcion = mou.id_modulo_opcion)
			INNER JOIN DB_CONFIGURACIONES.dbo.adm_Modulo m ON(m.id_modulo = mo.id_modulo)
			WHERE u.usuario =? AND mou.tiene_permiso = 1 AND mo.estado_opcion = 1
			ORDER BY m.id_modulo, mo.id_modulo_opcion", $usuario);
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	public function ChequearExistenciaUsuario($usuario){
		$resultado = $this->db->query("select count(usuario) as CUENTA
		 FROM DB_CONFIGURACIONES.dbo.adm_Usuario WHERE usuario = '$usuario'");
		$fila = $resultado->row();
		return $fila->CUENTA;
	}
	public function ListaUarios(){
		$resultado = $this->db->query("SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.fecha,
				CASE 
					WHEN u.estado_usuario = 1 THEN 'ACTIVO'
				ELSE 'INACTIVO' END AS ESTADO_USUARIO
			FROM DB_CONFIGURACIONES.dbo.adm_Usuario u ORDER BY fecha desc");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	public function TraerOpcionesDelMenu($id_usuario){
		$resultado = $this->db->query("SELECT m.id_modulo, m.nombre_modulo, 
						mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion, mo.descripcion_menu_opcion,
						isnull(cast(mou.tiene_permiso AS int), -1029) AS TIENE_PERMISO,u.usuario
					FROM  DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion mo
					INNER JOIN DB_CONFIGURACIONES.dbo.adm_Modulo m on(m.id_modulo = mo.id_modulo)
					LEFT JOIN DB_CONFIGURACIONES.dbo.adm_Modulo_Opcion_Usuario mou ON(mou.id_modulo_opcion = mo.id_modulo_opcion AND mou.id_usuario=$id_usuario)
					INNER JOIN DB_CONFIGURACIONES.dbo.adm_Usuario u ON(u.id_usuario =$id_usuario  and u.estado_usuario =1)
						WHERE mo.estado_opcion = 1
					ORDER BY m.id_modulo, mo.id_modulo_opcion");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	public function TraerSucursales(){
		$resultado = $this->db->query("select id_sucursal, sucursal_nombre FROM DB_CONFIGURACIONES.dbo.adm_Sucursal
WHERE sucursal_estado = 1");
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	public function TraerSucursalesAsigandasaUsuario($id_usuario){
		$resultado = $this->db->query("SELECT su.id_sucursal, su.sucursal_nombre, 
 u.id_usuario, u.usuario, (SELECT usuArio FROM DB_CONFIGURACIONES.dbo.adm_Usuario  WHERE id_usuario = $id_usuario) USUARIO
FROM DB_CONFIGURACIONES.dbo.adm_Sucursal su
LEFT JOIN DB_CONFIGURACIONES.dbo.adm_UsuariosEnSucursales usu
	ON(usu.id_sucursal = su.id_sucursal AND usu.id_usuario = $id_usuario)
LEFT JOIN DB_CONFIGURACIONES.dbo.adm_Usuario u
	ON(u.id_usuario = usu.id_usuario)
WHERE su.sucursal_estado = 1");
		
		$datosEnArray = array();
		if($resultado->num_rows() > 0){
			
			foreach($resultado->result() as $filasEncontradas){
				$datosEnArray[] = $filasEncontradas;
			}
		}
		return $datosEnArray;
	}
	
}