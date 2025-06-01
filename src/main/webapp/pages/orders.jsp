<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webstore.model.Order" %>
<%@ page import="com.webstore.model.OrderItem" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<html>
<head>
    <title>Мои заказы</title>
</head>
<body>
<h1>Ваши заказы</h1>
<%
    if (orders == null || orders.isEmpty()) {
%>
<p>Заказов нет.</p>
<%
} else {
    for (Order order : orders) {
%>
<div style="margin-bottom:20px; border: 1px solid #ccc; padding: 10px;">
    <p><strong>Номер заказа:</strong> <%= order.getId() %></p>
    <p><strong>Дата заказа:</strong> <%= order.getOrderDate() %></p>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Название</th>
            <th>Количество</th>
            <th>Цена за шт.</th>
            <th>Итого</th>
        </tr>
        <%
            for (OrderItem item : order.getItems()) {
        %>
        <tr>
            <td><%= item.getProduct().getName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getPrice() * item.getQuantity() %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%
        }
    }
%>
<a href="products">Вернуться к списку шоколадок</a>
</body>
</html>
