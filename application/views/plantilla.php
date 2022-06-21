<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Recargas Web | TAS</title>
    <!-- Favicon-->
    <link rel="icon" href="<?php echo base_url(); ?>favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="<?php echo base_url(); ?>plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="<?php echo base_url(); ?>plugins/animate-css/animate.css" rel="stylesheet" />
	
	 <!-- Bootstrap Select Css PARA EL ESTILO DE LOS SELECT -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
	
	<!-- Sweetalert Css estilo para las ventanas dialogs -->
	 <link href="<?php echo base_url(); ?>plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <!-- JQuery DataTable Css -->
    <link href="<?php echo base_url(); ?>plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
	
	  <!-- Bootstrap Material Datetime Picker Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />

    <!-- Bootstrap DatePicker Css -->
    <link href="<?php echo base_url(); ?>plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" />
        
	
    <!-- Custom Css -->
    <link href="<?php echo base_url(); ?>css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="<?php echo base_url(); ?>css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-red">
    <!-- Page Loader -->
    <!--div class="page-loader-wrapper">
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
            <p>Please wait...</p>
        </div>
    </div-->
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
			
			 <!-- aqui top bar -->
				<?php 
					  $this->load->view("includes/top_bar");
				?>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <!--div class="image">
                    <img src="../../images/user.png" width="48" height="48" alt="User" />
                </div-->
               
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
				 <!-- aqui va el menu -->
					 <?php 
					   $this->load->view("includes/menu_lateral_izquierdo");
					 ?>
					
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2019 - <?php echo date("Y");?> <a href="http://www.tas-seguridad.com/" target="_blank">TAS - Tecnolog&iacute;a, Acceso y Segurida</a>.
                </div>
                <div class="version">
                    <b><a href="<?php echo base_url();?>Inicio/Cambios">Versi&oacute;n: </b> 1.0 By MaCruz-Gi</a>
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->
        <aside id="rightsidebar" class="right-sidebar">
            <!-- aqui va el menu del profile del usuario -->
					 <?php 
					 //SE COMENTA PORQUE YA NO SE ESTA USANDO ESTA VISTA
					   //$this->load->view("includes/menu_login_usuario");
					 ?>
        </aside>
        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                 
                    <!--small>Taken from <a href="https://datatables.net/" target="_blank">datatables.net</a></small-->
                </h2>
            </div>
            <!-- Basic Examples -->
             <!-- #END# Basic Examples -->
			  <?php 
					//AQUI SE CARGARA EL CONTENIDO
					   $this->load->view($contenido);
				?>
            
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/node-waves/waves.js"></script>

    <!-- Jquery DataTable Plugin Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
	<!--para los toltip-->
	<script src="<?php echo base_url(); ?>js/pages/ui/tooltips-popovers.js"></script>
    <!-- Custom Js -->
    <script src="<?php echo base_url(); ?>js/admin.js"></script>
    <script src="<?php echo base_url(); ?>js/pages/tables/jquery-datatable.js"></script>

    <!-- Demo Js -->
    <script src="<?php echo base_url(); ?>js/demo.js"></script>
</body>

</html>
