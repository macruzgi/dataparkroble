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
										<i class="material-icons">settings</i> Aministraci&oacute;n
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i>Ajuste de Recarga
                                </li>
                </ol>
            </div>
<div class="card">
                        <div class="header">
                            <h2>
                              AJUSTE DE RECARGA
                            </h2>
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
								
                                <i class="material-icons">verified_user</i><strong>MENSAJE: </strong>
                    </div>
					
                        </div>
						
						
						
						

                        <div class="body">
                            <form id="frmAjustarRecarga">
							<div class="row clearfix">
							
                                <div class="col-md-4">
                                    <p>
                                        <b># DE TARJETA O NOMBRE DE LA CUENTA</b>
                                    </p>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <i class="material-icons">credit_card</i>
                                        </span>
                                       <div class="form-line">
											<input type="text" id="buscar_tarjeta" name="buscar_tarjeta" class="form-control" placeholder="Digite el No. de Tarjeta o Nombre de la Cuenta" autocomplete="off"  required>
											 
											 
											 <input type="hidden" id="card_number" name="card_number" class="form-control" placeholder="tarjeta" required readOnly>
											 <input type="hidden" id="account_number" name="account_number" class="form-control" placeholder="Numero de cuenta" required readOnly>
											 
											  <input type="hidden" id="intMediaType" name="intMediaType" class="form-control" placeholder="intMediaType" required readOnly >
											  <input type="hidden" id="intFacility" name="intFacility" class="form-control" placeholder="intFacility" required readOnly >
											  <input type="hidden" id="AccountBalance" name="AccountBalance" class="form-control" placeholder="AccountBalance" required readOnly >
												
											<input type="hidden" id="RecNo" name="RecNo" class="form-control" placeholder="RecNo" required readOnly >
											<input type="hidden" id="Amount" name="Amount" class="form-control" placeholder="Amount" required readOnly >
											<input type="hidden" id="numero_transaccion" name="numero_transaccion" class="form-control" placeholder="numero_transaccion" required readOnly >
										</div>
										<div>
											<div>
												<div class="listadosEmergentes" id="listadosEmergentes"></div>
											</div>
										</div>
                                    </div>
									<p>
                                        <b>VALOR DE LA RECARGA</b>
                                    </p>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <i class="material-icons">attach_money</i>
                                        </span>
                                       <div class="form-line">
											<input type="text" id="valorRealRecarga" name="valorRealRecarga" class="form-control" placeholder="Digite el nuevo valor de la Recarga" autocomplete="off"  required>
										</div>
										<div>
											<div>
												<div class="listadosEmergentes" id="listadosEmergentes"></div>
											</div>
										</div>
                                    </div>

                                </div>
								
								<div class="col-md-8">
									<!--p>
                                        <b>B&Uacute;SQUE LA TARJETA CORRECTA A RECARGAR</b>
                                    </p>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <i class="material-icons">credit_card</i>
                                        </span>
                                        <div class="form-line">
                                          <input type="text" id="buscar_tarjeta" name="buscar_tarjeta" class="form-control" placeholder="Digite el No. de Tarjeta o Nombre de la Cuenta" autocomplete="off"  required disabled >
											 <input type="text" id="card_number" name="card_number" class="form-control" placeholder="tarjeta" required readOnly >
											 <input type="text" id="account_number" name="account_number" class="form-control" placeholder="Numero de cuenta" required readOnly >
											 
											  <input type="text" id="intMediaType" name="intMediaType" class="form-control" placeholder="intMediaType" required readOnly >
											  <input type="text" id="intFacility" name="intFacility" class="form-control" placeholder="intFacility" required readOnly >
											  <input type="text" id="AccountBalance" name="AccountBalance" class="form-control" placeholder="AccountBalance" required readOnly >
											
                                        </div>
										<div class="listadosEmergentes" id="listadosEmergentes"></div>
                                    </div-->
                                    <table class="table table-striped" id="tblResumen">
										<thead>
											<tr>
												 <th colspan="2">
													<div class="alert bg-brown">
														<strong>Resumen de la &Uacute;LTIMA transacci&oacute;n</strong> 
													</div>
												 </th>
													
											</tr>
											
										</thead>
										<tbody>
										 
										</tbody>
									</table>
										<div class="loader" style="text-align:center;display:none;" id="loadTransaccion">
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
											<p style="color:#e1483f;text-align:center;font-weight: bold;">Espere por favor...</p>
											
										</div>
										<!--aqui se muestra el mensaje de que no hay resultados-->
										<div id="msjNoHayReesultados" style="color:#e1483f;text-align:center;font-weight: bold;display:none;">
												<i class="material-icons">assignment_late</i>
										</div>
                                </div>
                                
                            </div>
                          
                               <br>
								<button type="button" class="btn bg-brown waves-effect" id="btnConsultar">
                                    <i class="material-icons">format_list_numbered</i>
                                    <span>CONSULTAR</span>
                                </button>
								<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
                                    <i class="material-icons">verified_user</i>
                                    <span>AJUSTAR REGARGA</span>
                                </button>&nbsp;
								<button type="button" class="btn bg-red waves-effect" id="btnLimpiar">
                                    <i class="material-icons">clear</i>
                                    <span>LIMPIAR</span>
                                </button>
                            </form>
							
							
							
                        </div>
                    </div>
	<!-- Modal que se levanta para mostrar el monto anterior y actual -->
	<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Est&aacute; apunto de ajustar la recarga, tome en cuenta que este proceso es irreversible, ¿desea continuar?</h4>
							
							<div class="body" id="msjErrorModal" style="color:#f44336;font-weight: bold;display:none;">
								  <!--AQUI SE MOSTRARAN LOS ERRORES-->
							</div>
                        </div>
						
						
							
						
						
                        <div class="modal-body">
                             <!-- aqui mostrare el balance anterior y despues de la cuenta -->
							<table class="table table-striped" id="tblResumen">
                                <thead>
									<tr>
										 <th colspan="3">
											<div class="alert alert-success">
												<strong>Resumen de la &Uacute;LTIMA transacci&oacute;n</strong> 
											</div>
										 </th>
											
                                    </tr>
									
                                </thead>
                                <tbody>
                                 
                                </tbody>
							</table>
                        </div>
                        <div class="modal-footer">
								<button type="button" id="btnAjustarRecarga" class="btn btn-success waves-effect">
                                    <i class="material-icons">verified_user</i>
                                    <span>S&iacute;</span>
                                </button>&nbsp;
								
								<button type="button" class="btn bg-red waves-effect" data-dismiss="modal">
                                    <i class="material-icons">clear</i>
                                    <span>NO</span>
                                </button>
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
<script>
//dsactivo el btnEnviar
$('#btnEnviar').prop('disabled', true);
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


$( "#frmAjustarRecarga" ).validate({
  rules: {
    buscar_tarjeta: {
      required: true
		},
	valorRealRecarga:{
			required: true,
			number: true,
			min:0.50
		},
	card_number:{
			required: true,
			number: true
		},
	account_number:{
			required: true
		},
	intMediaType:{
			required: true,
			number: true
		},
	intFacility:{
			required: true,
			number: true
		},
	AccountBalance:{
			required: true,
			number: true
		}
  },
  messages: {
				buscar_tarjeta:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				valorRealRecarga:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos",
							min:"Por favor, digite un valor mayor o igual a {0}"
						},
				card_number:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				account_number:{
							required:"Este valor es requerido"
						},		
				intMediaType:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				intFacility:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				AccountBalance:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						}
			},
			
		submitHandler: function(form){
			//muestro la modal del los datos de la transaccion
			$("#defaultModal").modal('show');
           
        }
			
});

//proceso para consultar los movimientos de las tarjetas
$("#btnConsultar").click(function(){
  if($("#buscar_tarjeta").val() == ""){
	  return;
  }
             /////*******PROCESO PARA buscar REGISTROS
						
								$.ajax({ 
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/BuscarUltimaRecargaDeTarjeta",
									data:$("#frmAjustarRecarga").serialize(),
									dataType: 'json',//espero un json,
									beforeSend: function(){
										$("#loadTransaccion").show();
									},
									success:function(data)
										{
											$("#loadTransaccion").hide();
											if(data.respuesta == 2)
												{
													//oculto la tabla de resultado de la busqueda de transaccion por si ya se habia buscado 
													$("#tblResumen tbody").empty();
													$('#msjNoHayReesultados').empty();
													//agrego el error
													$('#msjNoHayReesultados').append(data.mensaje);
													//muestro el contenido de los errores
													$("#msjNoHayReesultados").show();
													$('input[type="text"]').val('');
												}
											else
												{
													
													//console.log(data.mensaje);
													//oclulto el contenido de los errores
													$("#msjError").hide();
													$("#msjNoHayReesultados").hide();
													$("#tblResumen tbody").empty();
												    $("#tblResumen tbody").append("<tr><th style='text-align:right'>ID</th><th style=text-align:right>"+data.ID+"</th></tr><tr><th style='text-align:right'>N&uacute;mero de la Factura o Transacci&oacute;n:</th><th style='text-align:right'>"+data.FacturaTrasaccion+"</th></tr><tr><th style='text-align:right'>N&uacute;mero de Cuenta</th><th style='text-align:right'>"+data.NumeroCuenta+"</th></tr><tr><th style='text-align:right'>N&uacute;mero de Tarjeta:</th><th style='text-align:right'>"+data.NumeroTarjeta+"</th></tr><tr><th style='text-align:right'>Monto recargado $:</th><th style='text-align:right'>"+data.Monto+"</th></tr><tr><th style='text-align:right'>Fecha de la transacci&oacute;n:</th><th style='text-align:right'>"+data.FECHA+"</th></tr><tr><th style='text-align:right'>Usuario:</th><th style='text-align:right'>"+data.Vendedor+"</th></tr>");	
													//lleno los campos a necesitar
													$("#RecNo").val(data.ID);
													$("#Amount").val(data.Monto);
													$("#account_number").val(data.NumeroCuenta);
													$("#numero_transaccion").val(data.FacturaTrasaccion);
													//desbloqueo el btnEnviar
													$('#btnEnviar').prop('disabled', false);
												}
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
       
			

			
});
//proceso ajustar la recarga
$("#btnAjustarRecarga").click(function(){
	  /////*******PROCESO PARA INGREGRESAR REGISTROS
					$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/AjustarRecarga",
									data:$("#frmAjustarRecarga").serialize(),
									dataType: 'json',//espero un json
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											$("#cargando").hide();
											//alert(data);
											if(data == 0)//no hay resultados
											{
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data);
												//muestro el contenido de los errores
												$("#msjError").show();
												
											}
											else if (data.respuesta== 1)
											{
												//limpio las textbox
												$('input[type="text"]').val('');
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$('#msjExito').append(data.mensaje);
												$("#msjExito").show();
												//oculto la modal del los datos de la transaccion
												$("#defaultModal").modal('hide');
												
												setTimeout(function() {
														 
														 location.reload();
													}, 3700);
											}
											else if(data.respuesta == 2)//la cantida digitado es mayor a la de la recarga realizada
											{
												$("#msjErrorModal").empty();//limpio los erores
												//agrego los errores
												$('#msjErrorModal').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjErrorModal").show();
												
											}
											else
											{
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
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
});
//proceso para limpiar las cajas de texto
$("#btnLimpiar").click(function(){
	$("#tblResumen tbody").empty();
	$('input[type="text"]').val('');
	//dsactivo el btnEnviar
	$('#btnEnviar').prop('disabled', true);
});
 </script>