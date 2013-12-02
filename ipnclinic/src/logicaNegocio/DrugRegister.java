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
@WebServlet("/medicament")
public class DrugRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrugRegister() {
        super();
        // TODO Auto-generated constructor stub
    }
   
    public void insertinto(HttpServletRequest request,
			HttpServletResponse response, String descripcion, String presentacion, String laboratorio, String nommed,String compuesto,String indicaciones,String contraindicaciones,String precauciones,String reacciones,String dosis,String viaadmon) throws SQLException,
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
					.prepareStatement("INSERT INTO medicinas (`desc_medicina`,`presentacion`,`laboratorio`,`nom_med`,`compuesto_activo`,`indic_med`,`contra_med`,`prec_med`,`reac_med`,`dosis_med`,`via_admon_med`) VALUES(?,?,?,?,?,?,?,?,?,?,?) ");
			System.out.println("funciono 02");
			
			stm.setString(1, descripcion);
			stm.setString(2, presentacion);
			stm.setString(3, laboratorio);
			stm.setString(4, nommed);
			stm.setString(5, compuesto);
			stm.setString(6, indicaciones);
			stm.setString(7, contraindicaciones);
			stm.setString(8, precauciones);
			stm.setString(9, reacciones);
			stm.setString(10, dosis);
			stm.setString(11, viaadmon);
			
			
			

			System.out.println(stm);
			if (stm.executeUpdate() == 1) {
				System.out.println("bien ahi");
				PrintWriter out = response.getWriter();
				out.println ("<script>alert('Medicamento registrado'); location.href='agregarmed.jsp';</script>");
			//	response.sendRedirect("okRegister.html");
			} else {
				PrintWriter out = response.getWriter();
				out.println ("<script>alert('Medicamento NO registrado'); location.href='agregarmed.jsp';</script>");
			//	response.sendRedirect("badRegister.html");
				System.out.println("mal ahi");
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
		
		String nommed = request.getParameter("nommed");
		String presentacion = request.getParameter("presentacion");
		//String compac= request.getParameter("compac");
		String indicaciones = request.getParameter("indicaciones");
		String contraindicaciones = request.getParameter("contraindicaciones");
		String compuesto = request.getParameter("compac");
		String precauciones = request.getParameter("precauciones");
		String reacciones= request.getParameter("reacciones");
		String dosis = request.getParameter("dosis");
		String viaadmon = request.getParameter("viaadmon");
		String laboratorio = request.getParameter("laboratorio");
		String descripcion = request.getParameter("descripcion");
		
		

		
		
		try {

			
			insertinto(request, response, descripcion,presentacion,laboratorio,nommed,compuesto,indicaciones,contraindicaciones,precauciones,reacciones,dosis,viaadmon);
				//EnviadorMail EnviadorMail = new EnviadorMail(email, "Tu registro en IPNClinic", "¡Hola!, nos da mucho gusto que te hayas registrado en el sitio, tus datos son:\n Nombre de usuario:" +username+ "\n Contraseña:" +passw+ "\n Nombre:" +nombre + apep + apem +  "\n Correo:" +email+ "\n" );
				//System.out.println("Correo enviado");
				System.out.println("CORRECTO");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.println ("<script>alert('Falla en el registro de medicamento'); location.href='medicamento.jsp';</script>");
			//response.sendRedirect("badRegister.html");
			System.out.println(e);
		}

	}

}
