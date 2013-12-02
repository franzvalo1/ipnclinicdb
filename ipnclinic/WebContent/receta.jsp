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
	
	#page-wrap {
	margin: 20px auto;
	width: 750px;
}
		
	
	textarea#styled {
	width: 600px;
	height: 120px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-image: url(bg.gif);
	background-position: bottom right;
	background-repeat: no-repeat;
}

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
		String curp = request.getParameter("curp");
		String doc = "";
		System.out.println(curp);
		String nombre = "";
		LinkedList asd = new LinkedList();
		Class.forName("com.mysql.jdbc.Driver");
		Connection conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
		PreparedStatement stm = conexion
				.prepareStatement("SELECT * FROM expclin WHERE id_paciente = (SELECT id_paciente FROM paciente WHERE CURP = ?)");
		stm.setString(1, curp);
		System.out.println(stm);
		PreparedStatement stm2 = conexion
				.prepareStatement("SELECT id_paciente,nombre_paciente,CURP FROM paciente WHERE CURP = ? ");
		stm2.setString(1, curp);
		ResultSet rs = stm.executeQuery();
		ResultSet rs2 = stm2.executeQuery();
		int idpac = 0;
		int idcita = 0;
		int iddoc = 0;
		PreparedStatement stm3 = conexion
				.prepareStatement("SELECT idcita,paciente FROM cita WHERE (SELECT id_paciente FROM paciente WHERE CURP = ? )");
		stm3.setString(1, curp);
		ResultSet rs3 = stm3.executeQuery();
		while (rs3.next()) {
			idpac = rs3.getInt("paciente");
			idcita = rs3.getInt("idcita");

		}
		PreparedStatement stm4 = conexion
				.prepareStatement("SELECT idpersonal_medico,nom_med FROM personal_medico WHERE user_med=?");
		stm4.setString(1, user);
		ResultSet rs4 = stm4.executeQuery();
		while (rs4.next()) {
			doc = rs4.getString("nom_med");
			iddoc = rs4.getInt("idpersonal_medico");
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
												<li><a href="index.jsp">Cerrar sesion <%%></a></li>
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
						<div id="genrec"> </div>
					<SCRIPT Language="JavaScript">
					
						function showAndClearField(frm){
						  if(frm.datepicker.value == "")
							  alert("Favor de rellenar el campo de fecha de cita");
						  else if(frm.med.value=="")
							  alert("Favor de seleccionar un numero de medicamento");
						   else{	
						// alert(frm.curp.value  + frm.idpac.value + frm.idcita.value + frm.iddoc.value + frm.nomdoc.value + frm.datepicker.value + frm.med.value + frm.textarea.value);	
					  crearec(frm.curp.value,frm.idpac.value,frm.idcita.value,frm.iddoc.value,frm.nomdoc.value,frm.datepicker.value,frm.med.value,frm.textarea.value);
						  }
						     // alert("The field contains the text: " + frm.tratamientos.value + frm.notas_hosp.value + frm.notas_quirur.value + frm.interconsultas.value + frm.repo_radiolog.value + frm.exa_lab.value + frm.notas_ambulatorias.value);
						   
						}
						
						</SCRIPT>	
						
					<!-- Content -->
					<div id="content">
						<article class="last">
							<h2>Generar Receta Médica</h2>
						<%
							while (rs2.next()) {
								idpac = rs2.getInt("id_paciente");

								out.print("<h1 style='font-size:20px;'>  Nombre del paciente: "
										+ rs2.getString("nombre_paciente") + "</h1>");
								out.print("<h1 style='font-size:20px;'>  CURP: "
										+ rs2.getString("CURP") + "</h1>");
							}
						%>
						
				
						<p align="left">
                         
							<footer >
								
								<form>
									<input type="text" value="<%=curp%>" name="curp" disabled> 
									<%System.out.println(curp); %>
									<input type="hidden" value="<%=idpac%>" name="idpac">
									<%System.out.println(idpac); %> 
									<input type="hidden" value="<%=idcita%>" name="idcita">
									<%System.out.println(idcita); %> 
									<input type="hidden" value="<%=iddoc%>" name="iddoc">
									<%System.out.println(iddoc); %> 
									<label for="nomdoc">Nombre del Doctor</label>
									<input type="text" value="<%=doc%>" name="nomdoc" disabled>
									<%System.out.println(doc); %> 
									<label for="datepicker">Fecha de la cita</label>
									<input type="text" id="datepicker" name="datepicker" placeholder="Fecha de Cita...">
									<label for="med">Número de medicina</label> 
									<input type="text" name="med" placeholder="No de medicina" value=""> <br> <br> <br>
									<textarea name="textarea" id="styled" onfocus="this.value=''; setbg('#e5fff3');" onblur="setbg('white')">Inserta el contenido de la receta...</textarea><br>
									<input type="button" value="Generar Receta" class = "button fa fa-hospital-o" onClick="showAndClearField(this.form)" >
								
 								</form>
							
							</footer>
								
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