package logicaNegocio;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;

import java.sql.*;
/**
 * Servlet implementation class QueryStatement
 */
@WebServlet("/login")
public class QueryStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryStatement() {
        super();
        //System.out.println("bien ahi");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param pass2 
	 * @param user2 
	 * @throws SQLException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public void authenticate(HttpServletRequest request, HttpServletResponse response,String user2, String pass2) throws SQLException{
      	
    	Connection conexion = null;
    	String driver = "com.mysql.jdbc.Driver";
    	String user = "root";
    	String pass = "n0m3l0s3";
    	String url = "jdbc:mysql://localhost:3306/ipnclinicdb";
    	try{    		
    	//	session.setAttribute("conexion", conexion);
    		Class.forName(driver);
    		conexion = DriverManager.getConnection(url,user,pass);
    		PreparedStatement stm = conexion.prepareStatement("SELECT username FROM paciente WHERE username = ? AND pass_paciente = ?");
    		PreparedStatement stm2 = conexion.prepareStatement("SELECT user_med FROM personal_medico WHERE user_med = ? AND pass_med = ?");
    		PreparedStatement stm3 = conexion.prepareStatement("SELECT user_admin FROM admin WHERE user_admin = ? AND pass_admin = ?");
    		stm.setString(1,user2);
    		stm.setString(2,pass2);
    		stm2.setString(1,user2);
    		stm2.setString(2,pass2);
    		stm3.setString(1, user2);
    		stm3.setString(2, pass2);
    		//System.out.println(stm);
    		ResultSet rs = stm.executeQuery();
    		ResultSet rs2 = stm2.executeQuery();
    		ResultSet rs3 = stm3.executeQuery();
    		String tipo;
    		PrintWriter out = response.getWriter();
    		if(rs.next()){
    			System.out.println("Usuario encontrado!");
    			String usuario = rs.getString("username");
    			System.out.println("Bienvenido " + usuario);
    			
    			tipo = "us";
				out.println ("<script>location.href='paciente.jsp?user="+usuario+"&tipo="+tipo+"';</script> ");
				
    			//dispatcher.forward(request,response);
    			//response.sendRedirect("welcome.html");
    		}
    		else if(rs2.next()){
    			String med = rs2.getString("user_med");
    			System.out.println("Medico encontrado!");
    			System.out.println("Bienvenido " + rs2.getString("user_med"));
    			tipo = "md";
    			out.println ("<script>location.href='doctor.jsp?user="+med+"&tipo="+tipo+"';</script> ");
    		}
    		else if(rs3.next()){
    			String admin = rs3.getString("user_admin");
    			System.out.println("Administrador encontrado!");
    			System.out.println("Bienvenido " + rs3.getString("user_admin"));
    			tipo = "ad";
    			out.println ("<script>location.href='admin.jsp?user="+admin+"&tipo="+tipo+"';</script> ");
    			
    		}
    		else {
    			out.println("<script>alert('Usuario no encontrado'); location.href='index.jsp';</script>");
    		}
    		
    		
    	//	System.out.println("bien01");
    		
    			//System.out.println("bien02");
    		
    		
    	}catch (Exception e){
    		System.out.println(e);
    	}
    	
    	conexion.close();
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		try {
			authenticate(request, response, user,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		try {
			authenticate(request, response, user,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
