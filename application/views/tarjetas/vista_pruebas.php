    <!-- Bootstrap Material Datetime Picker Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />

    <!-- Bootstrap DatePicker Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
           
		   <!--Bootstrap Date Picker -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                BOOTSTRAP DATE PICKER
                                <small>Taken from <a href="https://github.com/uxsolutions/bootstrap-datepicker" target="_blank">github.com/uxsolutions/bootstrap-datepicker</a></small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-3">
                                    <h2 class="card-inside-title">Text Input</h2>
                                    <div class="form-group">
                                        <div class="form-line" id="bs_datepicker_container">
                                            <input type="text" class="form-control" placeholder="Please choose a date...">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <h2 class="card-inside-title">Component</h2>
                                    <div class="input-group date" id="bs_datepicker_component_container">
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="Please choose a date...">
                                        </div>
                                        <span class="input-group-addon">
                                            <i class="material-icons">date_range</i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <h2 class="card-inside-title">Range</h2>
                                    <div class="input-daterange input-group" id="bs_datepicker_range_container">
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="Date start...">
                                        </div>
                                        <span class="input-group-addon">to</span>
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="Date end...">
                                        </div>
                                    </div>
                                </div>
								<div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" class="datetimepicker form-control" placeholder="Please choose date & time...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--#END# Bootstrap Date Picker -->
            
           

    <!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Datepicker Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!-- Jquery Validation Plugin Css -->
    <script src="<?php echo base_url(); ?>plugins/jquery-validation/jquery.validate.js"></script>
<script>
    //Date mascaras
  // $('#FechaDesde').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
  // $('#FechaHasta').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
   
   $('#bs_datepicker_range_container').datepicker({
        autoclose: true,
        container: '#bs_datepicker_range_container',
		 language: 'es',
		 dateFormat: 'dd-mm-yyyy'
    
    });
   
$( "#frmRegistro" ).validate({ 
  rules: {
	FechaDesde:{
			required: true
		},
    FechaHasta: {
			required: true
		}
  },
  messages: {
				FechaDesde:{
							required:"Este valor es requerido"
						},
				FechaHasta:{
							required:"Este valor es requerido"
						}
			},
			
		submitHandler: function(form){
			var tabla = $('#tblListadoRecargas').DataTable();	
             /////*******PROCESO PARA buscar registros
						$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/TraerRecargasPorFecha",
									data:$("#frmRegistro").serialize(),
									dataType: 'json',//espero un json,
									beforeSend: function(){
										//$("#cargando").show();
									},
									success:function(data)
										{
											
											tabla.destroy();
											
											$("#cargando").hide();
											var cuenta = Object.keys(data).length;
											if(cuenta > 0){
												//$("#btnsExportar").show();
											}
											$.each(data, function (key, valor) // indice, valor
																{
																
																$('#tblListadoRecargas tbody').append("<tr><td>"+ valor.AccountNumber + "</td><td>" + valor.NOMBRE_CUENTA + "</td><td>"+ valor.Amount + "</td><td>" + valor.NO_FACTURA_TRANSACCION + "</td><td>" + valor.PaymentDate +  "</td><td>" + valor.USUARIO +"</td></tr>");
																				
																});
											tabla = $('#tblListadoRecargas').DataTable( {
												/*"destroy": true,*/
        dom: 'Bfrtip',
       buttons: [{
				extend: 'excelHtml5',
				title: 'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA, CEPA',
				text: "Exp. Excel"
			},{
				extend: 'pdfHtml5',
				title: 'COMISIÓN EJECUTIVA PORTUARIA AUTÓNOMA, CEPA',
				text: "Exp. PDF"
				}
        ],
		language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Último",
            "next": "Siguiente",
            "previous": "Anterior"
			}
		},
		"order": [[ 4, "desc" ]]
    } );

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
												
												$('#ToDate').prop('disabled', false);

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
			
});
function ExportarPdf() {
   	/////*******PROCESO PARA gnerar el reporte
								$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/GenerarReporteRecargasPorFecha",
									data:{FechaDesde:$("#FechaDesde").val(), FechaHasta:$("#FechaHasta").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#cargando").hide();	
											if (data.respuesta == 1)
											{
												
												window.open(data.mensaje);
											}
											else
											{
												
											}
										},
									error:function(resultdo)
										{
											
										}
								});
							/////*******FIN DEL PROCESO PARA gnerar el reporte
}
function ExportarExcel() {
   	/////*******PROCESO PARA gnerar el reporte
								$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/GenerarReporteRecargasPorFechaExcel",
									data:{FechaDesde:$("#FechaDesde").val(), FechaHasta:$("#FechaHasta").val()},
									dataType: 'json',//espero un json
									success:function(data)
										{
											$("#cargando").hide();	
											window.open(data.mensaje);
										},
									error:function(resultdo)
										{
											
										}
								});
							/////*******FIN DEL PROCESO PARA gnerar el reporte
}
$(document).ready(function() {
    
} );
</script>