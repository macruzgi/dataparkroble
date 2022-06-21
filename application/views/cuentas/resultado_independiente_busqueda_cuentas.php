<ul>
<?php
if(count($TraerCuentasFiltradas) > 0){
foreach($TraerCuentasFiltradas as $filasEncontradas):
?>
<li>
<a onclick="EnviarDatosAfrmParent('<?php echo $filasEncontradas->AccountNumbe;?>', '<?php echo $filasEncontradas->AccountNumbe."-".utf8_encode($filasEncontradas->AccountName);?>')" style="cursor:pointer;">
<?php echo $filasEncontradas->AccountNumbe."-".utf8_encode($filasEncontradas->AccountName);?></a>
</li>
<?php 
endforeach;
}
else{
?>
Sin resultados
<?php } ?>
</ul>
<script>
function EnviarDatosAfrmParent(p_AccountNumber,  p_buscar_cuenta)
{
	//limpio todo
	LimpiarTodo();
	$("#AccountNumber").val(p_AccountNumber);
	$("#buscar_cuenta").val(p_buscar_cuenta);
	$("#listadosEmergentes").html('');
//alert(p_AccountNumber);
//muestro loading
$("#cargando").show();
$("#msjError").hide();
//al llamar la funcion se cargaran los datos de las tarjetas encontradas de la cuenta seleccionada

$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/TraerTarjetasDeCuenta/",
									data:{AccountNumber:p_AccountNumber},
									dataType: 'json',//espero un json
									success:function(data)
										{
											//oculto loading
											$("#cargando").hide();
											$("#msjNoHayReesultados").hide();
											$("#tblResumen").find('td').remove();
											if(data.respuesta ==  1){
												$("#tblResumen").find('td').remove();
												$.each(data.mensaje, function (key, valor) // indice, valor
													{
																
														$('#tblResumen tbody').append("<tr><td>" + valor.CardNumber + "</td><td>"  + valor.FromDate + " a " + valor.ToDate + "</td><td>" + valor.CARD_NOMBRE + "</td><td>"+ p_AccountNumber + "</td><td>"
														+"<button type='button' class='btn btn-success btn-circle waves-effect waves-circle waves-float' title='Editar' onClick=\"EditarTarjeta('"+valor.CardNumber + "\','" + valor.intMediaType + "','" + valor.intFacility + "\','" + valor.NOMBRE_TIPO_TARJETA +"')\">" + "<i class='material-icons'>edit</i> </button> <button type='button' class='btn bg-red btn-circle waves-effect waves-circle waves-float' title='Deshabilitar Tarjeta' onClick=\"DeshabilitarTarjeta('"+valor.CardNumber + "\','" + valor.intMediaType + "','" + valor.intFacility +"')\">" + "<i class='material-icons'>lock_outline</i> </button></td></tr>");
														
																				
													});
													
												//esto es valido solo para las tarjetas comunitarias si es nuevo registro de tarjeta comunitaria
												if(data.mensaje[0].ES_COMUNITARIA =='CU'){
													//asigno un 1 al textbox del frm parent VistaRegistrarTarjeta 
													$("#ES_COMUNITARIA").val('1');
													//si no es edicion de tarjetas, entonces es agregar una nueva, que muestre y arme la tabla de las sucursales
													if($("#CardNumberEditar").val() ==""){
														$("#divtblSucursales").show();
														$("#tblSucursales").find('td').remove();
														$.each(data.sucursales, function (key, valor) // indice, valor
															{
																		
																$('#tblSucursales tbody').append("<tr><td>" + valor.id_sucursal + "</td><td>"  + valor.sucursal_nombre+"</td><td>"
																+"<input class='second' type='checkbox' name='id_sucursal[]' id='id_sucursal' value="+valor.id_sucursal+"></td></tr>");
																						
															});
													}
													
												}
												// es exclusiva
												else if(data.mensaje[0].ES_COMUNITARIA != "CU" && data.mensaje[0].ES_COMUNITARIA != ""){
												$("#ES_COMUNITARIA").val(data.mensaje[0].ES_COMUNITARIA);
												}
												else{
													$("#ES_COMUNITARIA").val('');
													$("#divtblSucursales").hide();
												}
											}
											else if(data.respuesta == 2){
												$("#msjNoHayReesultados").show();
												//agrego el error
													$('#msjNoHayReesultados').append(data.mensaje);
											}
										}
								});
}
//funcion que limpia los campos del frm parent VistaRegistrarTarjeta
function LimpiarTodo(){
	
	$('input[type="text"]').val('');
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
	//oculto el divtblSucursales de las sucursales
	$("#divtblSucursales").hide();
}
</script>
							