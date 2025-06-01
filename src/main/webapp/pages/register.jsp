<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
<h1>Регистрация нового пользователя</h1>
<form action="register" method="post">
    <label>Логин:<br><input type="text" name="username" required></label><br><br>
    <label>Пароль:<br><input type="password" name="password" required></label><br><br>
    <label>Подтверждение пароля:<br><input type="password" name="passwordConfirm" required></label><br><br>
    <input type="submit" value="Зарегистрироваться">
</form>
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color:red;"><%= error %></p>
<%
    }
%>
<p>Уже есть аккаунт? <a href="login.jsp">Войти</a></p>
</body>
</html>
