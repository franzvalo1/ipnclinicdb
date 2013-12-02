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
	String curp = request.getParameter("curp");	
	System.out.println(curp);
	String nombre = "";
	LinkedList asd = new LinkedList();
	Class.forName("com.mysql.jdbc.Driver");
	Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
	PreparedStatement stm = conexion.prepareStatement("SELECT * FROM expclin WHERE id_paciente = (SELECT id_paciente FROM paciente WHERE CURP = ?)");
	stm.setString(1,curp);
	System.out.println(stm);
	PreparedStatement stm2 = conexion.prepareStatement("SELECT nombre_paciente,CURP FROM paciente WHERE CURP = ? ");
	stm2.setString(1,curp);
	ResultSet rs = stm.executeQuery();
	ResultSet rs2 = stm2.executeQuery();
	
	
	%>

   <input type="hidden" value="holammm" name="asd">

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
				<div class="12u skel-cell-important">

					<!-- Content -->
					<div id="content">
						<article class="last">

							<h2>Receta Médica</h2>
						<% while(rs2.next()){out.print("<h1 style='font-size:20px;'>  Nombre del paciente: " +rs2.getString("nombre_paciente") + "</h1>");
						out.print("<h1 style='font-size:20px;'>  CURP: " +rs2.getString("CURP") + "</h1>");
						
						
						
						}
						
						%>
						<p align="left">
                         <table style="float:left; max-width:100%">
							<footer style="overflow-x:scroll;max-width:100% " >
							
								<tr>
										<th>Exp No</th>
										<th>Tratamientos</th>
										<th>Notas Hospitalarias</th>
										<th>Notas Quirurgicas</th>
										<th>Interconsultas</th>
										<th>Reportes Radiologia</th>
										<th>Examen de Laboratorio</th>
										<th>Notas ambulatorias</th>
										
										
									</tr>	
									<%
									while(rs.next()){
										out.println("<tr>");
										 out.println("<td>" + rs.getString("idexpclin") + "</td>");
										 out.println("<td>" +rs.getString("tratamientos") + "</td>");
										 out.println("<td>" +rs.getString("notas_hosp") + "</td>");
										 out.println("<td>" +rs.getString("notas_quirur") + "</td>");
										 out.println("<td>" +rs.getString("interconsultas") + "</td>");
										 out.println("<td>" +rs.getString("repo_radiolog") + "</td>");
										 out.println("<td>" +rs.getString("exa_lab") + "</td>");
										 out.println("<td>" +rs.getString("notas_ambulatorias") + "</td>");
										out.println("</tr>");
									}
									%>
							
							
							</footer>
								</table>
								</p>
							
							
							

						
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!-- Footer Wrapper -->
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
							<li><a href=""><img src="images/ipn.png" width="110"
									height="130"> </a></li>

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
							<li><a href=""> <img src="images/escom.png" height="130"
									width="160"> </a></li>
						</ul>
					</section>

				</div>

				<div class="3u">

					<!-- Contact -->
					<section class="widget-contact last">
						<h2>Contactanos</h2>
						<ul>
							<li><a href="#" class="fa fa-facebook solo"><span>Facebook</span>
							</a></li>
							<li><a href="#" class="fa fa-twitter solo"><span>Twitter</span>
							</a></li>
							<li><a href="#" class="fa fa-google-plus solo"><span>Google+</span>
							</a></li>
							<li><a href="#" class="fa fa-envelope-o solo"><span>Email</span>
							</a></li>
						</ul>
						<p>
							Guillermo Massieu H. 239, Residencial La Escalera, Gustavo A.
							Madero, 07320 <br /> Ciudad de México, Distrito Federal<br />
							01 55 5729 6000 ext. 55500
						</p>
					</section>

				</div>
			</div>
			<div class="row">
				<div class="12u">
					<div id="copyright">
						&copy; IPNClinic. Derechos en trámite. | Diseño en : <a href="#">HTML5
							y CSS3</a>
					</div>
				</div>
			</div>
		</footer>
	</div>

</body>
</html>
</html>