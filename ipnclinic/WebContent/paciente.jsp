<!DOCTYPE HTML>
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
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
		<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
	</head>
	
	<body class="left-sidebar">
    <%
    
    String user = request.getParameter("user");
    String tipo = request.getParameter("tipo");
   
    
    if(!tipo.contains("us")){
    	System.out.println("usuario vario");
    	out.println ("<script>location.href='error.jsp';</script> ");
    }
    else if (tipo.contains("no")){
    	out.println ("<script>alert('No tienes permisos para acceder a ésta página'); location.href='error.jsp';</script> ");
    }
    
    
   
    
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
												<li><a href="index.jsp?user=<%=user%>&tipo=<%=tipo%>">Cerrar sesion <%  %></a></li>
												<li class="current_page_item"><a href="paciente.jsp?user=<%=user%>&tipo=<%=tipo%>">Pacientes</a></li>
												<li><a href="doctor.jsp?user=<%=user%>&tipo=<%=tipo%>">Personal Médico</a></li>
												<li><a href="medicinas.jsp?user=<%=user%>&tipo=<%=tipo%>">Medicamentos</a></li>
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
										<h3>Bienvenido  <% out.println(user); %></h3>
										<p>En la parte inferior tienes las distintas acciones que como paciente puedes realizar.</p>
										<footer>
											<a href="gencita.jsp?user=<%=user %>" class="button fa fa-info-circle">Generar Cita</a><br><br>
											<a href="#" class="button fa fa-info-circle">Consultar expediente</a><br><br>
											<a href="UnidController?action=listUser" class="button fa fa-info-circle">Consultar Unidades de Atención</a><br><br>
										</footer>
									</section>
<!-- 
									<section>
										<h3>Subheading</h3>
										<ul class="style2">
											<li><a href="#">Amet turpis, feugiat et sit amet</a></li>
											<li><a href="#">Ornare in hendrerit in lectus</a></li>
											<li><a href="#">Semper mod quis eget mi dolore</a></li>
											<li><a href="#">Quam turpis feugiat sit dolor</a></li>
											<li><a href="#">Amet ornare in hendrerit in lectus</a></li>
											<li><a href="#">Semper mod quisturpis nisi</a></li>
										</ul>
									</section>
 -->
								</div>
						
						</div>
						<div class="8u skel-cell-important">

							<!-- Content -->
								<div id="content">
									<article class="last">

										<h2></h2>
<h1 class="fa fa-exclamation-circle" style="font-size: 2em;"> Información importante </h1><br>
										<p>Para poder ser paciente de cualquiera de las unidades de atención para los servicios
										que éstas ofrecen (dental, optometría, psicología) se requiere ser obtener una cita y tener
										una cuenta registrada de paciente dentro del sitio, la cita se generará de acuerdo a la disponibilidad en calendario.</p>
										
										<h3>Instrucciones:</h3>
										<p>Haga clic en el botón "Generar Cita" que aparece a su derecha</p>

										<p>Genere una cita seleccionando el día de su agrado en el calendario, posteriormente le llegará un correo electrónico
										confirmando dicha cita, usted puede consultar las unidades de atención disponibles y los servicios que ofrece.</p>

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