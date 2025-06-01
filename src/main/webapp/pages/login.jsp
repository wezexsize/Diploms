<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Вход</title>
</head>
<body>
<h1>Вход в систему</h1>
<form action="login" method="post">
    <label>Логин:<br><input type="text" name="username" required></label><br><br>
    <label>Пароль:<br><input type="password" name="password" required></label><br><br>
    <input type="submit" value="Войти">
</form>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color:red;"><%= error %></p>
<%
    }
%>
<p>Нет аккаунта? <a href="register.jsp">Зарегистрируйтесь</a></p>
</body>
</html>
