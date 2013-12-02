package com.unidadesmedicas.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.unidadesmedicas.model.Unidad;
import com.unidadesmedicas.util.DbUtil;

public class UnidDao {

    private Connection connection;

    public UnidDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(Unidad user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into unidad_atencion (nombre_unidad,direccion_unidad,servicios_ofrece,desc_unidad,cantidad_consul,consultorios_disponibles,sub_espec,consul_rel) values (?, ?, ?, ?, ?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNombreunidad());
            preparedStatement.setString(2, user.getDireccion());
            preparedStatement.setString(3, user.getServicios());
            preparedStatement.setString(4, user.getDescuento());
           
            preparedStatement.setString(5, user.getCantidad_consultada());
            preparedStatement.setString(6, user.getConsul_disp());
            preparedStatement.setString(7, user.getSubespecialidad());
            preparedStatement.setString(8, user.getConsul_rel());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from unidad_atencion where idunidad_atencion=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(Unidad user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update unidad_atencion set nombre_unidad=?, direccion_unidad=?, servicios_ofrece=?, desc_unidad=?, cantidad_consul=?, consultorios_disponibles=?, sub_espec=?, consul_rel=?" +
                            "where idunidad_atencion=?");
            // Parameters start with 1
            // Parameters start with 1
            preparedStatement.setString(1, user.getNombreunidad());
            preparedStatement.setString(2, user.getDireccion());
            preparedStatement.setString(3, user.getServicios());
            preparedStatement.setString(4, user.getDescuento());
           
            preparedStatement.setString(5, user.getCantidad_consultada());
            preparedStatement.setString(6, user.getConsul_disp());
            preparedStatement.setString(7, user.getSubespecialidad());
            preparedStatement.setString(8, user.getConsul_rel());
            preparedStatement.setInt(9,  user.getUserid());
           
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Unidad> getAllUsers() {
        List<Unidad> users = new ArrayList<Unidad>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from unidad_atencion");
            while (rs.next()) {
                Unidad user = new Unidad();
                user.setUserid(rs.getInt("idunidad_atencion"));
                user.setNombreunidad(rs.getString("nombre_unidad"));
                user.setDireccion(rs.getString("direccion_unidad"));
                user.setServicios(rs.getString("servicios_ofrece"));
                user.setDescuento(rs.getString("desc_unidad"));
                user.setCantidad_consultada(rs.getString("cantidad_consul"));
                user.setConsul_disp(rs.getString("consultorios_disponibles"));
                user.setSubespecialidad(rs.getString("sub_espec"));
                user.setConsul_rel(rs.getString("consul_rel"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public Unidad getUserById(int userId) {
        Unidad user = new Unidad();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from unidad_atencion where idunidad_atencion=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	user.setUserid(rs.getInt("idunidad_atencion"));
                user.setNombreunidad(rs.getString("nombre_unidad"));
                user.setDireccion(rs.getString("direccion_unidad"));
                user.setServicios(rs.getString("servicios_ofrece"));
                user.setDescuento(rs.getString("desc_unidad"));
                user.setCantidad_consultada(rs.getString("cantidad_consul"));
                user.setConsul_disp(rs.getString("consultorios_disponibles"));
                user.setSubespecialidad(rs.getString("sub_espec"));
                user.setConsul_rel(rs.getString("consul_rel"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
}