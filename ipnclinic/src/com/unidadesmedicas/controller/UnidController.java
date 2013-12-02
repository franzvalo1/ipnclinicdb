package com.unidadesmedicas.controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.unidadesmedicas.dao.UnidDao;
import com.unidadesmedicas.model.Unidad;

public class UnidController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/unidades.jsp";
    private static String LIST_USER = "/verunidades.jsp";
    private UnidDao dao;

    public UnidController() {
        super();
        dao = new UnidDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            dao.deleteUser(userId);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("userId"));
            Unidad user = dao.getUserById(userId);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Unidad user = new Unidad();
        user.setNombreunidad(request.getParameter("nombreunidad"));
        user.setDireccion(request.getParameter("direccion"));
        user.setServicios(request.getParameter("servicios"));
        user.setDescuento(request.getParameter("descuento"));
        user.setCantidad_consultada(request.getParameter("cantidad_consultada"));
        user.setConsul_disp(request.getParameter("consul_disp"));
        user.setSubespecialidad(request.getParameter("subespecialidad"));
        user.setConsul_rel(request.getParameter("consul_rel"));
    
        String userid = request.getParameter("userid");
        if(userid == null || userid.isEmpty())
        {
            dao.addUser(user);
        }
        else
        {
            user.setUserid(Integer.parseInt(userid));
            dao.updateUser(user);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllUsers());
        view.forward(request, response);
    }
}