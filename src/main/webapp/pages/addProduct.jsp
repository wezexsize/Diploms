<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Добавить шоколадку</title>
</head>
<body>
<h1>Добавить новую шоколадку</h1>
<form action="addProduct" method="post">
    <label>Название:<br><input type="text" name="name" required></label><br><br>
    <label>Описание:<br><textarea name="description" rows="4" cols="50" required></textarea></label><br><br>
    <label>Цена:<br><input type="number" step="0.01" name="price" required></label><br><br>
    <input type="submit" value="Добавить">
</form>
</body>
</html>
