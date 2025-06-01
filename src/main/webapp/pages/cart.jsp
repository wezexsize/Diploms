<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.webstore.model.Product" %>
<%
    Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
%>
<html>
<head>
    <title>Корзина</title>
</head>
<body>
<h1>Ваша корзина</h1>
<%
    if (cart == null || cart.isEmpty()) {
%>
<p>Корзина пуста.</p>
<%
} else {
%>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Название</th>
        <th>Количество</th>
        <th>Цена за шт.</th>
        <th>Итого</th>
    </tr>
    <%
        double total = 0;
        for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
            Product p = entry.getKey();
            int qty = entry.getValue();
            double sum = p.getPrice() * qty;
            total += sum;
    %>
    <tr>
        <td><%= p.getName() %></td>
        <td><%= qty %></td>
        <td><%= p.getPrice() %></td>
        <td><%= sum %></td>
    </tr>
    <%
        }
    %>
    <tr>
        <td colspan="3" align="right"><strong>Общая сумма:</strong></td>
        <td><strong><%= total %></strong></td>
    </tr>
</table>
<form action="orderConfirmation" method="post">
    <input type="submit" value="Оформить заказ">
</form>
<%
    }
%>
</body>
</html>
