<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@page import="java.sql.*" %>
<%
String nompac = request.getParameter("nompac");
String fecha = request.getParameter("fecha");
String unidadatencion = request.getParameter("unidadatencion");
int iunidadatencion = 0;
String nombrepaciente = "";
Class.forName("com.mysql.jdbc.Driver");
Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
PreparedStatement stm = conexion.prepareStatement("INSERT INTO `cita` (`paciente`, `fecha`, `unidad_atencion`) VALUES (?,?,?)");
stm.setString(1,nompac);
stm.setString(2,fecha);
PreparedStatement stm2 = conexion.prepareStatement("SELECT idunidad_atencion FROM unidad_atencion WHERE nombre_unidad = ?");
stm2.setString(1,unidadatencion);
ResultSet rs = stm2.executeQuery();
while(rs.next()){
	iunidadatencion = rs.getInt("idunidad_atencion"); 
	
}
stm.setInt(3,iunidadatencion);
stm.executeUpdate();
//System.out.println("cita creada");
out.print("Agregado al expediente con éxito");




 
// java.util.Date dt=new java.util.Date();

 
 //
%>