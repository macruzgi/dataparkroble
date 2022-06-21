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
	$("#AccountNumber").val(p_AccountNumber);
	$("#buscar_cuenta").val(p_buscar_cuenta);
	$("#listadosEmergentes").html('');
//alert(p_AccountNumber);
//muestro loading
$("#cargando").show();
//al llamar la funcion se cargaran los datos de la cuenta encontrada
$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Cuentas/TraerDatosDeCuentaEditar/",
									data:{AccountNumber:p_AccountNumber},
									dataType: 'json',//espero un json
									success:function(data)
										{
											//oculto loading
											$("#cargando").hide();
											if(data.respuesta ==  1){
												//agrego los valores taridos a las cajas de texto de la pestaña agregar tarjeta
												$("#AccountNumberEditar").val(data.mensaje.AccountNumber);
												$("#AccountName").val(data.mensaje.AccountName);
												$("#Email").val(data.mensaje.Email);
												$("#Phone").val(data.mensaje.Phone);
												//pongo los controles en disabled
												PonerDisabled(true);
												//hihabilito algunos combos del TIPO DE TARJETA
												DeshabiliarSelect("DES");
												//pongo en readonly el textbox CardNumber y le pongo el fondo difernte color
												$('#AccountNumber').prop('readOnly', true);
												$('#AccountNumber').css('background-color' , '#f1efef');
											}
											else if(data.respuesta == 2){
												$("#msjError").show();
												//agrego el error
												$("#errores").empty();
												$('#errores').append(data.mensaje);
											}
										}
								});
}
</script>
							