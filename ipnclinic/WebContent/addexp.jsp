<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@page import="java.sql.*" %>
<%
String id_paciente = request.getParameter("id_paciente");
String tratamientos =request.getParameter("tratamientos");
String notas_hosp = request.getParameter("notas_hosp");
String notas_quirur = request.getParameter("notas_quirur");
String interconsultas = request.getParameter("interconsultas");
String repo_radiolog = request.getParameter("repo_radiolog");
String exa_lab = request.getParameter("exa_lab");
String notas_ambulatorias = request.getParameter("notas_ambulatorias");

Class.forName("com.mysql.jdbc.Driver");
Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
PreparedStatement stm = conexion.prepareStatement("INSERT INTO `expclin` (`tratamientos`, `notas_hosp`, `notas_quirur`, `interconsultas`, `repo_radiolog`, `exa_lab`, `notas_ambulatorias`, `id_paciente`) VALUES (?,?,?,?,?,?,?,?)");
stm.setString(1,tratamientos);
stm.setString(2,notas_hosp);
stm.setString(3,notas_quirur);
stm.setString(4,interconsultas);
stm.setString(5,repo_radiolog);
stm.setString(6,exa_lab);
stm.setString(7,notas_ambulatorias);
stm.setString(8,id_paciente);
stm.executeUpdate();
 
// java.util.Date dt=new java.util.Date();
 out.print("<h1 style='font-size:20px;'> Agregado al expediente con éxito</h1>");
 
 //
%>