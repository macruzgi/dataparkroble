<?php
/*
Modelo estandarizado y creado por MaCruz-Gi
mail:giancarlos1029@hotmail.com
Modelo que solo elemina registros.
*/
class Generaleliminar extends CI_Model{ 
	public function __construct(){
		parent::__construct();
		/*
		//validacion para ver que db se debe cargar
		$this->db  = $this->load->database();
		if($this->session->id_sucursal == 2){
			$this->db = $this->load->database('metroCentro', TRUE);
		}
		else if($this->session->id_sucursal == 3){
			$this->db = $this->load->database('metroSur', TRUE);
		}
		*/
		
	}
	public function NombreConexionRemota($id_sucursal){
		$resultado = $this->db->query("SELECT conexion_nombre FROM DB_CONFIGURACIONES.dbo.conf_Conexiones_Remotas 
			WHERE id_sucursal = ?", $id_sucursal);
		$fila = $resultado->row(); 
		return $fila->conexion_nombre;
	}
	public function QuitarTarjetaAservidor($Cards){
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($Cards["id_sucursal"]), true);
		/* esto se quita porque ya se trae el nombre de la conexion desde una tabla de la db
		if($Cards["id_sucursal"] == 2){
			//METROCENTRO
			$this->SERVIDOR = $this->load->database($nombreConexion, true);
		}
		if($Cards["id_sucursal"] == 3){
			//METROSUR
			$this->SERVIDOR = $this->load->database("metroSur", true);
		}
		if($Cards["id_sucursal"] == 4){
		 //si espeficar
		}
		*/
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->SERVIDOR->trans_start();

		//elimino en la tabla Cards
		$this->SERVIDOR->query("DELETE FROM Cards WHERE [Card Number] =? AND	[Account Number] =?",
				array($Cards["CardNumber"], $Cards["AccountNumber"])
				);
		
			//inserto en la bitacora
		$this->SERVIDOR->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Cards'".", 'DELETE', '".$this->session->userdata("usuario")."', '".'Se ELIMINO de la cuenta No. '.$Cards['AccountNumber'].' la tarjeta No. '.$Cards['CardNumber']."'
						 + char(10) + '".' NO se ELIMINA el registro en la tabla lsmCard para la tarjeta en cuestion'."')");
		
		//finalizao la transaccion
		$this->SERVIDOR->trans_complete();
		
		//comprobando si la transaccion ha tenido exito
		if($this->SERVIDOR->trans_status() === true){
			return true;
		}
		else{
			return false;
		}
	}
	public function QuitarCuentaYtarjetasAservidor($Accounts){
		//traer nombre de la conexion
		$this->SERVIDOR = $this->load->database($this->NombreConexionRemota($Accounts["id_sucursal"]), true);
		
		//inicio transaccion si una sentencia falla se hace el rollback
		$this->SERVIDOR->trans_start();
		
		
		//elimino en la tabla Cards
		$this->SERVIDOR->query("DELETE Cards FROM Cards 
				INNER JOIN Accounts 
					ON(Accounts.[Account Number] = Cards.[Account Number])
				WHERE Cards.[Account Number] =?",
				$Accounts["AccountNumber"]
				);
		//elimino en la tabla Accounts
		$this->SERVIDOR->query("DELETE FROM Accounts WHERE [Account Number] =?",
				$Accounts["AccountNumber"]);
			//inserto en la bitacora
		$this->SERVIDOR->query('INSERT INTO DB_CONFIGURACIONES.dbo.adm_Auditoria(tbl_gestionada, accion_realizada, usuario, descripcion)
							VALUES('."'Cards'".", 'DELETE', '".$this->session->userdata("usuario")."', '".'Se ELIMINARON de la cuenta No. '.$Accounts['AccountNumber'].' todas las tarjetas respectivas.'."' + char(10) + '".' Se ELIMINO la cuenta No. '.$Accounts['AccountNumber']."'
						 + char(10) + '".'NO se ELIMINA el registro en la tabla lsmCard para las tarjetas eliminadas'."')");
		
		//finalizao la transaccion
		$this->SERVIDOR->trans_complete();
		
		//comprobando si la transaccion ha tenido exito
		if($this->SERVIDOR->trans_status() === true){
			return true;
		}
		else{
			return false;
		}
	}
}