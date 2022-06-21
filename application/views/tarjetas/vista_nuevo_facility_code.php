 <div class="block-header">
                <!--h2>
                    RECARGAR TARJETA
                    <small>Cart Management/<a>Recargas</a></small>
                </h2-->
				<ol class="breadcrumb">
                                <li>
                                    <a href="javascript:void(0);">
                                        <i class="material-icons">home</i> Inicio
                                    </a>
                                </li>
                                <li>
									<a href="javascript:void(0);">
										<i class="material-icons">assignment</i>Card Manager
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i>Facility Code
                                </li>
                </ol>
            </div>
             
				
                <div class="col-xs-12 col-sm-9">
                    <div class="card">
                        <div class="body">
						 
                            <div>
							<div class="header">
                            <h2>
                              AGREGAR FACILITY CODE
                            </h2>
							</div>
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
                                 <div class="body">
                                    <div role="tabpanel" class="tab-pane fade in active" id="profile_settings">
                                        <form class="form-horizontal" id="frmAgregar">
                                             <div class="input-group">
                                                <label for="Email" class="col-sm-2 control-label">Facility Code</label>
                                                <div class="col-sm-6">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="intFacility" name="intFacility" placeholder="Digite el Facility Code" autocomplete="off" required>
                                                    </div>
                                                </div>
                                            </div>
											<div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                     <br>
													<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
														<i class="material-icons">verified_user</i>
														<span>PROCESAR</span>
													</button>
                                                </div>
                                            </div>
										</form>
                                    </div>
                                   
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
 <!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>
	<!-- Jquery Validation Plugin Css -->
    <script src="<?php echo base_url(); ?>plugins/jquery-validation/jquery.validate.js"></script>
	<script src="<?php echo base_url(); ?>plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
<script>
$("#frmAgregar").validate({ 
  rules: {
	intFacility:{
			required: true,
			number:true
		}
  },
  messages: {
				intFacility:{
							required:"Este valor es requerido",
							number:"Este valor debe ser num&eacute;rico"
						}
			},
			
		submitHandler: function(form){
             /////*******PROCESO PARA actualizar datos
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/RegistrarFacilityCode",
									data:$("#frmAgregar").serialize(),
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											$("#cargando").hide();	
											//alert(data);
											if (data== 1)
											{
												
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												setTimeout(function() {
														 
														 location.reload();
													}, 3500);
											}
											else
											{
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data);
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

///formulario para procesar las credenciales

$( "#frmCredenciales" ).validate({ 
  rules: {
	clave_usuario:{
			required: true,
			maxlength:50,
			minlength:5
		},
    clave_usuarioV: {
			required: true
		},
	clave_usuarioC: {
			required: true,
			equalTo: "#clave_usuario"
		}
  },
  messages: {
				clave_usuario:{
							required:"Este valor es requerido",
							maxlength:"El m&aacute;ximo de caracteres perminidos es {0}",
							minlength:"El m&iacute;nimo de caracteres perminidos es {0}"
						},
				clave_usuarioV:{
							required:"Este valor es requerido"
						},
				clave_usuarioC:{
							required:"Este valor es requerido",
							equalTo:"La contrase&ntilde;a no coincide"
						}
			},
			
		submitHandler: function(form){
             /////*******PROCESO PARA actualizar datos
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/ActualizarCredencialesUsuario",
									data:$("#frmCredenciales").serialize(),
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											$("#cargando").hide();	
											//alert(data);
											if (data== 1)
											{
												
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												setTimeout(function() {
														 
														 location.reload();
													}, 3500);
											}
											else
											{
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data);
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
 </script>

   