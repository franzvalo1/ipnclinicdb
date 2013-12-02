package dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import model.ConsultaMed;

import com.mysql.jdbc.Connection;

public class BDAccess {
	
	public static LinkedList<ConsultaMed> medquery(){
		LinkedList<ConsultaMed> lista = new LinkedList<ConsultaMed>();
	try{
		Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = (Connection) DriverManager.getConnection(
           "jdbc:mysql://localhost/ipnclinicdb", "root", "n0m3l0s3");
        PreparedStatement st = conexion.prepareStatement("SELECT * FROM medicinas");
        ResultSet rs = st.executeQuery();
        	
        while(rs.next()){
        	
        	ConsultaMed consul = new ConsultaMed();
        	consul.setIdmedicinas(rs.getInt("idmedicinas"));
        	consul.setDesc_medicina(rs.getString("desc_medicina"));
        	consul.setPresentacion(rs.getString("presentacion"));
        	consul.setLaboratorio(rs.getString("laboratorio"));
        	consul.setNom_med(rs.getString("nom_med"));
        	consul.setCompuesto_activo(rs.getString("compuesto_activo"));
        	consul.setIndic_med(rs.getString("indic_med"));
        	consul.setContra_med(rs.getString("contra_med"));
        	consul.setPrec_med(rs.getString("prec_med"));
        	consul.setReac_med(rs.getString("reac_med"));
        	consul.setDosis_med(rs.getString("dosis_med"));
        	consul.setVia_admon_med(rs.getString("via_admon_med"));
        	
        	lista.add(consul);
        	//System.out.println(lista);
        }
        rs.close();
        st.close();
        conexion.close();
	}
	catch(Exception e){
		System.out.println(e);
		
	} 
	  return lista;
	}
}
