<style>
.error{
	color:red;
}
</style>
<div class="block-header">
                <!--h2>
                    CUENTAS
                    <small>Cart Management/<a>Cuentas</a></small>
                </h2-->
				<ol class="breadcrumb">
                                <li>
                                    <a href="javascript:void(0);">
                                        <i class="material-icons">home</i> Inicio
                                    </a>
                                </li>
                                <li>
									<a href="javascript:void(0);">
										<i class="material-icons">folder</i> Reportes
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i> Reporte Cargos
                                </li>
                </ol>
            </div>
 <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               REPORTE DE CARGOS
                            </h2>
                           
                        </div>
						
                        <div class="body">
                            									
							<form id="frmRegistro" action="<?php echo base_url();?>Tarjetas/VistaReporteCargos" method="POST">
							<div class="row clearfix">
								<div class="col-xs-6">
                                    <h2 class="card-inside-title">Rango de Fechas</h2>
                                    <div class="input-daterange input-group" id="bs_datepicker_range_container">
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="Ejemplo: 01-07-2019" name="FechaDesde" id="FechaDesde" autocomplete="off">
											<?php echo form_error('FechaDesde', '<div class="error">', '</div>'); ?>
                                        </div>
                                        <span class="input-group-addon">hasta</span>
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="Ejemplo: 01-07-2019" name="FechaHasta" id="FechaHasta" autocomplete="off">
											<?php echo form_error('FechaHasta', '<div class="error">', '</div>'); ?>
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
                                                <button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
													<i class="material-icons">search</i>
													<span>BUSCAR</span>
												</button>
												<!--button type="button" class="btn bg-brown" id="rePDF" style="display:none;">
												<i class="material-icons">format_list_bulleted</i>
													<span>Exp. PDF</span>
												</button-->
												<div class="btn-group" id="btnsExportar" style="display:none;">
													<button type="button" class="btn bg-brown" dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
													<i class="material-icons">format_list_numbered</i>
														EXPORTAR <span class="caret"></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="javascript:ExportarPdf();" class=" waves-effect waves-block">PDF</a></li>
														<li><a href="javascript:ExportarExcel();" class=" waves-effect waves-block">EXCEL</a></li>
													</ul>
												</div>
                                         </div>
									</div>
                                </div>
                            </div>
							
						
								
							</form>
							<div class="table-responsive"> 
                                <table class="table table-bordered table-striped table-hover dataTable" id="tblListado">
                                    <thead>
                                        <tr>
											<th>Cuenta</th>
											<th># Tarjeta</th>
                                            <th>Cliente</th>
                                            <th>Cargo</th>
                                            <th>Fecha</th>
                                        </tr>
                                    </thead>
                                    <!--tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot-->
                                    <tbody>
										<?php
										if(isset($TraerCargosPorFecha)){
											foreach($TraerCargosPorFecha as $filasEcnotradas):
											
										?>
                                            <tr>
												<td><?php echo utf8_encode($filasEcnotradas->NOMBRE_CUENTA);?></td>
                                                <td><?php echo $filasEcnotradas->CardNumber;?></td>
                                                <td><?php echo utf8_encode($filasEcnotradas->CARD_NOMBRE);?></td>
                                                <td><?php echo $filasEcnotradas->Amount;?></td>
												<td><?php echo date("d-m-Y H:i:s", strtotime($filasEcnotradas->InvDate));?></td>
                                            </tr>
                                            <?php
												endforeach;
										}
											?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			
            <!-- #END# Exportable Table -->
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
	<!--script src="<?php echo base_url(); ?>plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script--->
		 <!-- Bootstrap Datepicker Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!--Idiomas del dataPiker-->
	<script src="<?php echo base_url(); ?>plugins/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>
<script>
    //Date mascaras
   //$('#FechaDesde').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
   //$('#FechaHasta').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
$('#bs_datepicker_range_container').datepicker({
        autoclose: true,
        container: '#bs_datepicker_range_container',
		format: 'dd-mm-yyyy',
		//rtl: true,
		language:"es",
		 todayBtn: "linked",
		todayHighlight: true
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
			}
			
});
function ExportarPdf() {
   	/////*******PROCESO PARA gnerar el reporte
								$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/GenerarReporteCargosPorFecha",
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
									url:"<?php echo base_url();?>Reportes/GenerarReporteCargosPorFechaExcel",
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
//al dar clic en el btnEnviar se muestre el espere...
$("#btnEnviar").click(function(){
	 if($("#FechaDesde").val() == "" || $("#FechaHasta").val() == ""){
	  return;
  }
$("#cargando").show();		
});
$(document).ready(function() {
$('#tblListado').DataTable( {
        dom: 'Bfrtip',
       buttons: [{
				extend: 'excelHtml5',
				title: 'Grupo Roble',
				text: "Exp. Excel",
				className: 'btn bg-brown waves-effect'
			},{
				extend: 'pdfHtml5',
				title: 'Grupo Roble',
				text: "Exp. PDF",
				className: 'btn bg-brown waves-effect'
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
			},
		//processing: $("#cargando").show()
		},
		"order": [[ 4, "desc" ]]
		
    } );    
} );
</script>