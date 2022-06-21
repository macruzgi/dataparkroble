<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Recargas Web | TAS</title>
    <!-- Favicon-->
    <link rel="icon" href="<?php echo base_url(); ?>favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="<?php echo base_url(); ?>plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="<?php echo base_url(); ?>plugins/animate-css/animate.css" rel="stylesheet" />
	
	 <!-- Bootstrap Select Css PARA EL ESTILO DE LOS SELECT -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
	
    <!-- Custom Css -->
    <link href="<?php echo base_url(); ?>css/style.css" rel="stylesheet">
</head>

<body class="login-page">
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
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Recargas<b>Web</b></a>
            <small>TAS - Tecnolog&iacute;a, Acceso y Seguridad</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in">
                    <div class="msg">Digite sus credenciales para iniciar sesi&oacute;n</div>
					<div class="alert alert-danger" id="msjError" style="display:none;">
                                <strong>ERROR:</strong> <span id="errores"></span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="usuario" placeholder="Usuario" required autofocus id="usuario">
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="clave" placeholder="Contrase&ntilde;a" required id="clave">
                        </div>
						
                    </div>
					<div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">home</i>
                        </span>
                        <div class="form-line">
                            <select class="form-control show-tick" id="id_sucursal" name="id_sucursal">
								<option value="">Elija un Centro Comercial</option>
									<?php
										foreach($TraerSucursales as $filasEncontradas):
									?>
								<option value="<?php echo  $filasEncontradas->id_sucursal;?>"><?php echo  $filasEncontradas->sucursal_nombre;?></option>
								<?php
									endforeach;
								?>
							</select>
                        </div>
						
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
							
							
								
							
                            <!--input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink"-->
                            
                        </div>
						
                        <div class="col-xs-4">
						
                            <button type="submit" class="btn btn-block bg-pink waves-effect" id="btnIniciar">Iniciar</button>
                        </div>
                    </div>
                    <!--div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                            <a href="sign-up.html">Register Now!</a>
                        </div>
                        <div class="col-xs-6 align-right">
                            <a href="forgot-password.html">Forgot Password?</a>
                        </div>
                    </div-->
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="<?php echo base_url(); ?>js/admin.js"></script>
    <script src="<?php echo base_url(); ?>js/pages/examples/sign-in.js"></script>


 <!-- js validar formularios -->

    <!-- Select Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-select/js/bootstrap-select.js"></script>
    <!-- Slimscroll Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- JQuery Steps Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery-steps/jquery.steps.js"></script>
    <!-- Sweet Alert Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/sweetalert/sweetalert.min.js"></script>
    <script src="<?php echo base_url(); ?>js/pages/forms/form-validation.js"></script>
    <!-- Demo Js -->
    <script src="<?php echo base_url(); ?>js/demo.js"></script>
	 <!-- fin js form validation -->

<script>
$("#sign_in").validate({
  rules: {
    clave: {
      required: true
		},
	usuario:{
			required: true,
		},
	id_sucursal:{
		required: true
	}
  },
  messages: {
				clave:{
							required:"Este valor es requerido"
						},
				usuario:{
							required:"Este valor es requerido"
						},
				id_sucursal:{
					required:"Este valor es requerido"
				}
			},
		submitHandler: function(form){


     /////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Datapark/IniciarSesion",
									data:$("#sign_in").serialize(),
									dataType: 'json',//espero un json
									success:function(data)
										{
											//alert(data);
											if (data.respuesta== 1)
											{
												$("#cargando").show();
												
												//hubo exito redirijo a la pagina inicio
												window.location.href="<?php echo base_url();?>Inicio/";
											}
											else if(data.respuesta == 0)//errores de validacion
											{
												//muestro la caja de error
												$("#msjError").show();
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
											}
											else if(data.respuesta == 2)//errores de validacion
											{
												//muestro la caja de error
												$("#msjError").show();
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
											}
											else //errores inesperados
											{
												//muestro la caja de error
												$("#msjError").show();
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
											}
										},
									error: function(result) {
														//errores inesperados
												//muestro la caja de error
												$("#msjError").show();
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
					}
			
	});
</script>
</body>

</html>