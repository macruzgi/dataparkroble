 <div class="block-header">
                <!--h2>
                    CUENTAS
                    <small>Cart Management/<a>Cuentas</a></small>
                </h2-->
				<ol class="breadcrumb">
                                <li class="active">
                                    <a href="javascript:void(0);">
                                        <i class="material-icons">home</i> Inicio
                                    </a>
                                </li>
                               
                </ol>
            </div>
        <div class="container-fluid">
         <div class="block-header">
                <h2>
                    ESTAD&Iacute;STICAS
                    <small>TOMAR EN CUENTA QUE LOS DATOS SON DIARIOS</small>
                </h2>
            </div>
            <div class="row clearfix">
			   <!-- Line Chart -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>RECARGAS VRS. CARGOS DE LOS &Uacute;LTIMOS 8 D&Iacute;AS EXPRESADOS EN $</h2>
                           
                        </div>
                        <div class="body">
                            <!--canvas id="graficaLineal" height="150"></canvas-->
							Gr&aacute;fica a&uacute;n NO DISPONIBLE
                        </div>
                    </div>
                </div>
                <!-- #END# Line Chart -->
				 <!-- grafica barra -->
               
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                     <div class="card">
                        <div class="header">
                            <h2>RECARGAS VRS. CARGOS</h2>
                           
                        </div>
                        <div class="body">
                            <!--canvas id="bar_chart" height="150"></canvas-->
							Gr&aacute;fica a&uacute;n NO DISPONIBLE
                        </div>
                    </div>
                </div>
				
                <!-- #END# grafica barra -->
              
            </div>
			
			<div class="row clearfix">
			  
				
				
               
            </div>

           
			
        </div>

	 <!-- Jquery Core Js -->
    <script src="<?php echo base_url(); ?>plugins/jquery/jquery.min.js"></script>


    <!-- Chart Plugins Js -->
    <script src="<?php echo base_url(); ?>plugins/chartjs/Chart.bundle.js"></script>

	  <!-- Morris Plugin Js -->
	<script src="<?php echo base_url(); ?>plugins/raphael/raphael.min.js"></script>
    <script src="<?php echo base_url(); ?>plugins/morrisjs/morris.js"></script>

    <!-- Demo Js -->
 <script>
$(document).ready(function() {

$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inicio/TraerDatosParaGraficas",
									dataType: 'json',//espero un json
									success:function(data)
										{
//codigo para las graficas de barra
$(function () {
    new Chart(document.getElementById("graficaLineal").getContext("2d"), getChartJs('graficaLineal'));
    new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar'));
   /* new Chart(document.getElementById("sitioUno").getContext("2d"), getChartJs('sitioUno'));
    new Chart(document.getElementById("sitioDos").getContext("2d"), getChartJs('sitioDos'));
	new Chart(document.getElementById("sitioTres").getContext("2d"), getChartJs('sitioTres'));*/
});


function getChartJs(type) {
    var config = null;

    if (type === 'bar') {
        config = {
            type: 'bar',
            data: {
                labels: ["RECARGAS", "CARGOS"],
                datasets: [{
                    label: "Recargas Generales en $",
                    data: [data.TOTAL_VENTAS_GRAL, 0],
                    backgroundColor: '#8f847c'
                }, {
                        label: "Cargos Generales en $",
                        data: [0, data.TOTAL_COBROS_GRAL],
                        backgroundColor: '#0669a2'
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
	/*else if (type === 'sitioUno') {
        config = {
            type: 'bar',
            data: {
                labels: ["RECARGAS", "CARGOS"],
                datasets: [{
                    label: "Recargas en $",
                    data: [data.TOTAL_VENTA_SITIO01, 0],
                    backgroundColor: '#8f847c'
                }, {
                        label: "Cargos en $",
                        data: [0, data.TOTAL_COBROS_SITIO01],
                        backgroundColor: '#f44336'
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
	else if (type === 'sitioDos') {
        config = {
            type: 'bar',
            data: {
                labels: ["RECARGAS", "CARGOS"],
                datasets: [{
                    label: "Recargas en $",
                    data: [data.TOTAL_VENTA_SITIO02, 0],
                    backgroundColor: '#8f847c'
                }, {
                        label: "Cargos en $",
                        data: [0, data.TOTAL_COBROS_SITIO02],
                        backgroundColor: '#f44336'
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
	else if (type === 'sitioTres') {
        config = {
            type: 'bar',
            data: {
                labels: ["RECARGAS", "CARGOS"],
                datasets: [{
                    label: "Recargas en $",
                    data: [data.TOTAL_VENTA_SITIO03, 0],
                    backgroundColor: '#8f847c'
                }, {
                        label: "Cargos en $",
                        data: [0, data.TOTAL_COBROS_SITIO03],
                        backgroundColor: '#f44336'
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }*/

    return config;
}

//fin para las graficas de barra
/*
//inicio grafica de pastel
$(function () {
    //getMorris('line', 'line_chart');
    //getMorris('bar', 'bar_chart');
   // getMorris('area', 'area_chart');
    getMorris('graficaPastelVentas', 'graficaPastelVentas');
});


function getMorris(type, element) {
     if (type === 'graficaPastelVentas') {
        Morris.Donut({
            element: element,
            data: [{
                label: 'Sitio 01',
                value: data.PORCENTAJE_VENTA_SITIO01
				}, {
                    label: 'Sitio 02',
                    value: data.PORCENTAJE_VENTA_SITIO02
                }, {
                    label: 'Sitio 03',
                    value: data.PORCENTAJE_VENTA_SITIO03
                }],
            colors: ['#f44336', '#8f847c', '#33201e'],
            formatter: function (y) {
                return y + '%'
            }
        });
    }
}
//fin grafica de pastal	
*/									},
									error:function(resultdo)
										{
											
										}
								});
 
//para la grafica lineal
//var DIAS = "";	
var valor1 = 0, valor2 = 0, valor3 = 0, valor4 = 0, valor5 = 0, valor6 = 0, valor7 = 0;		
var cargo0 = 0, cargo1 = 0, cargo2 = 0, cargo3 = 0, cargo4 = 0, cargo5 = 0, cargo6 = 0;					

$.ajax({
									type:"POST",
									url:"<?php echo base_url();?>Inicio/TraerDatosParaGraficasLinea",
									dataType: 'json',//espero un json
									success:function(datosRecibidos)
										{
											//alert(datosRecibidos[8].NOMBRE_DIA);
											//alert(datosRecibidos.Recargas.venta_lunes);
											valor1 = datosRecibidos.Recargas.venta_lunes;
											valor2 = datosRecibidos.Recargas.venta_martes;
											valor3 = datosRecibidos.Recargas.venta_miercoles;
											valor4 = datosRecibidos.Recargas.venta_jueves;
											valor5 = datosRecibidos.Recargas.venta_viernes;
											valor6 = datosRecibidos.Recargas.venta_sabado;
											valor7 = datosRecibidos.Recargas.venta_domingo;
														//alert(valor7);
														
											cargo0 = datosRecibidos.Cargos.venta_lunes;
											cargo1 = datosRecibidos.Cargos.venta_martes;
											cargo2 = datosRecibidos.Cargos.venta_miercoles;
											cargo3 = datosRecibidos.Cargos.venta_jueves;
											cargo4 = datosRecibidos.Cargos.venta_viernes;
											cargo5 = datosRecibidos.Cargos.venta_sabado;
											cargo6 = datosRecibidos.Cargos.venta_domingo;
											
											//alert(DIAS.slice(0, -1));

$(function () {
    new Chart(document.getElementById("graficaLineal").getContext("2d"), getChartJs('graficaLineal'));
});


function getChartJs(type) {
    var config = null;

    if (type === 'graficaLineal') {
        config = {
            type: 'line',
            data: {
                labels: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
                datasets: [{
                    label: "Recarga $",
					fill: true, //no muestra el backgroundColor
                    data: [valor1, valor2, valor3, valor4, valor5, valor6, valor7],
                    borderColor: '#8f847c',
                    backgroundColor: 'rgba(85, 85, 85, 0.5)',
                    pointBorderColor: '#8f847c',
                    pointBackgroundColor: '#8f847c',
                    pointBorderWidth: 2
                },{
                    label: "Cargos $",
					fill: true, //no muestra el backgroundColor
                    data: [cargo0, cargo1, cargo2, cargo3, cargo4, cargo5, cargo6],
                    borderColor: '#0669a2',
                    backgroundColor: 'rgba(6, 105, 62, 0.46)',
                    pointBorderColor: '#0669a2',
                    pointBackgroundColor: '#0669a2',
                    pointBorderWidth: 2
                }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }



    return config;
}

//fin para las graficas de lineal

									},
									error:function(resultdo)
										{
											
										}
								});
    


} );
</script>