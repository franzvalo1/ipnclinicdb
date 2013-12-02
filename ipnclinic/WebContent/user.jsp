<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<%@page import="dao.BDAccess"%>
<%@page import="model.ConsultaMed"%>
<%@ page import="java.util.LinkedList"%>
<html>
<head>
<title>IPN Clinic</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,800"
	rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Oleo+Script:400"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
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

	<!-- Header Wrapper -->
	<div id="header-wrapper">
		<div class="container">
			<div class="row">
				<div class="12u">

					<!-- Header -->
					<header id="header">

						<!-- Logo -->
						<div id="logo">
							<h1>
								<a href="#" id="logo">IPN Clinic</a>
							</h1>
							<span>Servicios Médicos Politécnicos</span>
						</div>

						<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.jsp">Bienvenido</a>
								</li>
								<li><a href="paciente.jsp">Pacientes</a>
								</li>
								<li><a href="doctor.jsp">Personal Médico</a>
								</li>
								<li class="current_page_item"><a href="medicinas.jsp">Medicamentos</a>
								</li>
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

							<h2>Personal<span class="red"><strong> Médico</strong><i class="fa fa-ambulance"></i> </span></h2>
							<p>A continuación puede agregar personal medico al sistema</p>

							<footer>

								<form method="POST" action='UserController' name="frmAddUser">
									<div align="center">


										<hr>
										<table style="float: left; max-width: 100%">
											
												
												<input type="hidden" readonly="readonly"
													name="userid" value="<c:out value="${user.userid}" />" />
												
											
											<tr>
												<td>Nombre :</td>
												<td><input type="text" name="nombre"
													value="<c:out value="${user.nombre}" />" /></td>
											<tr>
												<td>Apellido Paterno:</td>
												<td><input type="text" name="apellidopaterno"
													value="<c:out value="${user.apellidopaterno}" />" /></td>
											</tr>
											<tr>
												<td>Apellido Materno :</td>
												<td><input type="text" name="apellidomaterno"
													value="<c:out value="${user.apellidomaterno}" />" /></td>
											</tr>
											<tr>
												<td>Especialidad :</td>
												<td><input type="text" name="especialidad"
													value="<c:out value="${user.especialidad}" />" />
												</td>
											</tr>
											<tr>
												<td>Cedula profesional :</td>
												<td><input type="text" name="cedula"
													value="<c:out value="${user.cedula}" />" /></td>
											</tr>
											<tr>
												<td>Tipo personal:</td>
												<td><input type="text" name="tipo"
													value="<c:out value="${user.tipo}" />" /></td>

											</tr>
											<tr>
												<td>Subespecialidad:</td>
												<td><input type="text" name="subespecialidad"
													value="<c:out value="${user.subespecialidad}" />" /></td>

											</tr>
											<tr>
												<td>Consultorio Relacionado:</td>
												<td><input type="text" name="consultorio_rel"
													value="<c:out value="${user.consultorio_rel}" />" /></td>

											</tr>
											<tr>
												<td>Usuario:</td>
												<td><input type="text" name="user_med"
													value="<c:out value="${user.user_med}" />" /></td>

											</tr>
											<tr>
												<td>Contraseña:</td>
												<td><input type="password" name="pass_med"
													value="<c:out value="${user.pass_med}" />" /></td>

											</tr>
											
										</table>
										
										<hr>
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Agregar Personal Médico" class="button big fa fa-check-circle-o"  style="font-size: 25px; width: 400px;"/>
								</form>
								

							</footer>
							




							<div class="iphone span5"><br><br><img src="images/medico.jpg" alt="doctor" width="450" height="800"></div>
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
							<li><a href="index.jsp">Página Principal de IPNClinic</a>
							</li>
							<li><a href="paciente.jsp">Pacientes</a>
							</li>
							<li><a href="doctor.jsp">Personal Médico</a>
							</li>
							<li><a href="medicinas.jsp">Medicinas</a>
							</li>

						</ul>
					</section>

				</div>

				<div class="3u">

					<!-- Links -->
					<section class="widget-links">
						<h2>Instituto Politécnico Nacional</h2>
						<ul class="style2">
							<li><a href="www.ipn.mx">Pagina Principal</a>
							</li>
							<li><a href=""><img src="images/ipn.png" width="110"
									height="130"> </a>
							</li>

						</ul>
					</section>

				</div>
				<div class="3u">

					<!-- Links -->
					<section class="widget-links">
						<h2>Escuela Superior de Cómputo</h2>
						<ul class="style2">
							<li><a href="www.escom.ipn.mx">Página Principal</a>
							</li>
							<!--  <li><a href="https://maps.google.com.mx/maps?ie=UTF-8&q=Escom&fb=1&gl=mx&hq=escom&hnear=0x85d1f8d4f06a3269:0xa79656ce3ffc06e5,Cuauht%C3%A9moc,+Ciudad+de+M%C3%A9xico,+D.F.&cid=10267197334802280834&ei=mmeVUuCpNIa92wWJ_4HoBw&ved=0CKcBEPwSMA8">Ubicación</a></li>-->
							<li><a href=""> <img src="images/escom.png" height="130"
									width="160"> </a>
							</li>
						</ul>
					</section>

				</div>

				<div class="3u">

					<!-- Contact -->
					<section class="widget-contact last">
						<h2>Contactanos</h2>
						<ul>
							<li><a href="#" class="fa fa-facebook solo"><span>Facebook</span>
							</a>
							</li>
							<li><a href="#" class="fa fa-twitter solo"><span>Twitter</span>
							</a>
							</li>
							<li><a href="#" class="fa fa-google-plus solo"><span>Google+</span>
							</a>
							</li>
							<li><a href="#" class="fa fa-envelope-o solo"><span>Email</span>
							</a>
							</li>
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