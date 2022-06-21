<?php 
 //print_r( $this->session->all_userdata());
 //$MenuUsuarioLogueado = ($this->session->userdata('MenuUsuarioLogueado'));
 //echo $MenuUsuarioLogueado[1]->nombre_opcion;
 ?>
 <ul class="list">
                    <li class="header">MEN&Uacute; PRINCIPAL</li>
					<li>
                        <a href="<?php echo base_url();?>Inicio">
                            <i class="material-icons">home</i>
                            <span>Inicio</span>
                        </a>
                    </li>
					<?php
						$banderaModulo = 0;
						foreach($this->session->userdata('MenuUsuarioLogueado') as $modulosEcontrados):
						if($banderaModulo != $modulosEcontrados->id_modulo){
					?>
					<li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons"><?php echo $modulosEcontrados->icono_item;?></i>
                            <span><?php echo $modulosEcontrados->nombre_modulo;?></span>
                        </a>
                        <ul class="ml-menu">
							<?php
								$banderaModulo = $modulosEcontrados->id_modulo;
								foreach($this->session->userdata('MenuUsuarioLogueado') as $opcionesEcnontradas):
									$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
									if($banderaModuloOPcion == $opcionesEcnontradas->id_modulo && $banderaModulo == $banderaModuloOPcion){
										$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
							?>
                            <li>
                                 <a href="<?php echo base_url().$opcionesEcnontradas->nombre_controlador_opcion;?>"><?php echo $opcionesEcnontradas->nombre_opcion;?></a>
                            </li>
                            <!--li>
                                <a href="<?php echo base_url();?>Tarjetas/VistaRecargarTarjeta">Recargas</a>
                            </li>
							<li>
                               <a href="<?php echo base_url();?>Cuentas/ListadoCuentas">Cuentas</a>
                            </li-->
                           <?php
									}
									else{
										$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
									}
								endforeach;
						   ?>
                        </ul>
                    </li>
					<?php
							$banderaModulo = $modulosEcontrados->id_modulo;
						 }
						endforeach;
						
					?>
					<!--li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">settings</i>
                            <span>Aministraci&oacute;n</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                 <a href="<?php echo base_url();?>Tarjetas/VistaRevertirRecarga">Reversi&oacute;n de Recarga</a>
                            </li>
                            <li>
                                <a href="<?php echo base_url();?>Tarjetas/VistaAjustarRecarga">Ajuste de Recarga</a>
                            </li>
							<li>
                               <a href="<?php echo base_url();?>Cuentas/ListadoCuentas">Cuentas</a>
                            </li>
                           
                        </ul>
                    </li-->
               
                </ul>