    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand">Recargas Web::TAS - Tecnolog&iacute;a, Acceso y Seguridad</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                 <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <?php echo  $this->session->sucursal_nombre.": ".$this->session->userdata("nombre_usuario")."(".$this->session->userdata("usuario").")";?><i class="material-icons">person</i>
                            <span class="label-count"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header"> </li>
                            <li class="body">
                                <ul class="menu">
                                    <li>
                                        <a href="<?php echo base_url();?>Usuarios/VistaPerfil">
                                            <div class="btn btn-success btn-circle waves-effect waves-circle waves-float">
                                                <i class="material-icons">person</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Perfil</h4>
                                                <p>
                                                    <i class="material-icons">mode_edit</i> Editar datos y contrase&ntilde;a
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<?php echo base_url();?>Datapark/CerrarSesion">
                                            <div class="btn bg-red btn-circle waves-effect waves-circle waves-float">
                                                <i class="material-icons">input</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Cerrar Sesi&oacute;n</h4>
                                                <p>
                                                    <i class="material-icons">close</i> Cerrar sesi&oacute;n y salir del sistema
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!--li class="footer">
                                <a href="javascript:void(0);">View All Notifications</a>
                            </li-->
                        </ul>
                    </li>
                    <!-- #END# Notifications -->
                </ul>
            
            </div>
        </div>
    </nav>