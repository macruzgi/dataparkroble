<style>
input[type="text"]:disabled {
  background: #f1efef;
}
small.required {
    color:#f00;
}
.input-group .bootstrap-select.form-control {
  z-index: inherit;
}
input[type=checkbox]
{
  /* Doble-tamaño Checkboxes */
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari y Chrome */
  -o-transform: scale(1.5); /* Opera */
  /*padding: 10px;*/
}
</style>

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
                                    <i class="material-icons"></i>Registro (Tarjeta)
                                </li>
                </ol>
            </div>
<div class="card">
                        <div class="header">
                            <h2>
                              REGISTRO DE TARJETA PARA CUENTAS EXISTENTES
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
                    <ul class="nav nav-tabs" role="tablist" id="pestanias">
                                 
                                    <li role="presentation" class="active"><a href="#datos_de_la_cuenta" aria-controls="settings" role="tab" data-toggle="tab"><strong>BUSCAR CUENTA</strong></a></li>
                                    <li role="presentation"><a href="#datos_tarjetas" aria-controls="settings" role="tab" data-toggle="tab"><strong>DATOS DE LA TARJETA</strong></a></li>
                    </ul>
					<form id="frmRegistro">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="datos_de_la_cuenta">
									
							<div class="row clearfix">
							<p>&nbsp;</p> 
                                <div class="col-md-6">
                                    <p>
                                        <b>NOMBRE O N&Uacute;MERO DE LA CUENTA</b>
                                    </p>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <i class="material-icons">search</i>
                                        </span>
                                       <div class="form-line">
											<input type="text" id="buscar_cuenta" name="buscar_cuenta" class="form-control" placeholder="Digite el No. o Nombre de la Cuenta" autocomplete="off"  required>
											 
											 <input type="hidden" id="AccountNumber" name="AccountNumber" class="form-control" placeholder="AccountNumber" required readOnly>
											 
											
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
								<div class="col-md-12">
                                    <table class="table table-striped" id="tblResumen">
										<thead>
										<tr>
												 <th colspan="5">
													<div class="alert bg-brown">
														<strong>Litado de Tarjetas</strong> 
													</div>
												 </th>
												</tr>
											<tr>
												
												<th>No. de Tarjeta</th>
												<!--th>Facilility Code</th-->
												<th>Fecha de Validez</th>
												<th>Cliente</th>
												<!--th>Auto-expirable</th-->
												<th>Cuenta</th>
												<th>Acci&oacute;n</th>
											</tr>
											
										</thead>
										<tbody>
										 
										</tbody>
									</table>
										<!--aqui se muestra el mensaje de que no hay resultados-->
										<div id="msjNoHayReesultados" style="color:#e1483f;text-align:center;font-weight: bold;display:none;">
												<i class="material-icons">assignment_late</i>
										</div>
                                </div>
                                
                            </div>
                          
                               <br>
								<button type="button" class="btn bg-red waves-effect" id="btnLimpiar">
                                    <i class="material-icons">clear</i>
                                    <span>LIMPIAR</span>
                                </button>
                           
							
							
							</div>
							<div role="tabpanel" class="tab-pane fade in" id="datos_tarjetas">
									
									<div class="row clearfix">
									<p>&nbsp;</p>
										<div class="col-md-4">
											<p>
												<b># DE TARJETA</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">credit_card</i>
												</span>
												<div class="form-line">
													<input type="text" id="CardNumber" name="CardNumber" class="form-control" placeholder="Digite el N&uacute;mero de Tarjeta" required autocomplete="off">
													 
													 <!--PARA EDITAR -->
													<input type="hidden" id="CardNumberEditar" name="CardNumberEditar" class="form-control" placeholder="CardNumberEditar" readOnly>
													<input type="hidden" id="FromDate" name="FromDate" class="form-control" placeholder="FromDate" readOnly>
													<input type="hidden" id="ES_COMUNITARIA" name="ES_COMUNITARIA" class="form-control" placeholder="ES_COMUNITARIA" readOnly>
													<!--FIN PAR EDITAR-->
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<p>
												<b>NOMBRE</b>
											</p>
											<div class="input-group input-group-lg">
												
												<div class="form-line">
													<input type="text" id="FirstName" name="FirstName" class="form-control" placeholder="Digite el Nombre" required autocomplete="off" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->FirstName;?>">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<p>
												<b>APELLIDO</b>
											</p>
											<div class="input-group input-group-lg">
											   
												<div class="form-line">
													<input type="text" id="LastName" name="LastName" class="form-control" placeholder="Digite el Apellido" required autocomplete="off" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->LastName;?>"> 
												</div>
											</div>
										</div>
										
									</div>
									<div class="row clearfix">
									
										<div class="col-md-4">
											<p>
												<b>DUI</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">card_membership</i>
												</span>
												<div class="form-line">
													<input type="text" id="dui" name="dui" class="form-control" placeholder="Digite el No. de DUI sin guiones" required>
												</div>
											</div>
										</div>
										<div class="col-md-4">
										   <p>
												<b>FACILITY CODE</b>
											</p>
											 <div class="input-group input-group-lg">
											 <span class="input-group-addon">
													<i class="material-icons">bookmark</i>
											   </span>
												<div class="form-line">
													 <select class="form-control show-tick" id="intFacility" name="intFacility">	<option value="">Seleccione una opci&oacute;n</option>
														<?php 
															foreach($TaerFacilityCodeActivos as $facilityCodeEncontrados):
														?>
														<option value="<?php echo $facilityCodeEncontrados->intFacility;?>"><?php echo $facilityCodeEncontrados->intFacility;?></option>
														<?php 
															endforeach;
														?>
													 </select>
												</div>
											</div>
										</div>
										<div class="col-md-4">
										   <p>
												<b>FECHA DE VENCIMIENTO</b>(Si procediera)
											</p>
											 <div class="input-group input-group-lg">
											 <span class="input-group-addon">
													<i class="material-icons">date_range</i>
											   </span>
												<div class="form-line" id="bs_datepicker_container">
														<input type="text" name="ToDate" id="ToDate" class="form-control" placeholder="Ejemplo: 30-07-2019" autocomplete="off">
												 </div>
											</div>
										</div>
										<!--div class="col-md-4">
										   <p>
												<b>NOMENCLATURA DE LA CUENTA</b>
											</p>
											 <div class="input-group">
											 <span class="input-group-addon">
													<i class="material-icons"></i>
											   </span>
											   <div class="form-line">
													 <select class="form-control show-tick" id="tipo_tarjeta" name="tipo_tarjeta">
														<option value="">Seleccione una opci&oacute;n</option>
														<option value="PR">PR-Proximidad Recargable</option>
														<option value="PM">PM-Proximidad Mensual</option>
														<option value="PC">PC-Proximidad Contrato</option>
														<option value="MR">MR-Magn&eacute;tica Recargable (tickete recargable)</option>
													</select>
												</div>
											</div>
										</div-->
										
									</div>
									
									<div class="row clearfix">
																			
										<div class="col-md-4">
											<p>
												<b>TIME ZONE</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons"></i>
												</span>
												<div class="form-line">
													<!--input type="text" id="intTimeZone" name="intTimeZone" class="form-control" placeholder="Digite el Time Zone" required -->
													<select class="form-control show-tick" id="intTimeZone" name="intTimeZone">
														<option value="">Seleccione una opci&oacute;n</option>
														<?php
															foreach($TraerTimesZones as $filasEncontradas):
														?>
														<option value="<?php echo  $filasEncontradas->intTimeZoneID;?>"><?php echo  $filasEncontradas->intTimeZoneID;?></option>
														<?php
															endforeach;
														?>
													</select>
												</div>
											</div>
										</div>
									   <div class="col-md-4">
											<p>
												<b>ACCESS LEVEL</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons"></i>
												</span>
												<div class="form-line">
													<input type="text" id="intAccessLevel" name="intAccessLevel" class="form-control" placeholder="Digite el Access Level" required autocomplete="off">
												</div>
											</div>
										</div>
										
									</div>
									<div class="header">
										<h2>
											TIPO DE TARJETA
										</h2>
										
									</div>
									<div class="row clearfix">
										<p>&nbsp;</p>
										<div class="col-md-4">
										   <p>
												<b>TYPE</b>
											</p>
											 <div class="input-group input-group-lg">
											 <span class="input-group-addon">
													<i class="material-icons"></i>
											   </span>
												 <div class="form-line">
													 <select class="form-control show-tick" id="UsageCard" name="UsageCard">
														<option value="">Seleccione una opci&oacute;n</option>
														<option value="0">Monthly</option>
														<option value="3">Debit</option>
													</select>
													
													
												</div>
											</div>
										</div>
										
											<div class="col-md-4">
												<p>
													<b>&nbsp;</b>
												</p>
												<div class="input-group input-group-lg">
													<span class="input-group-addon">
														<i class="material-icons"></i>
													</span>
													<div class="form-line">
														<select class="form-control show-tick" id="CardSubtype" name="CardSubtype" disabled>
															<option value="">Seleccione una opci&oacute;n</option>
															<option value="1">Multiusage</option>
															<option value="2">Multiusage FixedE</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<p>
													<b>RATE</b>
												</p>
												<div class="input-group input-group-lg">
													<span class="input-group-addon">
														<i class="material-icons"></i>
													</span>
													<div class="form-line">
														<select class="form-control show-tick" id="Rate" name="Rate" disabled>
															<option value="">Seleccione el Rate</option>
															<option value="A">A</option>
															<option value="B">B</option>
															<option value="C">C</option>
															<option value="D">D</option>
															<option value="E">E</option>
															<option value="F">F</option>
															<option value="G">G</option>
															<option value="H">H</option>
															<option value="I">I</option>
															<option value="J">J</option>
															<option value="K">K</option>
															<option value="L">L</option>
															<option value="M">M</option>
															<option value="N">N</option>
															<option value="O">O</option>
															<option value="P">P</option>
															<option value="Q">Q</option>
															<option value="R">R</option>
															<option value="S">S</option>
															<option value="T">T</option>
															<option value="U">U</option>
															<option value="V">V</option>
															<option value="W">W</option>
															<option value="X">X</option>
															<option value="Y">Y</option>
															<option value="Z">Z</option>
														</select>
													</div>
												</div>
											</div>
									</div>
									<div class="row clearfix">
										<div class="col-md-4">
											<p>
												<b>MEDIA</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons"></i>
												</span>
												<div class="form-line">
													 <select class="form-control show-tick" id="intMediaType" name="intMediaType">
														<option value="">Seleccione una opci&oacute;n</option>
														<option value="4">Proximity</option>
														<option value="2">Magstripe</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<p>
												<b>VIP</b>(Si se marca esta opci&oacute;n el ACCESS LEVEL ser&aacute; 32)
											</p>
											
												
												<div class="form-line">
													 <input type="checkbox" id="VIP" name="VIP" class="filled-in chk-col-black" value="1" />
												</div>
										
										</div>
										
									</div>
									<div class="row clearfix">
										<div class="col-md-6" id="divtblSucursales" style="display:none;">
											<p>
												<b>SELECCIONE LOS CENTROS COMERCIALES</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons"></i>
												</span>
												<div class="form-line">
													<div class="table-responsive"> 
											
														<table class="table table-striped " id="tblSucursales">
															<thead>
																<tr>
																	<th>ID</th>
																	<th>Centro Comercial</th>
																	<th><input type="checkbox" id="checkAllCC">&nbsp;&nbsp;&nbsp;
																	<button type="button" class="btn bg-green btn-xs waves-effect" data-trigger="focus" data-container="body" data-toggle="popover" data-placement="top" title="" data-content="Debe seleccionar cualesquiera de los Centros Comerciales para que la tarjeta sea v&aacute;lida en los mismos" data-original-title="Ayuda">
																		?
																		</button></th>
																</tr>
															</thead>
															<tbody>
															
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										
									</div>
									<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
										<i class="material-icons">verified_user</i>
										<span>PROCESAR</span>
									</button>
									<button type="button" class="btn bg-red waves-effect" id="btnCancelar">
										<i class="material-icons">cancel</i>
										<span>CANCELAR</span>
									</button>
							</div>
						</div>
							
					</form>
	
							
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
	 <!-- Bootstrap Datepicker Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!--Idiomas del dataPiker-->
	<script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>
	<script src="<?php echo base_url(); ?>plugins/sweetalert/sweetalert.min.js"></script>
<script>
$("#dui").inputmask("99999999-9", { "clearIncomplete": true });
    //Date
   //$('#ToDate').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
$('#ToDate').datepicker({
        autoclose: true,
        container: '#bs_datepicker_container',
		format: 'dd-mm-yyyy',
		//rtl: true,
		language:"es",
		 todayBtn: "linked",
		todayHighlight: true
}); 
//onchange para habiitar o desavilitar la fecha de vencimiento
$("#tipo_tarjeta").change(function() {
  //alert( this.value );
  if(this.value == "PC" || this.value == "PM"){
	  $('#ToDate').prop('disabled', false);
  }
  else{
	   $("#ToDate").prop('disabled', true);
	   $("#ToDate").val('');
  }
});
//onchange para habiitar o desavilitar los usage card de la tarjeta y el rate
$("#UsageCard").change(function() {
	//alert( this.value );
  //si he seleccionado dibit
  if(this.value == 3){
	  //quito disabled de los select pero estos select son button con bootstrap asi que los manipulo atraves del tipo de elemento y el data-id y le remuevo la clase disabled y a continuacion habilito el select verdadero
	  $("button[data-id='CardSubtype']").removeClass("disabled");
	  $("#CardSubtype").prop("disabled", false);
	  $("button[data-id='Rate']").removeClass("disabled");
	  $("#Rate").prop("disabled", false);
  }
  else{
	    //deshabilito los select respectivos
	  $("button[data-id='CardSubtype']").addClass("disabled");
	  $("#CardSubtype").prop("disabled", true);
	  $("button[data-id='Rate']").addClass("disabled");
	  $("#Rate").prop("disabled", true);
	  $('#CardSubtype option[value=""]').prop('selected', 'selected').change();
	  $('#Rate option[value=""]').prop('selected', 'selected').change();
  }
});
//proceso para buscar las tarjetas asincronamente
$("#buscar_cuenta").keyup(function(){
   	
	//alert($("#buscar_tarjeta").val());
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Cuentas/BusquedaInteractivaCuentas/",
									data:{buscar_cuenta:$("#buscar_cuenta").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
										
										}
								});
});


$("#frmRegistro").validate({
ignore: [],//par ver las tab como un solo formulario
  rules: {
	buscar_cuenta:{
		required: true
	},
	AccountNumber:{
		required: true
	},
    CardNumber: {
      required: true,
	  number: true
		},
	FirstName:{
			required: true,
			maxlength: 16
		},
	LastName:{
			required: true,
			maxlength: 16
		},
	dui:{
			required: true
		},
	intFacility:{
			required: true,
			number: true
		},
	/*tipo_tarjeta:{
			required: true
		},
	ToDate:{
		required: true
	},*/
	intTimeZone:{
		required: true,
		number: true
	},
	intAccessLevel:{
		required: true,
		number:true,
		min:0,
		max:63
	},
	UsageCard:{
		required: true,
		number: true
	},
	CardSubtype:{
		required: true,
		number: true
	},
	Rate:{
		required: true
	},
	intMediaType:{
		required: true,
		number: true
	}
  },
  messages: {
				buscar_cuenta:{
					required:"Este valor es requerido"
				},
				AccountNumber:{
							required:"Este valor es requerido",
						},
				CardNumber:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				FirstName:{
							required:"Este valor es requerido",
							maxlength:"M&aacute;ximo de caracteres {0}"
						},
				LastName:{
							required:"Este valor es requerido",
							maxlength:"M&aacute;ximo de caracteres {0}"
						},
				dui:{
							required:"Este valor es requerido"
					},
				intFacility:{
							required:"Este valor es requerido",
							number:"Solo se aceptan valores num&eacute;ricos"
						},
				/*tipo_tarjeta:{
							required:"Este valor es requerido"
						},
				ToDate:{
							required:"Este valor es requerido"
					},*/
				
				intTimeZone:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
				},
				intAccessLevel:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico",
							min:"Por favor, digite un valor mayor o igual a {0}",
							max:"Por favor, digite un valor menor o igual a {0}"
				},
				UsageCard:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
				},
				CardSubtype:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
				},
				Rate:{
							required:"Este valor es requerido"
				},
				intMediaType:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
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
			
			//muestro loading
			$("#cargando").show();
			//si es para agregar nueva tarjeta la CardNumberEditar debe estar vacia
			if($("#CardNumberEditar").val() == ""){
						$.ajax({ 
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/RegistrarTarjeta",
									data:$("#frmRegistro").serialize(),
									dataType: 'json',//espero un json,
									beforeSend: function(){
										//$("#loadTransaccion").show();
									},
									success:function(data)
										{
											//alert("hola");
											$("#cargando").hide();	
											if (data == 1)
											{
												
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												setTimeout(function() {
														 
														 location.reload();
													}, 3500);
											}
											else if (data.respuesta == 2)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data.respuesta== 4)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
												
												$('#ToDate').prop('disabled', false);

											}
											else if (data.respuesta== 5){
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
												
											}
											else if(data.respuesta == 0)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
										}
								});
							/////*******FIN DEL PROCESO PARA INGREGRESAR REGISTROS
			}
			else{
				//es para editar los datos de la tarjeta
				$.ajax({ 
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/ModificarTarjeta",
									data:$("#frmRegistro").serialize(),
									dataType: 'json',//espero un json,
									beforeSend: function(){
										//$("#loadTransaccion").show();
									},
									success:function(data)
										{
											//alert("hola");
											$("#cargando").hide();	
											if (data == 1)
											{
												
												//hubo exito, oculto los errores, muestro los exitos y reload
												$("#msjError").hide();
												$("#msjExito").show();
												setTimeout(function() {
														 
														 location.reload();
													}, 3500);
											}
											else if (data.respuesta == 2)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data.respuesta== 4)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje + $("#FromDate").val());
												//muestro el contenido de los errores
												$("#msjError").show();
												
												$('#ToDate').prop('disabled', false);

											}
											else if (data.respuesta== 5){
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
												
											}
											else if(data.respuesta == 0)
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
							/////*******FIN DEL PROCESO PARA EDITAR REGISTROS
			}
        }
			
});
//funcion para editar trae los datos de la tarjeta que se llama desde la vista resultado_independiente_busqueda_cuentas
function EditarTarjeta(p_CardNumber, p_intMediaType, p_intFacility, p_NOMBRE_TIPO_TARJETA){
	//alert(p_CardNumber + " " + p_intMediaType + " " +  p_intFacility);
	/////*******PROCESO PARA buscar REGISTROS
	//si la tarjeta no ha sido creada en esta web no puede editarse aqui
    
	
	if(p_NOMBRE_TIPO_TARJETA =="NO")
	{
		$("#errores").empty();//limpio los erores
		//agrego los errores
		$('#errores').append("Esta tarjeta no ha sido registrada desde el sistema Recargas WEB, no puede ser modificada desde este formulario.  Solicite ayuda a un administrador");
		//muestro el contenido de los errores
		$("#msjError").show();
		return;
	}
	
								$.ajax({ 
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/TraerDatosDeTarjetaParaEditar",
									data:{CardNumber:p_CardNumber, intMediaType:p_intMediaType, intFacility:p_intFacility, AccountNumber:$("#AccountNumber").val()},
									dataType: 'json',//espero un json,
									beforeSend: function(){
										//$("#loadTransaccion").show();
									},
									success:function(data)
										{
											if(data.respuesta == 0){
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append(data.mensaje);
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else{
												//pongo en readonly el textbox CardNumber y le pongo el fondo difernte color
												$('#CardNumber').prop('readOnly', true);
												$('#CardNumber').css('background-color' , '#f1efef');
												//activo la pestaña de los datos de la tarjeta
												$('#pestanias a[href="#datos_tarjetas"]').tab('show');
												//agrego los valores taridos a las cajas de texto de la pestaña agregar tarjeta
												$("#CardNumberEditar").val(data.mensaje.CardNumber);
												$("#FromDate").val(data.mensaje.FromDate);
												$("#CardNumber").val(data.mensaje.CardNumber);
												$("#FirstName").val(data.mensaje.FirstName);
												$("#LastName").val(data.mensaje.LastName);
												$("#dui").val(data.mensaje.DUI);
												//recorro el select del intFacility para compara con el valor traido de al DB y asi ponerlo en selcted 
												$("#intFacility option").each(function(){
												   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
													if(data.mensaje.intFacility  == $(this).attr('value')){
														//alert("cohincide");
														$('#intFacility option[value='+data.mensaje.intFacility+']').prop('selected', 'selected').change();
													}
												});
												/*recorro el select del tipo_tarjeta para compara con el valor traido de al DB y asi ponerlo en selcted 
												$("#tipo_tarjeta option").each(function(){
												   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
													if(data.mensaje.TIPO_TARJETA  == $(this).attr('value')){
														//alert("cohincide");
														$('#tipo_tarjeta option[value='+data.mensaje.TIPO_TARJETA+']').prop('selected', 'selected').change();
													}
												});
												*/
												//recorro el select del intTimeZone para comparar con el valor traido de al DB y asi ponerlo en selcted 
												$("#intTimeZone option").each(function(){
												   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
													if(data.mensaje.intTimeZone  == $(this).attr('value')){
														//alert("cohincide");
														$('#intTimeZone option[value='+data.mensaje.intTimeZone+']').prop('selected', 'selected').change();
													}
												});
												//recorro el select del intAccessLevel para comparar con el valor traido de al DB y asi ponerlo en selcted 
												$("#intAccessLevel option").each(function(){
												   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
													if(data.mensaje.intAccessLevel  == $(this).attr('value')){
														//alert("cohincide");
														$('#intAccessLevel option[value='+data.mensaje.intAccessLevel+']').prop('selected', 'selected').change();
													}
												});
												
												////validando la fecha ToDate si es que la tarjeta es autoexpirable AutoExpire = 1
												if(data.mensaje.AutoExpire == 1){
													 $("#ToDate").val(data.mensaje.ToDate);
													 //$('#ToDate').prop('disabled', false);
												}
												else{
													 $("#ToDate").val('');
													 //$('#ToDate').prop('disabled', true);
												}
												
												$("#intAccessLevel").val(data.mensaje.intAccessLevel);
												//recorro el select del intAccessLevel para comparar con el valor traido de al DB y asi ponerlo en selcted 
												$("#UsageCard option").each(function(){
													   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
														if(data.mensaje.UsageCard  == $(this).attr('value')){
															//alert("cohincide");
															$('#UsageCard option[value='+data.mensaje.UsageCard+']').prop('selected', 'selected').change();
														}
													});
												//si UsageCard =3 = Debit que ponga valores en los select de CardSubtype y Rate
												if(data.mensaje.UsageCard == 3){
													//recorro el select del CardSubtype para comparar con el valor traido de al DB y asi ponerlo en selcted 
													$("#CardSubtype option").each(function(){
														   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
															if(data.mensaje.CardSubtype  == $(this).attr('value')){
																//alert("cohincide");
																$('#CardSubtype option[value='+data.mensaje.CardSubtype+']').prop('selected', 'selected').change();
															}
														});
													//recorro el select del Rate para comparar con el valor traido de al DB y asi ponerlo en selcted 
													$("#Rate option").each(function(){
														   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
															if(data.mensaje.Rate  == $(this).attr('value')){
																//alert("cohincide");
																$('#Rate option[value='+ data.mensaje.Rate +']').prop('selected', 'selected').change();
															}
														});
												}		
												//recorro el select del intMediaType para comparar con el valor traido de al DB y asi ponerlo en selcted 
												$("#intMediaType option").each(function(){
													   //alert('opcion '+$(this).text()+' valor '+ $(this).attr('value'))
														if(data.mensaje.intMediaType  == $(this).attr('value')){
															//alert("cohincide");
															$('#intMediaType option[value='+data.mensaje.intMediaType+']').prop('selected', 'selected').change();
														}
													});
													
													//compureba si la tarjeta es VIP
													if(data.mensaje.VIP == 1 || data.mensaje.intAccessLevel == 32){
														$('#VIP').prop('checked', true);
													}
													//valido si UsageCard es 3= Debit y habilito los select respectivos
													if(data.mensaje.UsageCard == 3){
														 //quito disabled de los select pero estos select son button con bootstrap asi que los manipulo atraves del tipo de elemento y el data-id y le remuevo la clase disabled y a continuacion habilito el select verdadero
														  $("button[data-id='CardSubtype']").removeClass("disabled");
														  $("#CardSubtype").prop("disabled", false);
														  $("button[data-id='Rate']").removeClass("disabled");
														  $("#Rate").prop("disabled", false);
													}
													else{
														//deshabilito los select respectivos
														  $("button[data-id='CardSubtype']").addClass("disabled");
														  $("#CardSubtype").prop("disabled", true);
														  $("button[data-id='Rate']").addClass("disabled");
														  $("#Rate").prop("disabled", true);
														  $('#CardSubtype option[value=""]').prop('selected', 'selected').change();
														  $('#Rate option[value=""]').prop('selected', 'selected').change();
													}
												//si la cuenta es comunitaria que muestre la tabla de los centros comerciales, y que marque o desmarque los que sean necesarios segun esten validos o no
												if(data.tblSucursales == 1){
													$("#divtblSucursales").show();
													$("#ES_COMUNITARIA").val("CU");
												}
												else{
													$("#divtblSucursales").hide();
													//$("#ES_COMUNITARIA").val("");
												}
												
												//muestro y recorro las sucursales marcadas con lsmCard con valor inValid marcado o desmarcado segun corresponda el caso, esto solo sera cundo las tarjetas sean multisitios
												$("#tblSucursales").find('td').remove();
												$.each(data.lsmCard, function (key, valor) // indice, valor
													{
																
														$('#tblSucursales tbody').append("<tr><td>" + valor.id_sucursal + "</td><td>"  + valor.sucursal_nombre+"</td><td>"
														+"<input class='second' type='checkbox' name='id_sucursal[]' id='id_sucursal' value='"+valor.id_sucursal +"'"+ valor.ESTADO_VALID +"></td></tr>");
																				
													});
											}
										}
								});
							/////*******FIN DEL PROCESO PARA buscar REGISTROS
}

//proceso para limpiar las cajas de texto
$("#btnLimpiar").click(function(){
	$("#tblResumen tbody").empty();
	$('input[type="text"]').val('');
	//pongo los select a Seleccione una opcion
	$('select option[value=""]').prop('selected', 'selected').change();
	//deshabilito la textbox ToDate
	//$('#ToDate').prop('disabled', true);
	//habilito el textbox CardNumber y la vuelvo a su color original
	$('#CardNumber').prop('readOnly', false);
	$('#CardNumber').css('background-color' , '#ffffff');
	//desmarco el checkbox VIP si es que esta chequeado
	$('#VIP').prop('checked', false);
	//oculto el mensaje msjNoHayReesultados si es que se puso visible
	$("#msjNoHayReesultados").hide();
	//deshabilito los select respectivos
	$("button[data-id='CardSubtype']").addClass("disabled");
	$("#CardSubtype").prop("disabled", true);
	$("button[data-id='Rate']").addClass("disabled");
	$("#Rate").prop("disabled", true);
	$('#CardSubtype option[value=""]').prop('selected', 'selected').change();
	$('#Rate option[value=""]').prop('selected', 'selected').change();
	$("#errores").empty();//limpio los erores
	$("#msjError").hide();//oculto
});
//proceso para limpiar las cajas de texto excluir algunas
$("#btnCancelar").click(function(){
	//NOTA: al dar clic en cancelar que se recargue el frm ya que si no se hace asi hay muchas validaciones que son complejas para ejecutarse y me salgo con return;
	window.location.href="<?php echo base_url();?>Tarjetas/VistaRegistrarTarjeta";
	return;
	$('#CardNumber').val('');
	$('#CardNumberEditar').val('');
	$('#FirstName').val('');
	$('#LastName').val('');
	$('#dui').val('');
	$('#ToDate').val('');
	$('#intAccessLevel').val('');
	//pongo los select a Seleccione a la opcion ='Selecione una opcion'
	$('select option[value=""]').prop('selected', 'selected').change();
	//deshabilito la textbox ToDate
	//$('#ToDate').prop('disabled', true);
	//habilito el textbox CardNumber y la vuelvo a su color original
	$('#CardNumber').prop('readOnly', false);
	$('#CardNumber').css('background-color' , '#ffffff');
	//desmarco el checkbox VIP si es que esta chequeado
	$('#VIP').prop('checked', false);
	//deshabilito los select respectivos
	$("button[data-id='CardSubtype']").addClass("disabled");
	$("#CardSubtype").prop("disabled", true);
	$("button[data-id='Rate']").addClass("disabled");
	$("#Rate").prop("disabled", true);
	$('#CardSubtype option[value=""]').prop('selected', 'selected').change();
	$('#Rate option[value=""]').prop('selected', 'selected').change();
	$("#divtblSucursales").hide();
	//$('#ES_COMUNITARIA').val('');
});
$('#checkAllCC').click(function(event) {
  if (this.checked) {
    $(':checkbox').prop('checked', true);
  } else {
    $(':checkbox').prop('checked', false);
  }
});
function DeshabilitarTarjeta(p_CardNumber, p_intMediaType, p_intFacility) {
    swal({
        title: "Deshabilitar Tarjeta",
        text: "Se DESHABILITARÁ la tarjeta No.: " + p_CardNumber + ". ¿Desea continuar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "SÍ, proceder",
		cancelButtonText: "Cancelar",
        closeOnConfirm: false
    }, function () {
					//si doy clic en proceder desactivo el suario
						$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/Desactivar_Tarjeta",
									data:{CardNumber:p_CardNumber, intMediaType:p_intMediaType, intFacility:p_intFacility},
									dataType: 'json',//espero un json
									success:function(data)
										{
											if (data.respuesta == 1)
											{
												
												swal("¡ÉXITO!", "la Tarjeta: "+p_CardNumber+" Se ha deshabilitado", "success");
												
												setTimeout(function () {
													location.reload();
												}, 2000);
																					}
											else
											{
												swal("Errores Generales", data.mensaje, "error");
											}
										},
									error:function(resultdo)
										{
											swal("Errores al Generar", "Hubieron errores inesperados, consulte con un administrador", "error");
										}
								});
        //
    });
}
 </script>