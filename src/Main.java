package com.webstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/webstore";
        String dbUser = "root";
        String dbPassword = "password";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT id, name, price FROM products");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");

                System.out.println("ID: " + id + ", Название: " + name + ", Цена: " + price);
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
