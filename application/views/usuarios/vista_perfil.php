<div class="col-xs-12 col-sm-3">
                    <div class="card profile-card">
                        <div class="profile-header">&nbsp;</div>
                        <div class="profile-body">
                            <div class="image-area">
                                <img src="<?php echo base_url(); ?>images/CEPA_Logo.jpg" alt="CEPA" />
                            </div>
                            <div class="content-area">
                                <h3><?php echo $this->session->userdata("nombre_usuario"); ?></h3>
                                <p></p>
                                <p><?php echo $this->session->userdata("usuario"); ?></p>
                            </div>
                        </div>
                        <!--div class="profile-footer">
                            <ul>
                                <li>
                                    <span>Followers</span>
                                    <span>1.234</span>
                                </li>
                                <li>
                                    <span>Following</span>
                                    <span>1.201</span>
                                </li>
                                <li>
                                    <span>Friends</span>
                                    <span>14.252</span>
                                </li>
                            </ul>
                            <button class="btn btn-primary btn-lg waves-effect btn-block">FOLLOW</button>
                        </div-->
                    </div>

                   
                </div>
				
                <div class="col-xs-12 col-sm-9">
                    <div class="card">
                        <div class="body">
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
                            <div>
                                <ul class="nav nav-tabs" role="tablist">
                                  
                                    <li role="presentation" class="active"><a href="#profile_settings" aria-controls="settings" role="tab" data-toggle="tab">Configuraci&oacute;n del perfil</a></li>
                                    <li role="presentation"><a href="#change_password_settings" aria-controls="settings" role="tab" data-toggle="tab">Cambiar Contrase&ntilde;a</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="profile_settings">
                                        <form class="form-horizontal" id="frmDatos">
                                             <div class="input-group">
                                                <label for="Email" class="col-sm-2 control-label">Usuario</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="usuario" name="usuario" value="<?php echo $this->session->userdata("usuario"); ?>" readOnly>
                                                    </div>
                                                </div>
                                            </div>
											<div class="input-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Nombre</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" placeholder="Name Surname" value="<?php echo $this->session->userdata("nombre_usuario"); ?>" required>
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
                                    <div role="tabpanel" class="tab-pane fade in" id="change_password_settings">
                                        <form class="form-horizontal" id="frmCredenciales">
                                            <div class="input-group">
                                                <label for="OldPassword" class="col-sm-3 control-label">Contrase&ntilde;a Anterior</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="clave_usuarioV" name="clave_usuarioV" placeholder="Contrase&ntilde;a Anterior" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <label for="NewPassword" class="col-sm-3 control-label">Contrase&ntilde;a Nueva</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="clave_usuario" name="clave_usuario" placeholder="Contrase&ntilde;a Nueva" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-group">
                                                <label for="NewPasswordConfirm" class="col-sm-3 control-label">Contrase&ntilde;a Nueva (Confirme)</label>
                                                <div class="col-sm-9">
                                                    <div class="form-line">
                                                        <input type="password" class="form-control" id="clave_usuarioC" name="clave_usuarioC" placeholder="Contrase&ntilde;a Nueva (Confirme)" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                     <br>
													<button type="submit" id="btnEnviarCredenciales" class="btn btn-success waves-effect">
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
  $("#dui").inputmask("99999999-9", { "clearIncomplete": true });
  $("#Phone").inputmask("9999-9999", { "clearIncomplete": true });
  $("#Email").inputmask("email");
//proceso para buscar las tarjetas asincronamente
$("#buscar_tarjeta").keyup(function(){
   	
	//alert($("#buscar_tarjeta").val());
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/BusquedaInteractivaTarjetas/",
									data:{buscar_tarjeta:$("#buscar_tarjeta").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
										
										}
								});
});


$( "#frmDatos" ).validate({ 
  rules: {
	usuario:{
			required: true,
		},
    nombre_usuario: {
			required: true
		}
  },
  messages: {
				usuario:{
							required:"Este valor es requerido"
						},
				nombre_usuario:{
							required:"Este valor es requerido"
						}
			},
			
		submitHandler: function(form){
             /////*******PROCESO PARA actualizar datos
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Usuarios/ActualizarDatosUsuario",
									data:$("#frmDatos").serialize(),
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
			maxlength:10,
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

   