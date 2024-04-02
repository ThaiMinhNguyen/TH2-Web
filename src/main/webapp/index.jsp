<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi">
<head>
   <meta charset="UTF-8">
  <title>Đăng nhập</title>
</head>
<body>
<h2>Đăng nhập</h2>
<form action="LoginServlet" method="POST">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" required><br><br>
  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required><br><br>
  <input type="submit" value="Đăng nhập">
</form>
</body>
</html>