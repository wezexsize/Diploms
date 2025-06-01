package com.webstore.servlet;

import com.webstore.dao.ProductDAO;
import com.webstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private Connection conn;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webstore", "root", "password");
            productDAO = new ProductDAO(conn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/pages/products.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) conn.close();
        } catch (SQLException ignored) {}
    }
}
