<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Sách</title>
</head>
<body>
    <h2>Thêm Sách</h2>
    <form action="AddBook" method="POST">
        <label for="title">Tên sách:</label><br>
        <input type="text" id="title" name="title" required><br>
        <label for="author">Tác giả:</label><br>
        <input type="text" id="author" name="author" required><br>
        <label for="publicationYear">Năm xuất bản:</label><br>
        <input type="number" id="publicationYear" name="publicationYear" required><br><br>
        <button type="submit">Thêm Sách</button>
    </form>
    
    <h2>Danh Sách Sách</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Tên sách</th>
                <th>Tác giả</th>
                <th>Năm xuất bản</th>
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
</body>
</html>
