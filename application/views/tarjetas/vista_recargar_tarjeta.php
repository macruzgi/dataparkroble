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
										<i class="material-icons">assignment</i> Card Manager
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i> Recargas
                                </li>
                </ol>
            </div>
<div class="card">
                        <div class="header">
                            <h2>
                              RECARGAR TARJETA
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
								
                                <i class="material-icons">verified_user</i><strong>Datos almacenados correctamente</strong>
                    </div>
					
                        </div>
                        <div class="body">
                            <form id="frmRecargarTarjeta">
							<div class="row clearfix">
								<div class="col-sm-6">
									<label for="email_address">B&uacute;sque la Tarjeta a recargar</label>
									<div class="input-group input-group-lg">
										<div class="form-line">
											<input type="text" id="buscar_tarjeta" name="buscar_tarjeta" class="form-control" placeholder="Digite el No. de Tarjeta o Nombre de la Cuenta" autocomplete="off"  required>
											 <input type="hidden" id="card_number" name="card_number" class="form-control" placeholder="tarjeta" required readOnly>
											 <input type="hidden" id="account_number" name="account_number" class="form-control" placeholder="Numero de cuenta" required readOnly>
											 
											  <input type="hidden" id="intMediaType" name="intMediaType" class="form-control" placeholder="intMediaType" required readOnly >
											  <input type="hidden" id="intFacility" name="intFacility" class="form-control" placeholder="intFacility" required readOnly >
											  <input type="hidden" id="AccountBalance" name="AccountBalance" class="form-control" placeholder="AccountBalance" required readOnly >
												
										</div>
										<div>
											<div>
												<div class="listadosEmergentes" id="listadosEmergentes"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
								
							<div class="row clearfix">
                                <div class="col-sm-4">
									 <label for="password">Valor a recargar</label>
                                    <div class="input-group input-group-lg">
                                        <div class="form-line">
                                           	
														<input type="text" name="valor_recarga" class="form-control" placeholder="Digite el monto a recargar" required autocomplete="off">
													
													
                                        </div>
                                    </div>
                                </div>
                           
                                <div class="col-sm-4">
									 <label for="password">Factura o transacci&oacute;n</label>
                                    <div class="input-group input-group-lg">
                                        <div class="form-line">
                                            <input type="text" id="factura" name="factura" class="form-control"  placeholder="Digite el n&uacute;mero de factura o transaci&oacute;n" required autocomplete="off" />
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                               
								
                             
                               
                                <br>
								<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
                                    <i class="material-icons">verified_user</i>
                                    <span>PROCESAR</span>
                                </button>&nbsp;
								<button type="button" class="btn bg-brown waves-effect" id="btnConsultar">
                                    <i class="material-icons">format_list_numbered</i>
                                    <span>CONSULTAR</span>
                                </button>
								<button type="button" class="btn bg-red waves-effect" id="btnLimpiar">
                                    <i class="material-icons">clear</i>
                                    <span>LIMPIAR</span>
                                </button>
                                <!--button type="submit" id="btnEnviar" class="btn bg-pink m-t-15 waves-effect">Procesar</button-->
								
                            </form>
							
							<div class="body table-responsive">
								
                            <table class="table table-striped" id="tblPayment" style="display:none;">
                                <thead>
									<tr>
										 <th colspan="5">
											<div class="alert bg-brown" id="fulanito">
												<strong></strong> 
											</div>
										 </th>
											
                                    </tr>
                                        <th>Fecha</th>
                                        <th>Monto</th>
                                        <th>M&eacute;todo Pago</th>
                                        <th>Factura</th>
										<th>Usuario</th>
                                    </tr>
                                </thead>
								<tfoot>
                                        
                                 </tfoot>
                                <tbody>
                                  
                                </tbody>
                            </table>
                        </div>
							
                        </div>
                    </div>
				
	<!-- Modal que se levanta para mostrar el monto anterior y actual -->
	<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Recarga realizada</h4>
                        </div>
                        <div class="modal-body">
                             <!-- aqui mostrare el balance anterior y despues de la cuenta -->
							<table class="table table-striped" id="tblResumen">
                                <thead>
									<tr>
										 <th colspan="3">
											<div class="alert alert-success">
												<strong>Resumen de la transacci&oacute;n</strong> 
											</div>
										 </th>
											
                                    </tr>
									
                                </thead>
                                <tbody>
                                 
                                </tbody>
							</table>
                        </div>
                        <div class="modal-footer">
                            <!--button type="button" class="btn btn-link waves-effect">SAVE CHANGES</button-->
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CERRAR</button>
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


$( "#frmRecargarTarjeta" ).validate({
  rules: {
    valor_recarga: {
      required: true,
      number: true,
	  min:0.50
		},
	buscar_tarjeta:{
			required: true
		},
	factura:{
			required: true
		},
	card_number:{
			required: true
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
				valor_recarga:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos",
							min:"Por favor, digite un valor mayor o igual a {0}"
						},
				buscar_tarjeta:{
							required:"Este valor es requerido"
						},
				factura:{
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
             /////*******PROCESO PARA INGREGRESAR REGISTROS
					$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/RecargarTarjeta/",
									data:$("#frmRecargarTarjeta").serialize(),
									dataType: 'json',//espero un json
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											$("#cargando").hide();
											//alert(data);
											if (data.respuesta== 1)
											{
												//limpio las textbox
												$('input[type="text"]').val('');
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												//muestro la modal del los datos de la transaccion
												$("#defaultModal").modal('show');
												//agrego datos a la tabla de la modal de la transaccion
												$("#tblResumen tbody").append("<tr><th style='text-align:right'>Saldo Anterior $</th><th style=text-align:right>"+data.AccountBalance+"</th></tr><tr><th style='text-align:right'>Recarga Realizada $</th><th style='text-align:right'>"+data.Recarga+"</th></tr><tr><th style='text-align:right'>Saldo Actual $</th><th style='text-align:right'>"+data.NuevoBalance+"</th></tr>");
												setTimeout(function() {
														 
														 location.reload();
													}, 3700);
											}
											else if(data.respuesta == 0)//errores de validadcion
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
        }
			
});

//proceso para consultar los movimientos de las tarjetas
$("#btnConsultar").click(function(){
	//varibale para mostar solo dos decimales
	var num		= 0.0;
	var total 	= "";
	
             /////*******PROCESO PARA INGREGRESAR REGISTROS
						
								$.ajax({ 
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/BuscarMovimientosTarjeta/",
									data:$("#frmRecargarTarjeta").serialize(),
									dataType: 'json',//espero un json,
									success:function(data)
										{
											if(data.respuesta == 0)
												{
													$("#errores").empty();//limpio los erores
													//agrego los errores
													$('#errores').append(data.mensaje);
													//muestro el contenido de los errores
													$("#msjError").show();
												}
											else
												{
													//oclulto el contenido de los errores
													$("#msjError").hide();											
													$("#tblPayment").show();
													$("#tblPayment").find('td').remove();
													$("#fulanito").empty();
																		
																		//$("#fulanito").append(data[0].NOMBRE);
																		
													$.each(data, function (key, valor) // indice, valor
																{
																num = valor.Amount;
																$('#tblPayment tbody').append("<tr><td>"+ valor.PaymentDate + "</td><td>" + num.toString().match(/^-?\d+(?:\.\d{0,2})?/)[0] + "</td><td>" + valor.PaymentMethod + "</td><td>"+ valor.FACTURA + "</td><td>" + valor.Payer+ "</td></tr>");
																				
																});
													if(Object.keys(data).length > 0){
														total = data[0].AccountBalance;
														$('#tblPayment tfoot').append("<tr><td><b>Balance GRAL. Actual de la CUENTA: </b></td><td><b>" + total.slice(0,-2) + "</b></td><td colspan=3></td></tr>");
													}
													//$('#fulanito').append(data[0].AccountNumber + "-" + data[0].AccountName + ", "+data[0].FirstName +" "+ data[0].LastName + data[0].AccountNumber);
													$("#fulanito").append("&Uacute;ltimos 5 movimientos m&aacute;s recientes " + $("#buscar_tarjeta").val());
													//limpio las textbx ya que si no se limpian cuando muestro la modal da datos erroneos ya que se toma el AccountBalance de la caja de texto
													$('input[type="text"]').val('');
												}
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
       
			

			
});
//proceso para limpiar las cajas de texto
$("#btnLimpiar").click(function(){
	$("#tblPayment").hide();
	$('input[type="text"]').val('');
	$('input[type="hidden"]').val('');
});
 </script>