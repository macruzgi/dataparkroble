<ul>
<?php
if(count($TraerTajetasFiltradas) > 0){
foreach($TraerTajetasFiltradas as $tarjetasEcontradas):
?>
<li>
<a onclick="EnviarDatosAfrmParent('<?php echo $tarjetasEcontradas->Tarjeta?>', '<?php echo $tarjetasEcontradas->AccountNumber;?>', '<?php  echo $tarjetasEcontradas->Tarjeta."-".$tarjetasEcontradas->AccountNumber."; ".utf8_encode($tarjetasEcontradas->AccountName).", ".utf8_encode($tarjetasEcontradas->CARD_FirstName).", ".utf8_encode($tarjetasEcontradas->CARD_LastName)."; ".$tarjetasEcontradas->strName."-".$tarjetasEcontradas->strDescription;?>', '<?php echo $tarjetasEcontradas->intMediaType?>', '<?php echo $tarjetasEcontradas->intFacility?>', '<?php echo $tarjetasEcontradas->AccountBalance?>')" style="cursor:pointer;">
<?php echo $tarjetasEcontradas->Tarjeta."-".$tarjetasEcontradas->AccountNumber."; ".utf8_encode($tarjetasEcontradas->AccountName).", ".utf8_encode($tarjetasEcontradas->CARD_FirstName).", ".utf8_encode($tarjetasEcontradas->CARD_LastName)."; ".$tarjetasEcontradas->strName."-".$tarjetasEcontradas->strDescription;?></a>
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
function EnviarDatosAfrmParent(Tarjeta, AccountNumber, buscado, intMediaType, intFacility, AccountBalance)
{
	$("#card_number").val(Tarjeta);
	$("#account_number").val(AccountNumber);
	$("#buscar_tarjeta").val('');
	$("#buscar_tarjeta").val(buscado);
	$("#intMediaType").val(intMediaType);
	$("#intFacility").val(intFacility);
	$("#AccountBalance").val(AccountBalance);
	$("#listadosEmergentes").html('');
	//cuando de clic en la lista desplegable que se oculte el historial de las recargas
	$("#tblPayment").hide();
}
</script>
							