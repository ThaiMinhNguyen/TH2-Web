<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="m-1"></div>
<%--    <div>--%>
<%--        <h2>Thêm Sách</h2>--%>
<%--        <form action="AddBook" method="POST">--%>
<%--            <label for="title">Tên sách:</label><br>--%>
<%--            <input type="text" id="title" name="title" required><br>--%>
<%--            <label for="author">Tác giả:</label><br>--%>
<%--            <input type="text" id="author" name="author" required><br>--%>
<%--            <label for="publicationYear">Năm xuất bản:</label><br>--%>
<%--            <input type="number" id="publicationYear" name="publicationYear" required><br><br>--%>
<%--            <button type="submit">Thêm Sách</button>--%>
<%--        </form>--%>
<%--    </div>--%>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Thêm Sách</h2>
                        <form action="AddBook" method="POST">
                            <div class="form-group">
                                <label for="title">Tên sách:</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>
                            <div class="form-group">
                                <label for="author">Tác giả:</label>
                                <input type="text" class="form-control" id="author" name="author" required>
                            </div>
                            <div class="form-group">
                                <label for="publicationYear">Năm xuất bản:</label>
                                <input type="number" class="form-control" id="publicationYear" name="publicationYear" required>
                            </div>
                            <button type="submit" class="mt-3 btn btn-primary">Thêm Sách</button>
                            <div class="m-3"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="m-3"></div>
    <div class="m-4">
        <h2>Danh Sách Sách</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Tên sách</th>
                    <th scope="col">Tác giả</th>
                    <th scope="col">Năm xuất bản</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${bookList}" var="book">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.publicationYear}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    
<%--    <h2>Danh Sách Sách</h2>--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--            <tr>--%>
<%--                <th>Tên sách</th>--%>
<%--                <th>Tác giả</th>--%>
<%--                <th>Năm xuất bản</th>--%>
<%--            </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--            <c:forEach items="${bookList}" var="book">--%>
<%--                <tr>--%>
<%--                    <td>${book.title}</td>--%>
<%--                    <td>${book.author}</td>--%>
<%--                    <td>${book.publicationYear}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>
</body>
</html>
