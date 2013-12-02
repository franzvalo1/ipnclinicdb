<%@page import="com.hibernate.crud.simple.RecetaMedicaContacto"%>
<%@page import="com.hibernate.crud.simple.RecetaInsertHibernate"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>


<%@page import="java.sql.*" %>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction" %>

<%
String curp = request.getParameter("curp");
String idpac = request.getParameter("idpac");
String idcita = request.getParameter("idcita");
String iddoc = request.getParameter("iddoc");
String nomdoc = request.getParameter("doc");
String fecha = request.getParameter("datepicker");
String medicina = request.getParameter("med");
String desc = request.getParameter("desc");
String nompac = request.getParameter("nompac");



RecetaInsertHibernate sh = new RecetaInsertHibernate();
RecetaMedicaContacto receta = new RecetaMedicaContacto();
receta.setIdreceta(1);
receta.setIdpaciente(Integer.parseInt(idpac));
receta.setIdcita(Integer.parseInt(idcita));
receta.setIddoc(Integer.parseInt(iddoc));
receta.setFecha_exp(fecha);
receta.setDesc_rec(desc);
receta.setMedicina(Integer.parseInt(medicina));
sh.salvareceta(receta);
//System.out.println("Exito");

out.println("<h1 style='font-size:20px;'>¡Receta Generada Exitosamente!</h1>");
//out.println("<iframe src='Docs/file.pdf' width='695' height='595'></iframe>");
 
// java.util.Date dt=new java.util.Date();
 
 
 //
%>