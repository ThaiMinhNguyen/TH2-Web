package com.nemo.th2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.nemo.th2.Entity.Book;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
//@WebServlet(urlPatterns = {"/AddBookServlet"})
@WebServlet(name = "AddBook", urlPatterns = "/AddBook")
public class AddBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/th2";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "22012003";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    int publicationYear = Integer.parseInt(request.getParameter("publicationYear"));

    // Add the book to the database
    addBook(title, author, publicationYear);

    // Retrieve all books from the database
    List<Book> bookList = getAllBooksFromDatabase();

    // Set the book list as an attribute in the request and forward to book.jsp
    request.setAttribute("bookList", bookList);
    request.getRequestDispatcher("book.jsp").forward(request, response);
}


    private static boolean addBook(String title, String author, int publicationYear) {
        String sql = "INSERT INTO books (title, author, publication_year) VALUES (?, ?, ?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, title);
                    stmt.setString(2, author);
                    stmt.setInt(3, publicationYear);

                    int rowsAffected = stmt.executeUpdate();
                    return rowsAffected > 0;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    private List<Book> getAllBooksFromDatabase() {
        List<Book> bookList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                String sql = "SELECT * FROM books";
                try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Book book = new Book();
                        book.setTitle(rs.getString("title"));
                        book.setAuthor(rs.getString("author"));
                        book.setPublicationYear(rs.getInt("publication_year"));
                        bookList.add(book);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return bookList;
    }
}
