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
										<i class="material-icons">vpn_key</i>Accesos
									</a>
                                </li>
								 <li class="active">
                                    <i class="material-icons"></i>Listado de Usuarios
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
                               LISTADO DE USUARIOS
                            </h2>
                           
                        </div>
						
                        <div class="body">
						

                            <div class="table-responsive"> 
									<!--button type="button" class="btn bg-brown" id="rePDF">
									<i class="material-icons">format_list_bulleted</i>
										<span>Exp. PDF</span>
									</button>&nbsp;&nbsp;
									<button type="button" class="btn bg-brown" id="reEXCEL">
										 <i class="material-icons">format_list_numbered</i>
										 <span>Exp. Excel</span>
									</button-->
                                <table class="table table-bordered table-striped table-hover dataTable" id="tblCuentas">
                                    <thead>
                                        <tr>
											<th>Usuario</th>
                                            <th>Nombre</th>
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
											foreach($ListaUarios as $usuariosEncontradas):
											
										?>
                                            <tr>
												<td><?php echo $usuariosEncontradas->usuario;?></td>
                                                <td><?php echo $usuariosEncontradas->nombre_usuario;?></td>
                                                <td><?php echo $usuariosEncontradas->ESTADO_USUARIO;?></td>
                                                <td><?php echo date("d-m-Y H:i:s", strtotime($usuariosEncontradas->fecha));?></td>
                                                
                                               
                                                <td>
												<div class="js-sweetalert">
												<?php 
													if($usuariosEncontradas->ESTADO_USUARIO =="INACTIVO"){
												?>
													<button class="btn bg-brown btn-circle waves-effect waves-circle waves-float"    data-type="confirm" onClick="ActivarUsuario('<?php echo $usuariosEncontradas->id_usuario;?>', '<?php echo $usuariosEncontradas->usuario;?>')" title="Activar Usuario">
													<i class="material-icons">lock_open</i>
													</button>
												<?php
													}
													else{
												?>
													<button class="btn bg-red btn-circle waves-effect waves-circle waves-float"    data-type="confirm" onClick="DesactivarUsuario('<?php echo $usuariosEncontradas->id_usuario;?>', '<?php echo $usuariosEncontradas->usuario;?>')" title="Desactivar Usuario">
													<i class="material-icons">lock_outline</i>
													</button>
												
													<button type="button" class="btn btn-success btn-circle waves-effect waves-circle waves-float" title="Asignar permisos" onClick="AsignarPermisos('<?php echo $usuariosEncontradas->id_usuario;?>')">
														<i class="material-icons">vpn_key</i>
													</button>
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
//These codes takes from http://t4t5.github.io/sweetalert/


function DesactivarUsuario(p_id_usuario, p_usuario) {
    swal({
        title: "Desactivar Usuario",
        text: "Se DESACTIVARÁ al usuario: " + p_usuario + ". ¿Desea continuar?",
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
									url:"<?php echo base_url();?>Usuarios/DesactivarUsuario",
									data:{id_usuario:p_id_usuario},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											if (data == 1)
											{
												
												swal("¡Desactivado!", "El usuario: "+p_usuario+" ya no accesará al sistema", "success");
												
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

function ActivarUsuario(p_id_usuario, p_usuario) {
    swal({
        title: "Activar Usuario",
        text: "Se ACTIVARÁ al usuario: " + p_usuario + ". ¿Desea continuar?",
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
									url:"<?php echo base_url();?>Usuarios/ActivarUsuario",
									data:{id_usuario:p_id_usuario},
									//dataType: 'json',//espero un json
									success:function(data)
										{
											if (data == 1)
											{
												
												swal("¡Activado!", "El usuario: "+p_usuario+" tendrá acceso al sistema", "success");
												
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

function AsignarPermisos(p_id_usuario) {
var mascara = p_id_usuario+"1029";
window.location='<?php echo base_url();?>Usuarios/VistaAsignarPermisos/'+p_id_usuario+"/"+mascara;
}

$(document).ready(function() {
    $('#tblCuentas').DataTable( {
        dom: 'Blfrtip', //la letra "l" es para mostrar los botones de exportar y el select de mostrar entradas de a
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
		"order": [[ 3, "asc" ]],
		"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todo"]]
    } );
} );
</script>