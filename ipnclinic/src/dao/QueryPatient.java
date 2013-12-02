package dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import model.ConsultaMed;
import model.Paciente;

import com.mysql.jdbc.Connection;

public class QueryPatient {
	
	/**
	 * @return
	 */
	public static LinkedList<Paciente> paciente(){
		LinkedList<Paciente> listap = new LinkedList<Paciente>();
	try{
		Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = (Connection) DriverManager.getConnection(
           "jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
        PreparedStatement st = conexion.prepareStatement("SELECT * FROM paciente");
        ResultSet rs = st.executeQuery();
        	
        while(rs.next()){
        	Paciente paciente = new Paciente();
        	paciente.setIdpaciente(rs.getInt("id_paciente"));
        	paciente.setNombre(rs.getString("nombre_paciente"));
        	paciente.setApeppaciente(rs.getString("apep_paciente"));
        	paciente.setApempaciente(rs.getString("apem_paciente"));
        	paciente.setCurp(rs.getString("CURP"));
        	paciente.setNivel_soc(rs.getString("nivel_soc"));
        	paciente.setVivienda(rs.getString("vivienda"));
        	paciente.setTiposanguineo(rs.getString("tipo_sanguineo"));
        	paciente.setDiscapacidad(rs.getString("discapacidad"));
        	paciente.setGrupoetnico(rs.getString("grupo_etnico"));
        	paciente.setReligion(rs.getString("religion"));
        	paciente.setUsername(rs.getString("username"));
        	        	
        	listap.add(paciente);
        	//System.out.println(lista);
        }
        rs.close();
        st.close();
        conexion.close();
	}
	catch(Exception e){
		System.out.println(e);
		
	} 
	  return listap;
	}
}
