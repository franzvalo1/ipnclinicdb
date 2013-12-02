<!DOCTYPE HTML>
<html>
	<head>
		<title>IPN Clinic</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,800" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Oleo+Script:400" rel="stylesheet" type="text/css" />
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="css/style.css">
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
	<body class="homepage">
<% 
    String user = request.getParameter("user");
	String tipo = request.getParameter("tipo");
	String p = request.getParameter("asd");
	System.out.println(p);
	if(user==null){
		out.println ("<script>alert('No tienes permisos para acceder a �sta p�gina');history.go(-1);</script> ");
	}
    if(tipo.contains("us")){
    	out.println ("<script>alert('No tienes permisos para acceder a �sta p�gina');history.go(-1);</script> "); }
    	//
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
											<span>Servicios M�dicos Polit�cnicos</span>
										</div>
									
									<!-- Nav -->
										<nav id="nav">
											<ul>
												<li ><a href="index.jsp">Cerrar sesion <% out.println(user); %></a></li>
												<li><a href="paciente.jsp?user=<%=user%>&tipo=<%=tipo%>">Pacientes</a></li>
												<li class="current_page_item"><a href="doctor.jsp?user=<%=user%>&tipo=<%=tipo%>">Personal M�dico</a></li>
												<li ><a href="medicinas.jsp?user=<%=user%>&tipo=<%=tipo%>">Medicamentos</a></li>
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
						<div class="8u skel-cell-important">

							<!-- Content -->
								<div id="content">
									<article class="last">

										<h2>Personal M�dico</h2>
									
										
										<p>�sta area est� destinada para  la consulta del expediente clinico de los pacientes.</p>
										<p>Aqu� el personal m�dico podr� ser consultado as� como el consultorio relacionado y las unidades medicas d�nde existe atenci�n m�dica</p>
										
										<h3></h3>
										<p align="center">
										<img src="doc.png" alt="doctores">
										<img src="doctor.png" alt="doctores">
										</p>
										<p>Horarios de atenci�n.</p>

										<p>Turno Matutino tiene un horario de 8:00 a 14:00 de lunes  a  viernes, es atendido por 5 profesores con nombramiento de profesor asociado y que se encargan de la consulta externa, adem�s gu�an a los alumnos durante su estancia en la cl�nica como parte de la formaci�n acad�mica de la especialidad y vigilan la elaboraci�n de la parte experimental los proyectos de tesis que tienen que llevar a cabo para la culminaci�n de su formaci�n profesional.

El Turno vespertino que inicia a las 15:00 y termina a las 21:00, es atendido por 4 especialistas egresados del programa de la especialidad que adem�s apoyan a los alumnos que desean tener m�s pr�ctica o que realizan sus proyectos de investigaci�n en ese horario

El turno sabatino tiene un horario de 8:00 a 15:00 y surge por la necesidad de dar la parte de la pr�ctica cl�nica y elaboraci�n de proyectos a los alumnos del primer programa de acreditaci�n de m�dicos acupunturistas, en donde la mayor�a de alumnos ven�an de los diferentes estados de la Rep�blica Mexicana y donde acuden los alumnos y dos profesores que gu�an y supervisan la pr�ctica; posteriormente se tuvo que mantener este horario ya que se increment� la demanda, aumentando el n�mero de las consultas.</p>

									</article>
								</div>

						</div>
						<div class="4u">
						
							<!-- Sidebar -->
								<div id="sidebar">

									<section>
									
										<footer>
											<form action='receta.jsp?user=<%=user %>' method='post' class="button big fa fa-medkit" style="font-size: 25px; width: 400px;">
													Generar Receta: <br>
													<br>
													CURP Paciente:<br>
													<input type="text" name="curp">
													<br>
													</form>
													<br><br>
											<form action='expediente.jsp' method='post' class="button big fa fa-user-md" style="font-size: 25px; width: 400px;">
													Consultar expediente: <br>
													<br>
													CURP Paciente:<br>
													<input type="text" name="curp">
													<br>
													</form>
													<br><br>
											<form action='agregarexp.jsp' method='post' class="button big fa fa-pencil-square-o" style="font-size: 25px; width: 400px;">
Agregar al expediente: <br>
													<br>
													CURP Paciente:<br>
													<input type="text" name="curp">
													<br>
													</form>
													<br><br>
											
										
										</footer>
									</section>

									<section>
										<h3>Horarios Atenci�n</h3>
										<ul class="style2">
											<li><a href="#">Turno Matutino 8:30 - 14:00</a></li>
											<li><a href="#">Turno Vespertino 15:00 - 21:00 </a></li>
											<li><a href="#">Sabatino - 8:00-15:00</a></li>
											
										</ul>
									</section>

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
										<li><a href="index.jsp">P�gina Principal de IPNClinic</a></li>
										<li><a href="paciente.jsp">Pacientes</a></li>
										<li><a href="doctor.jsp">Personal M�dico</a></li>
										<li><a href="medicinas.jsp">Medicinas</a></li>
										
									</ul>
								</section>
						
						</div>
					
						<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Instituto Polit�cnico Nacional</h2>
									<ul class="style2">
										<li><a href="www.ipn.mx">Pagina Principal</a></li>
										<li><a href=""><img src="images/ipn.png" width="110" height="130"></a></li>
										
									</ul>
								</section>
						
						</div>
						<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Escuela Superior de C�mputo</h2>
									<ul class="style2">
										<li><a href="www.escom.ipn.mx">P�gina Principal</a></li>
									<!--  <li><a href="https://maps.google.com.mx/maps?ie=UTF-8&q=Escom&fb=1&gl=mx&hq=escom&hnear=0x85d1f8d4f06a3269:0xa79656ce3ffc06e5,Cuauht%C3%A9moc,+Ciudad+de+M%C3%A9xico,+D.F.&cid=10267197334802280834&ei=mmeVUuCpNIa92wWJ_4HoBw&ved=0CKcBEPwSMA8">Ubicaci�n</a></li>-->	
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
									Ciudad de M�xico, Distrito Federal<br />
									01 55 5729 6000 ext. 55500</p>
								</section>
						
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<div id="copyright">
								&copy; IPNClinic. Derechos en tr�mite. | Dise�o en : <a href="#">HTML5 y CSS3</a>
							</div>
						</div>
					</div>
				</footer>
			</div>

	</body>
</html>
