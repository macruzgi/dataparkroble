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
										<i class="material-icons">assignment</i>Card Manager
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i>Facility Code
                                </li>
                </ol>
            </div>
			<?php
			//print_r($this->session->userdata('MenuUsuarioLogueado'));
			
			
			?>
 <!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               LISTADO DE FACILITY CODE
                            </h2>
                           
                        </div>
						
                        <div class="body">
						
							
                            <div class="table-responsive"> 
									<button type="button" class="btn bg-brown" id="btnNuevo" onClick="AgregarNuevo()">
									<i class="material-icons">note_add</i>
										<span>Agregar</span>
									</button>&nbsp;&nbsp;
									<!--button type="button" class="btn bg-brown" id="reEXCEL">
										 <i class="material-icons">format_list_numbered</i>
										 <span>Exp. Excel</span>
									</button-->
                                <table class="table table-bordered table-striped table-hover dataTable" id="tblCuentas">
                                    <thead>
                                        <tr>
											<th>ID</th>
                                            <th>Facility Code</th>
                                            <th>Estado</th>
                                            <th>Fecha</th>
											<th>ACCI&Oacute;N</th>
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
									//print_r($ListarCuentasTodas);
											foreach($TaerListadoFacilityCode as $facilityEncontrados):
											
										?>
                                            <tr>
												<td><?php echo $facilityEncontrados->id_tarjeta;?></td>
                                                <td><?php echo $facilityEncontrados->intFacility;?></td>
                                                <td><?php echo $facilityEncontrados->estado_facility;?></td>
												<td><?php echo date("d-m-Y H:i:s", strtotime($facilityEncontrados->fecha));?></td>
                                                <td>
												<div class="js-sweetalert">
												<?php 
													if($facilityEncontrados->estado_facility =="INACTIVO"){
												?>
													<button class="btn btn-success btn-circle waves-effect waves-circle waves-float"    data-type="confirm" onClick="Activar('<?php echo $facilityEncontrados->id_tarjeta;?>', '<?php echo $facilityEncontrados->intFacility;?>')" title="Activar Facility Code">
													<i class="material-icons">flag</i>
													</button>
												<?php
													}
													else{
												?>
													<button class="btn bg-red btn-circle waves-effect waves-circle waves-float"    data-type="confirm" onClick="Desactivar('<?php echo $facilityEncontrados->id_tarjeta;?>', '<?php echo $facilityEncontrados->intFacility;?>')" title="Desactivar Facility Code">
													<i class="material-icons">block</i>
													</button>
												
													<!--button type="button" class="btn btn-success btn-circle waves-effect waves-circle waves-float" title="Asignar permisos" onClick="AsignarPermisos('<?php echo $facilityEncontrados->id_tarjeta;?>')">
														<i class="material-icons">vpn_key</i>
													</button-->
													<?php
														}
													?>
												</div>
												</td>
                                               
                                            </tr>
                                            <?php
												endforeach;
											?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Exportable Table -->
			<!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>
	<script src="<?php echo base_url(); ?>plugins/sweetalert/sweetalert.min.js"></script>
	
<script>
function Desactivar(p_id_tarjeta, p_intFacility) {
    swal({
        title: "Desactivar Facility Code",
        text: "Se DESACTIVARÁ el Facility Code: " + p_intFacility + ". ¿Desea continuar?",
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
									url:"<?php echo base_url();?>Tarjetas/DesactivarFacilityCode",
									data:{id_tarjeta:p_id_tarjeta, intFacility:p_intFacility},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											if (data == 1)
											{
												
												swal("¡Desactivado!", "El Facility Code: "+p_intFacility+" se ha DESACTIVADO", "success");
												
												setTimeout(function () {
													location.reload();
												}, 2000);
																					}
											else
											{
												swal("Errores Generales", data, "error");
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

function Activar(p_id_tarjeta, p_intFacility) {
    swal({
        title: "Activar Facility Code",
        text: "Se ACTIVARÁ el Facility Code: " + p_intFacility + ". ¿Desea continuar?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "SI, proceder",
		cancelButtonText: "Cancelar",
        closeOnConfirm: false
    }, function () {
					//si doy clic en proceder activo el suario
						$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Tarjetas/ActivarFacilityCode",
									data:{id_tarjeta:p_id_tarjeta, intFacility:p_intFacility},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											if (data == 1)
											{
												
												swal("¡Activado!", "El Facility Code: "+p_intFacility+" se ha ACTIVADO", "success");
												
												setTimeout(function () {
													location.reload();
												}, 2000);
																					}
											else
											{
												swal("Errores Generales", data, "error");
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

function AgregarNuevo() {
window.location='<?php echo base_url();?>Tarjetas/AgregarFacilityCode';
}

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