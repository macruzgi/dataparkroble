<style type="text/css">
input[type=checkbox]
{
  /* Doble-tamaño Checkboxes */
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari y Chrome */
  -o-transform: scale(1.5); /* Opera */
  /*padding: 10px;*/
}
small.required {
    color:#f00;
}
</style>
<div class="block-header">
                <!--h2>
                    CUENTAS
                    <small>Cart Management/<a>Cuentas</a></small>
                </h2-->
				<ol class="breadcrumb">
                                <li>
                                    <a href="javascript:void(0);">
                                        <i class="material-icons">home</i> Inicio
                                    </a>
                                </li>
                                <li>
									<a href="javascript:void(0);">
										<i class="material-icons">vpn_key</i>Accesos
									</a>
                                </li>
								<li>
									<a href="javascript:void(0);">
										<i class="material-icons"></i>Listado de Usuarios
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i>Asignar Permisos
                                </li>
                </ol>
            </div>
 <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               ASIGNAR PERMISOS AL USUARIO: <strong><?php echo @$TraerOpcionesDelMenu[0]->usuario;?></strong>
                            </h2>
                           
                        </div>
						
                        <div class="body">
						<div class="row clearfix">
						<div class="card" style="display:none;" id="msjError">
								<div class="header bg-red">
									<h2>
										Errores al generar <small>Hay datos que son obligatorios, verfique por favor</small>
									</h2>
									<ul class="header-dropdown m-r--5">
										<li class="dropdown">
																			   
										</li>
									</ul>
								</div>
								<div class="body" id="errores" style="color:#f44336;font-weight: bold;">
									 <!--AQUI SE MOSTRARAN LOS ERRORES-->
								</div>
						</div>
						<div class="alert alert-success" style="display:none;" id="msjExito">
							<i class="material-icons">verified_user</i><strong>Datos almacenados correctamente</strong>
                        </div>
						<ul class="nav nav-tabs" role="tablist" id="pestanias">
                                 
                                    <li role="presentation" class="active"><a href="#datos_de_la_cuenta" aria-controls="settings" role="tab" data-toggle="tab"><i class="material-icons">lock_open</i><strong>Asignar Permisos</strong></a></li>
                                    <li role="presentation"><a href="#datos_tarjetas" aria-controls="settings" role="tab" data-toggle="tab"><i class="material-icons">home</i><strong>Asignar Centros Comerciales</strong></a></li>
						</ul>
						<form id="frmAsignarPermisos">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="datos_de_la_cuenta">
								 <div class="col-md-10">
									<div class="table-responsive"> 
											<!--button type="button" class="btn bg-brown" id="rePDF">
											<i class="material-icons">format_list_bulleted</i>
												<span>Exp. PDF</span>
											</button>&nbsp;&nbsp;
											<button type="button" class="btn bg-brown" id="reEXCEL">
												 <i class="material-icons">format_list_numbered</i>
												 <span>Exp. Excel</span>
											</button-->
										<table class="table table-hover" id="tblCuentas">
											<thead>
												<tr>
													<th>M&oacute;dulo</th>
													<th>Opci&oacute;n</th>
													<th>Descripci&oacute;n</th>
													<th><input type="checkbox"  id="checkAll"></th>
												</tr>
											</thead>
											<tbody>
											   <?php
													$banderaModulo = 0;
													foreach($TraerOpcionesDelMenu as $ocionesPermisosEncontradas):
													if($banderaModulo != $ocionesPermisosEncontradas->id_modulo){
												?>
													<tr>
														<td colspan="4" class="alert bg-brown"><strong><?php echo $ocionesPermisosEncontradas->nombre_modulo;?></strong></td>
													</tr>
													
													   <?php
															$banderaModulo = $ocionesPermisosEncontradas->id_modulo;
															foreach($TraerOpcionesDelMenu as $opcionesEcnontradas):
																$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
																if($banderaModuloOPcion == $opcionesEcnontradas->id_modulo && $banderaModulo == $banderaModuloOPcion){
																	$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
														?>
																		<tr>
																			<td></td>
																			<td><?php echo $opcionesEcnontradas->nombre_opcion;?></td>	
																			<td><?php echo $opcionesEcnontradas->descripcion_menu_opcion;?></td>
																			<td>
																				<input class="premisos" type="checkbox" name ="id_modulo_opcion[]" id="id_modulo_opcion" value="<?php echo $opcionesEcnontradas->id_modulo_opcion;?>"
																					<?php 
																						if($opcionesEcnontradas->TIENE_PERMISO == 1){
																							echo "checked";
																							}
																					?>> 
																				
																			</td>
																		</tr>											
													   <?php
																}
																else{
																	$banderaModuloOPcion = $opcionesEcnontradas->id_modulo;
																}
															endforeach;
														$banderaModulo = $ocionesPermisosEncontradas->id_modulo;
													}
														endforeach;
													?>
											</tbody>
										</table>
									</div>
									<input type ="hidden" name ="id_usuario" id="id_usuario" value ="<?php echo $this->uri->segment(3,0);?>">
									
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade in" id="datos_tarjetas">
								<div class="col-md-10">
									<div class="table-responsive"> 
											<!--button type="button" class="btn bg-brown" id="rePDF">
											<i class="material-icons">format_list_bulleted</i>
												<span>Exp. PDF</span>
											</button>&nbsp;&nbsp;
											<button type="button" class="btn bg-brown" id="reEXCEL">
												 <i class="material-icons">format_list_numbered</i>
												 <span>Exp. Excel</span>
											</button-->
										<table class="table table-striped " id="tblCuentas">
											<thead>
												<tr>
													<th>ID</th>
													<th>Centro Comercial</th>
													<th><input type="checkbox"  id="checkAllCC">&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn bg-green btn-xs waves-effect" data-trigger="focus" data-container="body" data-toggle="popover" data-placement="top" title="" data-content="Debe seleccionar cualesquiera de los Centros Comerciales para dar acceso al usario  <?php echo @$TraerSucursalesAsigandasaUsuario[0]->USUARIO;?>" data-original-title="Ayuda">
														?
														</button></th>
												</tr>
											</thead>
											<tbody>
												<?php foreach($TraerSucursalesAsigandasaUsuario as $filasEncontradas):
												?>
												<tr>
												<td><?php echo $filasEncontradas->id_sucursal;?></td>
												<td><?php echo $filasEncontradas->sucursal_nombre;?></td>
												<td><input class="second" type="checkbox" name ="id_sucursal[]" id="id_sucursal" value="<?php echo $filasEncontradas->id_sucursal;?>"
													<?php if ($filasEncontradas->id_usuario != NULL){ echo "checked";}?>
												></td>
												</tr>
												<?php endforeach;?>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
								<div class="col-md-10">
								<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
											<i class="material-icons">verified_user</i>
											<span>PROCESAR</span>
										</button>
								</div>
						</form>
					
						</div>
                        </div>
                    </div>
                </div>
            </div>
<!-- Page Loader -->
    <div class="page-loader-wrapper" style="display:none" id="cargando">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Espere por favor...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
            <!-- #END# Exportable Table -->
			<!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>
	<!-- Jquery Validation Plugin Css -->
    <script src="<?php echo base_url(); ?>plugins/jquery-validation/jquery.validate.js"></script>
	<!--para los toltip-->
	<script src="<?php echo base_url(); ?>js/pages/ui/tooltips-popovers.js"></script>
<script>
$("#frmAsignarPermisos").validate({
  ignore: [],//par ver las tab como un solo formulario	
  rules: {
	id_usuario:{
			required: true
		},
    "id_modulo_opcion[]": {
			required: true
		},
    "id_sucursal[]": {
			required: true
		}
  },
  messages: {
				id_usuario:{
							required:"<span style='color:red'>Este valor es requerido</span>"
						},
				"id_modulo_opcion[]":{
							required:"<span style='color:red'>Este valor es requerido</span>"
						},
				"id_sucursal[]":{
							required:"<span style='color:red'>Este valor es requerido</span>"
						}
			},
		invalidHandler: function() {
			//valido todas las tab
            setTimeout(function() {
                $('.nav-tabs a small.required').remove();
                var validatePane = $('.tab-content .tab-pane:has(input.error)').each(function() {
                    var id = $(this).attr('id');
                    $('.nav-tabs').find('a[href^="#' + id + '"]').append(' <small class="required"><b>***</b></small>');
                });
            });            
        },	
		submitHandler: function(form){
             /////*******PROCESO PARA INGREGRESAR REGISTROS
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/AsignarPermisos",
									data:$("#frmAsignarPermisos").serialize(),
									dataType: 'json',//espero un json
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											$("#cargando").hide();	
											//alert(data);
											if (data.respuesta== 0){
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data.respuesta== 1)
											{
												
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												setTimeout(function() {
														 
														 location.reload();
													}, 3500);
											}
											else if (data.respuesta== 2)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else 
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
												$('#errores').append("Errores desconocidos, solicite ayuda a un administrador.");
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											
										},
									error: function(result) {
										
												$("#cargando").hide();
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append("Hubieron ERRORES inesperados, informe a un administrador.");
												//muestro el contenido de los errores
												$("#msjError").show();
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
        }
			
});

 $('#checkAll').click(function(event) {
	$(".premisos").prop("checked", $("#checkAll").prop("checked"))
});
$("#checkAllCC").click(function() {
	$(".second").prop("checked", $("#checkAllCC").prop("checked"))
});

</script>