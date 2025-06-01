package com.webstore.servlet;

import com.webstore.dao.UserDAO;
import com.webstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/webstore", "root", "password"
            );
            userDAO = new UserDAO(conn);
        } catch (Exception e) {
            throw new ServletException("Ошибка подключения к базе данных", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<User> users = userDAO.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/pages/users.jsp").forward(req, resp);
    }
}


