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
                                    <i class="material-icons"></i> Reporte Recarga
                                </li>
                </ol>
            </div>
 <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               REPORTE DE RECARGAS
                            </h2>
                           
                        </div>
						
                        <div class="body">
                            <div class="table-responsive"> 
									<button type="button" class="btn bg-brown" id="rePDF">
									<i class="material-icons">format_list_bulleted</i>
										<span>Exp. PDF</span>
									</button>&nbsp;&nbsp;
									<button type="button" class="btn bg-brown" id="reEXCEL">
										 <i class="material-icons">format_list_numbered</i>
										 <span>Exp. Excel</span>
									</button>
							<form id="frmRegistro">
							<div class="row clearfix">
								<div class="col-md-4">
                                   <p>
                                        <b>FECHA DEDESDE</b>
                                    </p>
									 <div class="input-group input-group-lg">
									 <span class="input-group-addon">
                                            <i class="material-icons">date_range</i>
                                       </span>
										<div class="form-line">
                                                <input type="text" name="FechaDesde" id="FechaDesde" class="form-control" placeholder="Ejemplo: 30/07/2016">
                                         </div>
									</div>
                                </div>
                               
								<div class="col-md-4">
                                   <p>
                                        <b>FECHA HASTA</b>
                                    </p>
									 <div class="input-group input-group-lg">
									 <span class="input-group-addon">
                                            <i class="material-icons">date_range</i>
                                       </span>
										<div class="form-line">
                                                <input type="text" name="FechaHasta" id="FechaHasta" class="form-control" placeholder="Ejemplo: 30/07/2016">
                                         </div>
									</div>
                                </div>
                            </div>
							
						
								<button type="submit" id="btnEnviar" class="btn btn-success waves-effect">
                                    <i class="material-icons">verified_user</i>
                                    <span>PROCESAR</span>
                                </button>
							</form>
                                <table class="table table-bordered table-striped table-hover dataTable" id="tblCuentas">
                                    <thead>
                                        <tr>
											<th>Tarjeta</th>
                                            <th>Account Number</th>
                                            <th>Account Name</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                               
                                            <th>Account Balance</th>
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
	<script src="<?php echo base_url(); ?>plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
<script>
    //Date mascaras
   $('#FechaDesde').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
   $('#FechaHasta').inputmask('dd-mm-yyyy', { placeholder: '__-__-____', "clearIncomplete": true});
$( "#rePDF" ).click(function() {
   	/////*******PROCESO PARA gnerar el reporte
								$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/GenerarReporteCuentasP",
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
});
$( "#reEXCEL" ).click(function() {
   	/////*******PROCESO PARA gnerar el reporte
								$("#cargando").show();	
								$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Reportes/GenerarReporteCuentasExcel",
									success:function(data)
										{
											$("#cargando").hide();	
											window.open("<?php echo base_url();?>Reportes/GenerarReporteCuentasExcel",'_blank')
										},
									error:function(resultdo)
										{
											
										}
								});
							/////*******FIN DEL PROCESO PARA gnerar el reporte
});
$(document).ready(function() {
    $('#tblCuentas').DataTable( {
        dom: 'Bfrtip',
       buttons: [
            /*'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'*/
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
		"order": [[ 0, "desc" ]]
    } );
} );
</script>