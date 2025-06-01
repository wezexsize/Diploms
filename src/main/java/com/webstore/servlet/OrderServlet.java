package com.webstore.servlet;

import com.webstore.dao.OrderDAO;
import com.webstore.dao.OrderItemDAO;
import com.webstore.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private Connection conn;
    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstore", "root", "password");
            orderDAO = new OrderDAO(conn);
            orderItemDAO = new OrderItemDAO(conn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderDAO.getAllOrders();
        for (Order order : orders) {
            order.setItems(orderItemDAO.selectOrderItemsByOrderId(order.getId()));
        }
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/pages/orders.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) conn.close();
        } catch (SQLException ignored) {}
    }
}
