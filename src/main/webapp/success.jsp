<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Đăng nhập thành công!</title>
</head>
<body>
<h2>Đăng nhập thành công</h2>
<p>Chào mừng <strong><%= request.getAttribute("username") %></strong>!</p>
</body>
</html>