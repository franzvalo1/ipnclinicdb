package logicaNegocio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mail.EnviadorMail;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 * Servlet implementation class registro
 */
@WebServlet("/register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    public int captcha(HttpServletRequest request,
			HttpServletResponse response, String challengeu, String response1)
			throws IOException {
		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6Ld0R-cSAAAAADkc79NWZ-K9OdGvO1byTK2a1AW7");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr,
				challengeu, response1);

		if (reCaptchaResponse.isValid()) {
			System.out.println("Answer was entered correctly!");

		} else {
			System.out.println("Answer is wrong");
			return 1;
		}
		return 0;

	}

    public void insertinto(HttpServletRequest request,
			HttpServletResponse response, String curp, String nombre_paciente,
			String apep, String apem, String nivelsoc, String vivienda, String tiposang, String discapacidad, String grupoet, String religion, String emailpac, String username, String passwd) throws SQLException,
			IOException {
		Connection conexion = null;
		String driver = "com.mysql.jdbc.Driver";
		String user = "root";
		String pass = "n0m3l0s3";
		String url = "jdbc:mysql://localhost:3306/ipnclinicdb";
		try {
			Class.forName(driver);
			conexion = DriverManager.getConnection(url, user, pass);
			System.out.println("funciono 01");
			PreparedStatement stm = conexion
					.prepareStatement("INSERT INTO paciente (`CURP`,`nombre_paciente`,`apep_paciente`,`apem_paciente`,`nivel_soc`,`vivienda`,`tipo_sanguineo`,`discapacidad`,`grupo_etnico`,`religion`,`emailpac`,`username`, `pass_paciente`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			System.out.println("funciono 02");
			// stm.setString(0, "idusuarios");
			/*
			 * stm.setString(1, "`user`"); stm.setString(2, "`passusu`");
			 * stm.setString(3, "`nombreusu`"); stm.setString(4, "`apeusu`");
			 * stm.setString(5, "`mailusu`");
			 */
			stm.setString(1, curp);
			stm.setString(2, nombre_paciente);
			stm.setString(3, apep);
			stm.setString(4, apem);
			stm.setString(5, nivelsoc);
			stm.setString(6, vivienda);
			stm.setString(7, tiposang);
			stm.setString(8, discapacidad);
			stm.setString(9, grupoet);
			stm.setString(10, religion);
			stm.setString(11, emailpac);
			stm.setString(12, username);
			stm.setString(13, passwd);
			

			System.out.println(stm);
			if (stm.executeUpdate() == 1) {
				System.out.println("bien ahi");
				
				PrintWriter out = response.getWriter();
				out.println ("<script>alert('Usuario registrado'); location.href='index.jsp';</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println ("<script>alert('Falla en el registro'); location.href='error.jsp';</script>");
			}

		} catch (Exception e) {
			response.sendRedirect("badRegister.html");
			System.out.println(e);
		}

	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apep = request.getParameter("apep");
		String apem = request.getParameter("apem");
		String curp = request.getParameter("curp");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String passw = request.getParameter("password");
		String nivelsoc = request.getParameter("nivsoc");
		String vivienda = request.getParameter("vivienda");
		String tiposangre = request.getParameter("tipos");
		String discapacidad = request.getParameter("disca");
		String grupoet = request.getParameter("grupoet");
		String religion = request.getParameter("religion");
		

		String challenge = request.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		
		try {

			if (captcha(request, response, challenge, uresponse) == 1) {
				PrintWriter out = response.getWriter();
				out.println ("<script>alert('Captcha Incorrecto'); location.href='registro.jsp';</script>");
				
				//response.sendRedirect("WrongCaptcha.jsp");
			} else {
			insertinto(request, response, curp, nombre, apep, apem, nivelsoc, vivienda, tiposangre, discapacidad, grupoet, religion, email,username,passw);
				EnviadorMail EnviadorMail = new EnviadorMail(email, "Tu registro en IPNClinic", "¡Hola!, nos da mucho gusto que te hayas registrado en el sitio, tus datos son:\n Nombre de usuario:" +username+ "\n Contraseña:" +passw+ "\n Nombre:" +nombre + apep + apem +  "\n Correo:" +email+ "\n" );
				System.out.println("Correo enviado");
				System.out.println("CORRECTO");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println ("<script>alert('Falla en el registro'); location.href='registro.jsp';</script>");
			//response.sendRedirect("badRegister.html");
			System.out.println(e);
		}

	}

}
