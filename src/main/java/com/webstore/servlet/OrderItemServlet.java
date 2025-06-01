package com.webstore.servlet;

import com.webstore.dao.OrderItemDAO;
import com.webstore.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class OrderItemServlet extends HttpServlet {
    private OrderItemDAO orderItemDAO;
    private Connection conn;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstore", "root", "password");
            orderItemDAO = new OrderItemDAO(conn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId;
        try {
            orderId = Integer.parseInt(req.getParameter("orderId"));
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        List<OrderItem> items = orderItemDAO.selectOrderItemsByOrderId(orderId);
        req.setAttribute("items", items);
        req.getRequestDispatcher("/pages/orderitems.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) conn.close();
        } catch (SQLException ignored) {}
    }
}
