package com.personalmedico.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.personalmedico.model.User;
import com.personalmedico.util.DbUtil;

public class UserDao {

    private Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into personal_medico(nom_med,apep_med,apem_med,espec_med,ced_prof,tipo_personal,sub_espec,consul_rel,user_med,pass_med) values (?, ?, ?, ?, ?, ?, ?, ?,?,? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNombre());
            preparedStatement.setString(2, user.getApellidopaterno());
            preparedStatement.setString(3, user.getApellidomaterno());
            preparedStatement.setString(4, user.getEspecialidad());
           
            preparedStatement.setString(5, user.getCedula());
            preparedStatement.setString(6, user.getTipo());
            preparedStatement.setString(7, user.getSubespecialidad());
            preparedStatement.setString(8, user.getConsultorio_rel());
            preparedStatement.setString(9, user.getUser_med());
            preparedStatement.setString(10,user.getPass_med());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from personal_medico where idpersonal_medico=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update personal_medico set nom_med=?, apep_med=?, apem_med=?, espec_med=?, ced_prof=?, tipo_personal=?, sub_espec=?, consul_rel=?, user_med=?, pass_med=?" +
                            "where idpersonal_medico=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNombre());
            preparedStatement.setString(2, user.getApellidopaterno());
            preparedStatement.setString(3, user.getApellidomaterno());
            preparedStatement.setString(4, user.getEspecialidad());
           
            preparedStatement.setString(5, user.getCedula());
            preparedStatement.setString(6, user.getTipo());
            preparedStatement.setString(7, user.getSubespecialidad());
            preparedStatement.setString(8, user.getConsultorio_rel());
            preparedStatement.setString(9, user.getUser_med());
            preparedStatement.setString(10, user.getPass_med());
            preparedStatement.setInt(11, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from personal_medico");
            while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("idpersonal_medico"));
                user.setNombre(rs.getString("nom_med"));
                user.setApellidopaterno(rs.getString("apep_med"));
                user.setApellidomaterno(rs.getString("apem_med"));
                user.setEspecialidad(rs.getString("espec_med"));
                user.setCedula(rs.getString("ced_prof"));
                user.setTipo(rs.getString("tipo_personal"));
                user.setSubespecialidad(rs.getString("sub_espec"));
                user.setConsultorio_rel(rs.getString("consul_rel"));
                user.setUser_med(rs.getString("user_med"));
                user.setPass_med(rs.getString("pass_med"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from personal_medico where idpersonal_medico=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setUserid(rs.getInt("idpersonal_medico"));
                user.setNombre(rs.getString("nom_med"));
                user.setApellidopaterno(rs.getString("apep_med"));
                user.setApellidomaterno(rs.getString("apem_med"));
                user.setEspecialidad(rs.getString("espec_med"));
                user.setCedula(rs.getString("ced_prof"));
                user.setTipo(rs.getString("tipo_personal"));
                user.setSubespecialidad(rs.getString("sub_espec"));
                user.setConsultorio_rel(rs.getString("consul_rel"));
                user.setUser_med(rs.getString("user_med"));
                user.setPass_med(rs.getString("pass_med"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
}