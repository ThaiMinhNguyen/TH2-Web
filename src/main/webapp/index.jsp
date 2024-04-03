<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="vi" class="h-100 w-100">
<head>
   <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="d-flex h-100 w-100 align-items-center bg-danger">
  <div class="container d-flex justify-content-center">
    <div class="bg-white m-2 form-control-lg" style="width: 25%;">
      <div class="text-center">
        <!-- <img style="height:80px;width:auto; margin: 20 20 20 0" src="/images/logo.png"> -->
        <div><strong><h4 class="text-danger">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG</h4></strong><h4>Posts and Telecommunications Institude of Technology</h4></div>
      </div>
      <h2>Đăng nhập</h2>
      <form action="LoginServlet" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Đăng nhập">
    </div>
  </div>
</form>
</body>
</html>