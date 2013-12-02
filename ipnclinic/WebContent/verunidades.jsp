<!DOCTYPE HTML>
<%@page import="dao.BDAccess"%>
<%@page import="model.ConsultaMed"%>
<%@ page import="java.util.LinkedList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

							<h2>Listado de Unidades Médicas</h2>
							<p>Aqui puede consultar todas las unidades del sistema
							</p>

							<footer style="overflow-x: scroll; max-width: 100%; font-size:22px">
								<table border="1" align="center" style="font-size:17px">
									   <thead>
            <tr>
                <th>Unidad Numero</th>
                <th>Nombre Unidad</th>
                <th>Dirección</th>
                <th>Servicios</th>
                <th>Descuento</th>
                <th>Cantidad Consultada</th>
                <th>Consultorio Disponible</th>
                <th>Subespecialidad</th>
                <th>Consultorio Relacionado</th>
                <th colspan=2>Operacion</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.nombreunidad}" /></td>
                    <td><c:out value="${user.direccion}" /></td>
                    <td><c:out value="${user.servicios}" /></td>
                    <td><c:out value="${user.descuento}" /></td>
                  
                    <td><c:out value="${user.cantidad_consultada}" /></td>
                    <td><c:out value="${user.consul_disp}" /></td>
                    <td><c:out value="${user.subespecialidad}" /></td>
                    <td><c:out value="${user.consul_rel}" /></td>
                    <td><a class="fa fa-pencil-square-o" style="font-size: 20px;"
													href="UnidController?action=edit&userId=<c:out value="${user.userid}"/>"></a>
												</td>
												<td><a class="fa fa-ban" style="font-size: 20px;"
													href="UnidController?action=delete&userId=<c:out value="${user.userid}"/>"></a>
												</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
								<p>
									
								</p>
								<table style="float: left; max-width: 100%">

								</table>
<a href="UnidController?action=insert"><img src="images/add.png"
										width="36px">Agregar Unidad Médica
									</a>
							</footer>




							<div class="iphone span5"></div>
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