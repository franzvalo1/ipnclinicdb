<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

    <head>

        <meta charset="utf-8">
        <title>IPNClinic - Registro</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="css/style.css">
        

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
	 
        <div class="header">
      
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><span class="blue"><a href="registro.jsp">IPNClinic.</span></a></h1>
                        <i class="e"></i>
                    </div>
                    <div class="links span8">
                        <a class="fa fa-home" href="index.jsp" data-placement="bottom" data-original-title="Principal" style="font-size: 15px;">Principal</a>
           
                    </div>
                </div>
            </div>
        </div>

        <div class="register-container container">
            <div class="row">
                <div class="iphone span5">
                    <img src="assets/img/iphone.png" alt="Registro">
                </div>
                <div class="register span6">
                 
                    <form action="register" method="post">
                    
                        <h2>Registrarse en<span class="red"><strong> IPNClinic</strong></span></h2>
                         <p align="left">
                         <label for="nombrep">Nombre del Paciente</label>
                        <input type="text" id="nombrep" name="nombre" placeholder="Introduce tu nombre...">
                        <label for="apep">Apellido Paterno</label>
                        <input type="text" id="apep" name="apep" placeholder="Apellido paterno...">
                        <label for="apem">Apellido Materno</label>
                        <input type="text" id="apem" name="apem" placeholder="Apellido materno...">
                        <label for="curp">CURP</label>
                        <input type="text" id ="curp" name="curp" placeholder="Introduce tu CURP...">
                        <label for="username">Usuario</label>
                        <input type="text" id="username" name="username" placeholder="Ingrese su usuario...">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" placeholder="Ingrese su correo electronico...">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Elija una contraseña...">
                        <label for="nivsoc">Nivel Socioeconomico</label>
                       <select name="nivsoc">
                       		<option value="Alta">Alta</option>
                       		<option value="Media"> Media </option>
                       		<option value="Baja"> Baja </option>
                       </select>
                      
                        <label for="vivienda">Vivienda</label>
                        <select name="vivienda">
                        	<option value="tierracem">Tierra/Cemento</option>
                        	<option value="otro"> Otro acabado </option>
                        </select>
                        <label for="tiposan">Tipo Sanguineo</label>
                        <select name="tipos">
                        <option value="Opos">O+</option>
                        <option value="Oneg">O-</option>
                        <option value="Aneg">A-</option>
                        <option value="Apos">A+</option>
                        <option value="Bneg">B-</option>
                        <option value="Bpos">B+</option>
                        <option value="ABneg">AB-</option>
                        <option value="ABpos">AB+</option>
                        <option value="sinespec"> Sin especificar </option>
                        </select>
                        <label for="disca">¿Padece alguna discapacidad?</label>
                        <input type="text" id="disca" name="disca" placeholder="Escriba su discapacidad">
                        <label for="grupoet">¿Pertenece a algún grupo étnico?</label>
                        <input type="text" id="grupoet" name="grupoet" placeholder="Si no pertenece a ninguno dejelo en blanco">
                        <label for="religion">Religión:</label>
                        <input type="text" id="religion" name="religion" placeholder="Introduzca la religión que profesa">
                        <label for="captcha">Captcha</label>
                        <% ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Ld0R-cSAAAAABG0cX2DJwxNiC6IN_aBm5d4QGG-","6Ld0R-cSAAAAADkc79NWZ-K9OdGvO1byTK2a1AW7",false); 
						out.print(c.createRecaptchaHtml(null, null));
					%> 
                         </p>
                        <button type="submit">REGISTRAR</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>

