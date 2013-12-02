<!DOCTYPE HTML>
<%@page import="java.util.LinkedList"%>
<html>
	<head>
		<title>IPN Clinic</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,800" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Oleo+Script:400" rel="stylesheet" type="text/css" />
		<script src="js/jquery.min.js"></script>
		<script src="js/config.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/ajaxjs.js"></script>
		
		<script src="js/jquery.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
		<link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
  		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  		 
<link rel="stylesheet" href="css/jquery-ui-1.9.2.custom.css"> 
  		<script src="js/jquery-1.9.1.js"></script>
  		<script src="js/jquery-ui.js"></script>
  		<script src="js/jquery.ui.datepicker-es.js"></script>
  		
  		
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <style type = "text/css">
	.ui-datepicker { font-size:10pt !important;}
	</style>
	  <script>
	  $(function() {
	    $( "#datepicker" ).datepicker();
	    $( "#datepicker" ).datepicker({ minDate: new Date() });
		$("#datepicker").datepicker();				
		$( "#datepicker").datepicker({ gotoCurrent: true });
	
		$( "#datepicker" ).datepicker("option", "showAnim", "slide");
		$( "#datepicker" ).datepicker("option", "dateFormat", "yy-mm-dd");
		//$( "#datepicker" ).datepicker({ dayNamesMin: [\'Di\', \'Lu\', \'Ma\', \'Me\', \'Je\', \'Ve\', \'Sa\'] });
		$( "#datepicker" ).datepicker( $.datepicker.regional[ "es" ] );
	  });
	  </script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			<link href="css/bootstrap.css" rel="stylesheet">
    		<link href="css/datepicker.css" rel="stylesheet">
		</noscript>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
	</head>
	
	<body class="left-sidebar">
 
    <%@page import="java.sql.*" %>
	<%
	String user = request.getParameter("user");	
	String nombre = "";
	
	int idpac = 0;
	LinkedList asd = new LinkedList();
	Class.forName("com.mysql.jdbc.Driver");
	Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
	PreparedStatement stm = conexion.prepareStatement("SELECT nombre_paciente,id_paciente FROM paciente WHERE username = ?");
	stm.setString(1,user);
	ResultSet rs = stm.executeQuery();
	PreparedStatement stm2 = conexion.prepareStatement("SELECT nombre_unidad FROM unidad_atencion");
	ResultSet rs2 = stm2.executeQuery();
	
	while(rs.next()){
		 nombre = rs.getString("nombre_paciente");
		 idpac = rs.getInt("id_paciente");
	//	 System.out.println(nombre);
	}
	while(rs2.next()){
		
		asd.add(rs2.getString("nombre_unidad"));
		
		System.out.println(asd.size());
	}
	
	%>

 

		<!-- Header Wrapper -->
			<div id="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="12u">
						
							<!-- Header -->
								<header id="header">
								
									<!-- Logo -->
										<div id="logo">
											<h1><a href="#" id="logo">IPN Clinic</a></h1>
											<span>Servicios Médicos Politécnicos</span>
										</div>
									
									<!-- Nav -->
										<nav id="nav">
											<ul>
												<li><a href="index.jsp">Cerrar sesion <%  %></a></li>
												<li class="current_page_item"><a href="paciente.jsp">Pacientes</a></li>
												<li><a href="doctor.jsp?">Personal Médico</a></li>
												<li><a href="medicinas.jsp">Medicamentos</a></li>
											</ul>
										</nav>
								
								</header>

						</div>
					</div>
				</div>
			</div>
		
		<!-- Main Wrapper -->
			<div id="main-wrapper">
				<div class="container">
					<div class="row">
						<div class="4u">
						
							<!-- Sidebar -->
								<div id="sidebar">

									<section>
										<h3>Bienvenido </h3>
										<p>En la parte inferior tienes las distintas acciones que como paciente puedes realizar.</p>
										<footer>
											<a href="gencita.jsp" class="button fa fa-info-circle">Generar Cita</a><br><br>
											<a href="#" class="button fa fa-info-circle">Consultar expediente</a><br><br>
											<a href="UnidController?action=listUser" class="button fa fa-info-circle">Consultar Unidades de Atención</a><br><br>
										</footer>
									</section>

								</div>
						
						</div>
						<div class="8u skel-cell-important">

							<!-- Content --> 
						 <div id="gencita"></div>	
						<SCRIPT Language="JavaScript">
					
						function showAndClearField(frm){
						  if(frm.fecha.value == "")
							  alert("Favor de rellenar el campo de fecha de cita");
						  else if(frm.unidadatencion.value=="")
							  alert("Favor de seleccionar una unidad de atención");
						
						  
						  else{	
						  
							  
						  alert(frm.idpac.value + frm.nompac.value + frm.fecha.value + frm.unidadatencion.value);
					      creacita(frm.idpac.value, frm.fecha.value, frm.unidadatencion.value);
					      
						  }
						     // alert("The field contains the text: " + frm.tratamientos.value + frm.notas_hosp.value + frm.notas_quirur.value + frm.interconsultas.value + frm.repo_radiolog.value + frm.exa_lab.value + frm.notas_ambulatorias.value);
						   
						//  frm.firstName.value = "";
						 
						}
						//-->
						</SCRIPT>
								<div id="content">
									<article class="last">

										<h2></h2>
<h1 class="fa fa-calendar" style="font-size: 2em;"> Generación de Cita </h1><br>
										<p>Rellene los siguientes campos:</p>
											<div class="register span6">
                 
                    <form>
                   		
                        <h2 >Generar<span class="red"><strong>Cita</strong></span></h2>
                         <p align="left">
                         <input type="hidden" value="<%=idpac %>" name="idpac">
                         <label for="nompac">Nombre del Paciente</label>
                        <input type="text" id="nompac" name="nompac" placeholder="Nombre del paciente..." value="<%=nombre%>" disabled>
                        <label for="fechacit">Fecha de la cita</label>
                        <input type="text" id="datepicker" name="fecha" placeholder="Fecha de Cita...">
                        <br>
                        <label for="unidadatencion">Unidad de Atención</label><br>
                        <select name="unidadatencion">
                        <%for (int i=0;i<asd.size();i++){ 	 %>
                        <option value="<%=asd.get(i)%>"><%=asd.get(i) %></option>
                        <%} %>
                        </select>
                         </p>
                        <input type="button" value="Reservar" class = "button fa fa-hospital-o" onClick="showAndClearField(this.form)">
                    </form>
                </div>
										
									</article>
								</div>

						</div>
					</div>
				</div>
			</div>

		
			<div id="footer-wrapper">
				<footer id="footer" class="container">
					<div class="row">
					<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Principal</h2>
									<ul class="style2">
										<li><a href="index.jsp">Página Principal de IPNClinic</a></li>
										<li><a href="paciente.jsp">Pacientes</a></li>
										<li><a href="doctor.jsp">Personal Médico</a></li>
										<li><a href="medicinas.jsp">Medicinas</a></li>
										
									</ul>
								</section>
						
						</div>
					
						<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Instituto Politécnico Nacional</h2>
									<ul class="style2">
										<li><a href="www.ipn.mx">Pagina Principal</a></li>
										<li><a href=""><img src="images/ipn.png" width="110" height="130"></a></li>
										
									</ul>
								</section>
						
						</div>
						<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Escuela Superior de Cómputo</h2>
									<ul class="style2">
										<li><a href="www.escom.ipn.mx">Página Principal</a></li>
									<!--  <li><a href="https://maps.google.com.mx/maps?ie=UTF-8&q=Escom&fb=1&gl=mx&hq=escom&hnear=0x85d1f8d4f06a3269:0xa79656ce3ffc06e5,Cuauht%C3%A9moc,+Ciudad+de+M%C3%A9xico,+D.F.&cid=10267197334802280834&ei=mmeVUuCpNIa92wWJ_4HoBw&ved=0CKcBEPwSMA8">Ubicación</a></li>-->	
									<li><a href="">	<img src="images/escom.png" height="130" width="160"></a></li>
									</ul>
								</section>
						
						</div>
						
						<div class="3u">
						
							<!-- Contact -->
								<section class="widget-contact last">
									<h2>Contactanos</h2>
									<ul>
										<li><a href="#" class="fa fa-facebook solo"><span>Facebook</span></a></li>
										<li><a href="#" class="fa fa-twitter solo"><span>Twitter</span></a></li>
										<li><a href="#" class="fa fa-google-plus solo"><span>Google+</span></a></li>
										<li><a href="#" class="fa fa-envelope-o solo"><span>Email</span></a></li>
									</ul>
									<p>	Guillermo Massieu H. 239, Residencial La Escalera, Gustavo A. Madero, 07320 <br />
									Ciudad de México, Distrito Federal<br />
									01 55 5729 6000 ext. 55500</p>
								</section>
						
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<div id="copyright">
								&copy; IPNClinic. Derechos en trámite. | Diseño en : <a href="#">HTML5 y CSS3</a>
							</div>
						</div>
					</div>
				</footer>
			</div>

	</body>
</html>