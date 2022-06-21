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

input[type="text"]:disabled {
  background: #dddddd;
}
small.required {
    color:#f00;
}
.input-group .bootstrap-select.form-control {
  z-index: inherit;
}
</style>
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
                                    <i class="material-icons"></i> Registro
                                </li>
                </ol>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                REGISTRO (NUEVA TARJETA)
								<small> <i class="material-icons col-amber">donut_large</i><b>Tome en cuenta que al registrar la tarjeta se registrar&aacute; la cuenta autom&aacute;ticamente</b>
								<br><i class="material-icons col-amber">donut_large</i>En este formulario al editar solo podr&aacute; editar los datos de la CUENTA</small>
                            </h2>
                            
                        </div>
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
                            <!--h2 class="card-inside-title">
                                Different Sizes
                                <small>You can use the <code>.input-group-sm, .input-group-lg</code> classes for sizing.</small>
                            </h2-->
							<ul class="nav nav-tabs" role="tablist">
                                  
                                    <li role="presentation" class="active"><a href="#datos_de_la_cuenta" aria-controls="settings" role="tab" data-toggle="tab"><strong>DATOS DE LA CUENTA</strong></a></li>
                                    <li role="presentation"><a href="#datos_tarjetas" aria-controls="settings" role="tab" data-toggle="tab"><strong>DATOS DE LA TARJETA</strong></a></li>
                            </ul>
					<form id="frmRegistro">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="datos_de_la_cuenta">
									<div class="row clearfix">
										<p>&nbsp;</p> 
											<div class="col-md-6">
												<p>
													<b>B&Uacute;SQUE UNA CUENTA PARA EDITAR</b>
												</p>
												<div class="input-group input-group-lg">
													<span class="input-group-addon">
														<i class="material-icons">search</i>
													</span>
												   <div class="form-line">
														<input type="text" id="buscar_cuenta" name="buscar_cuenta" class="form-control" placeholder="Digite el No. o Nombre de la Cuenta" autocomplete="off">
														 
														 <input type="hidden" id="AccountNumberEditar" name="AccountNumberEditar" class="form-control" placeholder="AccountNumberEditar" readOnly>
														 
														
													</div>
													<div>
														<div>
															<div class="listadosEmergentes" id="listadosEmergentes"></div>
														</div>
													</div>
												</div>
												
											</div>
									</div>
									<div class="header">
										<h2>
											O REGISTRE UNA NUEVA CUENTA
										</h2>
										
									</div>
									<div class="row clearfix">
										<p>&nbsp;</p>
										<div class="col-md-4">
											<p>
												<b># DE CUENTA</b>
												<button type="button" class="btn bg-green btn-xs waves-effect" data-trigger="focus" data-container="body" data-toggle="popover" data-placement="top" title="" data-content="Este campo de texto se habilitar&aacute; si la cuenta NO ES RECARGABLE" data-original-title="Ayuda">
																		?
																		</button>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">account_box</i>
												</span>
												<div class="form-line">
													<input type="text" id="AccountNumber" name="AccountNumber" class="form-control" placeholder="Digite el No. de la Cuenta" autocomplete="off" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->CardNumber;?>" <?php if(isset($TaerDatosCuentaSeleccionada)){?>readOnly <?php }?> readOnly style="background: #dddddd;">										 
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<p>
												<b>NOMBRE DE LA CUENTA</b>
											</p>
											<div class="input-group input-group-lg">
												
												<div class="form-line">
													<input type="text" id="AccountName" name="AccountName" class="form-control" placeholder="Digite el Nombre de la Cuenta" required autocomplete="off" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->FirstName;?>">
												</div>
											</div>
										</div>										
									</div>
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
													<input type="text" id="CardNumber" name="CardNumber" class="form-control" placeholder="Digite el N&uacute;mero de Tarjeta" required autocomplete="off" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->CardNumber;?>" <?php if(isset($TaerDatosCuentaSeleccionada)){?>readOnly <?php }?>>
													 <input type="hidden" id="ID" name="ID" placeholder="ID" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->ID;?>" autocomplete="off" readOnly>
													 <input type="hidden" id="AccountNumber_" name="AccountNumber_" placeholder="AccountNumber_" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->AccountNumber;?>" autocomplete="off" readOnly>
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
													<input type="text" id="dui" name="dui" class="form-control" placeholder="Digite el No. de DUI sin guiones" required value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->Fax;?>">
												</div>
											</div>
										</div>
									   <div class="col-md-4">
											<p>
												<b>E-MAIL</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">mail</i>
												</span>
												<div class="form-line">
													<input type="text" id="Email" name="Email" class="form-control" placeholder="Ejem: ejemplo@ejemplo.com" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->Email;?>">
												</div>
											</div>
										</div>
										<div class="col-md-4">
										   <p>
												<b># CELULAR</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">phone_android</i>
												</span>
												<div class="form-line">
													<input type="text" id="Phone" name="Phone" class="form-control" placeholder="Digite No. de Celular" value="<?php if(isset($TaerDatosCuentaSeleccionada)) echo $TaerDatosCuentaSeleccionada->Phone;?>">
												</div>
											</div>
										</div>
									</div>
									<div class="row clearfix">
										
										<div class="col-md-4">
										   <p>
												<b>FACILITY CODE</b>
											</p>
											 <div class="input-group input-group-lg">
											 <span class="input-group-addon">
													<i class="material-icons">bookmark</i>
											   </span>
												<div class="form-line">
													 <select class="form-control" id="intFacility" name="intFacility"
														<?php if(isset($TaerDatosCuentaSeleccionada)){?>disabled <?php }?>>
														<option value="<?php if(isset($TaerDatosCuentaSeleccionada)){ echo $TaerDatosCuentaSeleccionada->intFacility;} else { echo "";}?>"><?php if(isset($TaerDatosCuentaSeleccionada)){ echo $TaerDatosCuentaSeleccionada->intFacility;} else { echo "Seleccione una opci&oacute;n";}?></option>
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
												<b>NOMENCLATURA DE LA CUENTA</b>
											</p>
											 <div class="input-group input-group-lg">
											 <span class="input-group-addon">
													<i class="material-icons"></i>
											   </span>
											   <div class="form-line">
													 <select class="form-control" id="tipo_tarjeta" name="tipo_tarjeta"<?php if(isset($TaerDatosCuentaSeleccionada)){?>disabled <?php }?>>
														<option value="<?php if(isset($TaerDatosCuentaSeleccionada)){ echo $TaerDatosCuentaSeleccionada->tipo_tarjeta;} else { echo "";}?>"><?php if(isset($TaerDatosCuentaSeleccionada)){ echo $TaerDatosCuentaSeleccionada->NOMBRE_TIPO_TARJETA;} else { echo "Seleccione una opci&oacute;n";}?></option>
														<option value="PR">PR-Proximidad Recargable</option>
														<option value="PM">PM-Proximidad Mensual</option>
														<option value="PC">PC-Proximidad Contrato</option>
														<option value="MR">MR-Magn&eacute;tica Recargable (tickete recargable)</option>
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
														<input type="text" name="ToDate" id="ToDate" class="form-control" placeholder="Ejemplo: 30-07-2016" 
															value="<?php if(isset($TaerDatosCuentaSeleccionada)){ if($TaerDatosCuentaSeleccionada->ToDate != NULL) {echo date("d-m-Y", strtotime($TaerDatosCuentaSeleccionada->ToDate));} else { echo "";}} ?>"
															<?php
																	/*if(isset($TaerDatosCuentaSeleccionada)){
																		if($TaerDatosCuentaSeleccionada->tipo_tarjeta != 'PC'){
																			?>
																			  disabled
																			<?php
																		}
																	}*/
															?> autocomplete="off">
												 </div>
											</div>
										</div>
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
													<select class="form-control" id="intTimeZone" name="intTimeZone">
														<option>Seleccione una opci&oacute;n</option>
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
										<div class="col-md-4">
											
										</div>
									</div>
									<div class="row clearfix">
										<div class="col-md-4" id="selectSucursales" style="display:block;">
											<p>
												<b>CENTRO COMERCIAL EXCLUSIVO</b>
												<button type="button" class="btn bg-green btn-xs waves-effect" data-trigger="focus" data-container="body" data-toggle="popover" data-placement="top" title="" data-content="Si la cuenta y tarjeta es recargable NO seleccione ning&uacute;n Centro Comercial.
												Si la cuenta y tarjeta son exclusivas para un Centro Comercial elija uno de la lista.
												Si la cuenta y tarjeta ser&aacute;n usadas en varios Centros Comerciales, elija la opci&oacute;n MULTI-SITIO y se mostrar&aacute;n los Centro Comerciales disponibles, marque los que sean necesarios." data-original-title="Ayuda">
																		?
												</button>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons">home</i>
												</span>
											   <div class="form-line">
													 <select class="form-control show-tick" id="id_sucursal_exclusiva" name="id_sucursal_exclusiva">
														<option value="-9">RECARGABLE</option>
														<option value="multi">MULTI-SITIO</option>
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
											
										</div>
										<div class="col-md-6" id="tblSucursales" style="display:none;">
											<p>
												<b>SELECCIONE LOS CENTROS COMERCIALES</b>
											</p>
											<div class="input-group input-group-lg">
												<span class="input-group-addon">
													<i class="material-icons"></i>
												</span>
												<div class="form-line">
													<div class="table-responsive"> 
											
														<table class="table table-striped " id="tblCuentas">
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
															<!--tr>
																<td>1</td>
																<td>CENTRAL</td>
																<td><input class="second" type="checkbox" name="id_sucursal[]" id="id_sucursal" value="1" readonly="readonly" checked="checked">
																</td>
															</tr-->
																<?php
																	foreach($TraerSucursales as $filasEncontradas):
																?>
																<tr>
																	<td><?php echo  $filasEncontradas->id_sucursal;?></td>
																	<td><?php echo  $filasEncontradas->sucursal_nombre;?></td>
																	<td><input class="second" type="checkbox" name="id_sucursal[]" id="id_sucursal" value="<?php echo  $filasEncontradas->id_sucursal;?>"  >
																	</td>
																</tr>
																<?php endforeach;?>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
							<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
								<i class="material-icons">verified_user</i>
								<span>PROCESAR</span>
							</button>
							<button type="button" class="btn bg-red waves-effect" id="btnLimpiar">
                                    <i class="material-icons">clear</i>
                                    <span>LIMPIAR</span>
                            </button>
					</form>
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
	 <!-- Bootstrap Datepicker Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!--Idiomas del dataPiker-->
	<script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>

<script>
  $("#dui").inputmask("99999999-9", { "clearIncomplete": true });
  $("#Phone").inputmask("9999-9999", { "clearIncomplete": true });
  $("#Email").inputmask("email");
  
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
/*
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
*/
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
function PonerDisabled(p_boleano){
	$('#CardNumber').prop('disabled', p_boleano);
	$('#FirstName').prop('disabled', p_boleano);
	$('#LastName').prop('disabled', p_boleano);
	$('#dui').prop('disabled', p_boleano);
	$('#intFacility').prop('disabled', p_boleano);
	$('#tipo_tarjeta').prop('disabled', p_boleano);
	//$('#ToDate').prop('disabled', p_boleano);
	$('#intTimeZone').prop('disabled', p_boleano);
	$('#intAccessLevel').prop('disabled', p_boleano);
} 
function DeshabiliarSelect(p_HabilitarDeshabilitar){
if(p_HabilitarDeshabilitar == "DES"){
	//deshabilito los select respectivos
	$("button[data-id='CardSubtype']").addClass("disabled");
	$("#CardSubtype").prop("disabled", true);
	$("button[data-id='Rate']").addClass("disabled");
	$("#Rate").prop("disabled", true);
	$("button[data-id='UsageCard']").addClass("disabled");
	$("#UsageCard").prop("disabled", true);
	$("button[data-id='intMediaType']").addClass("disabled");
	$("#intMediaType").prop("disabled", true);
	$("#VIP").prop("disabled", true);
	$("#ToDate").prop("disabled", true);
	$("#ToDate").val("");
	$("button[data-id='id_sucursal_exclusiva']").addClass("disabled");
	$("#id_sucursal_exclusiva").prop("disabled", true);
	$('#id_sucursal_exclusiva option[value=""]').prop('selected', 'selected').change();
	$("#tblSucursales").hide();
	//$('#CardSubtype option[value=""]').prop('selected', 'selected').change();
	//$('#Rate option[value=""]').prop('selected', 'selected').change();
}
else{
	//habilito los seleccec
	$("button[data-id='UsageCard']").removeClass("disabled");
	$("#UsageCard").prop("disabled", false);
	$('#UsageCard option[value=""]').prop('selected', 'selected').change();
	$("button[data-id='intMediaType']").removeClass("disabled");
	$("#intMediaType").prop("disabled", false);
	$('#intMediaType option[value=""]').prop('selected', 'selected').change();
	$("button[data-id='id_sucursal_exclusiva']").removeClass("disabled");
	$("#id_sucursal_exclusiva").prop("disabled", false);
	$('#id_sucursal_exclusiva option[value=""]').prop('selected', 'selected').change();
	$("#VIP").prop("disabled", false);
	$("#ToDate").prop("disabled", false);
	}
}

//proceso para buscar las tarjetas asincronamente
$("#buscar_cuenta").keyup(function(){
   	 
	//alert($("#buscar_tarjeta").val());
							$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Cuentas/BusquedaInteractivaCuentasEditar/",
									data:{buscar_cuenta:$("#buscar_cuenta").val()},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											//$("#fulanito").append(data[0].NOMBRE);
											$("#listadosEmergentes").html(data);
										
										}
								});
});
//onchange para mostrar u ocultar la opcion del centro comercial
$("#id_sucursal_exclusiva").change(function() {
  //alert( this.value );
  if(this.value == "multi"){
	  $("#tblSucursales").show();
	 // $("#selectSucursales").hide();
  }
  else{
	 $("#tblSucursales").hide();
	// $("#selectSucursales").show();
  }
  //para bloquear y desbloquera el campo AccountNumber si la cuenta no es recargable P
  if(this.value != "-9"){
	  $('#AccountNumber').css('background-color' , '#ffffff');
	  $("#AccountNumber").attr("readonly", false);
  }
  else{
	   $("#AccountNumber").attr('readOnly', true);
	   $('#AccountNumber').css('background-color' , '#dddddd');
	   $("#AccountNumber").val('');
  }
});
//cuando marcho el checbox de seleccionar todas
$("#checkAllCC").click(function() {
	$(".second").prop("checked", $("#checkAllCC").prop("checked"))
});
$( "#frmRegistro" ).validate({ 
ignore: [],//par ver las tab como un solo formulario
  rules: {
	CardNumber:{
			required: true,
			number: true
		},
    FirstName: {
			required: true,
			maxlength:16
		},
	LastName:{
			required: true,
			maxlength:16
		},
	dui:{
			required: true
		},
	Email:{
			email: true
		},
	intFacility:{
			required: true,
			number: true
	},
	tipo_tarjeta:{
			required: true
	},
	/*ToDate:{
		required: true
	},*/
	AccountName:{
		required: true
	}/*,
	AccountNumber:{
		required: true
		//number: true
	}*/,
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
				CardNumber:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
						},
				FirstName:{
							required:"Este valor es requerido",
							maxlength:"El m&aacute;ximo de caracteres es de {0}"
						},
				LastName:{
							required:"Este valor es requerido",
							maxlength:"El m&aacute;ximo de caracteres es de {0}"
						},
				dui:{
							required:"Este valor es requerido"
						},
				Email:{
							email:"La direcci&oacute;n debe ser v&aacute;lida"
					 },
				intFacility:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
				},
				tipo_tarjeta:{
							required:"Este valor es requerido"
				},/*
				ToDate:{
					required:"Elija una fecha"
				},*/
				AccountName:{
							required:"Este valor es requerido"
				}/*,
				AccountNumber:{
							required:"Este valor es requerido",
							number:"El valor debe ser num&eacute;rico"
				}*/,
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
			//si el textbox AccountNumberEditar esta vacio es nuevo registro
			if($("#AccountNumberEditar").val() == ""){
             /////*******PROCESO PARA INGREGRESAR REGISTROS
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Cuentas/RegistrarCuentaYtarjeta",
									data:$("#frmRegistro").serialize(),
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
											else if (data== 2)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append("La Tarjeta ya existe.  Solicite ayuda a un administrador");
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data== 3)
											{
												/*
												NOTA: ESTA VALIDACION YA NO SE DARÁ NUNCA PORQQUE EN EL FORMULARIO YA SE ELIJE EL TIPO DE TARJETA Y intFacility
												*/
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
												$('#errores').append("No hay FacilityCode disponible");
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data== 4)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append("La fecha elejida debe ser mayor a la de hoy");
												//muestro el contenido de los errores
												$("#msjError").show();
												
												//$('#ToDate').prop('disabled', false);

											}
											else if (data== 5)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores la cuenta ya existe
												$('#errores').append("La Cuenta que se quiere agregar ya existe. Solicite ayuda a un administrador");
												//muestro el contenido de los errores
												$("#msjError").show();
												
												//$('#ToDate').prop('disabled', false);

											}
											else
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
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
			else {
				//es ACTUALIZACION
				$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Cuentas/ActualizarCuenta",
									data:$("#frmRegistro").serialize(),
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
											else if (data== 2)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores
												$('#errores').append("La Tarjeta y/o Cuenta ya existe.  Solicite ayuda a un administrador");
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data== 3)
											{
												/*
												NOTA: ESTA VALIDACION YA NO SE DARÁ NUNCA PORQQUE EN EL FORMULARIO YA SE ELIJE EL TIPO DE TARJETA Y intFacility
												*/
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
												$('#errores').append("No hay FacilityCode disponible");
												//muestro el contenido de los errores
												$("#msjError").show();
											}
											else if (data== 4)
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
												$('#errores').append("La fecha elejida debe ser mayor a la de hoy");
												//muestro el contenido de los errores
												$("#msjError").show();
												
												//$('#ToDate').prop('disabled', false);

											}
											else
											{
												
												$("#errores").empty();//limpio los erores
												//agrego los errores no ha intFacility habilitado en la tabla tbl_Tarjetas
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
			}
        }
			
});
//proceso para limpiar las cajas de texto
$("#btnLimpiar").click(function(){
	$('input[type="text"]').val('');
	//pongo los select a Seleccione una opcion
	$('select option[value=""]').prop('selected', 'selected').change();
	//habilito cajas de texto
	PonerDisabled(false);
	//habilito algunos combos del TIPO DE TARJETA
	DeshabiliarSelect("algo");
	//deshabilito la textbox ToDate
	//$('#ToDate').prop('disabled', true);
	//habilito el textbox AccountNumber y la vuelvo a su color original
	$('#AccountNumber').prop('readOnly', false);
	$('#AccountNumber').css('background-color' , '#ffffff');
	$("#tblSucursales").hide();
	
});
 </script>