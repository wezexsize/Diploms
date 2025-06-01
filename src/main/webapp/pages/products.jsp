<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webstore.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Магазин шоколада</title>
</head>
<body>
<h1>Список шоколадок</h1>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Название</th>
        <th>Описание</th>
        <th>Цена (₽)</th>
    </tr>
    <%
        if (products != null) {
            for (Product p : products) {
    %>
    <tr>
        <td><%= p.getName() %></td>
        <td><%= p.getDescription() %></td>
        <td><%= p.getPrice() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="3">Товаров нет</td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
