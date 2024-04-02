package com.nemo.th2;

import com.nemo.th2.Entity.Book;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "loginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/th2";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "22012003";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (authenticate(username, password)) {
            // Đăng nhập thành công
//            request.setAttribute("username", username);
//            request.getRequestDispatcher("success.jsp").forward(request, response);
            List<Book> bookList = getAllBooksFromDatabase();

            // Set the book list as an attribute in the request and forward to book.jsp
            request.setAttribute("bookList", bookList);
            request.getRequestDispatcher("book.jsp").forward(request, response);
            response.sendRedirect("book.jsp");
        } else {
            // Đăng nhập thất bại
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login failed');");
            out.println("location='index.jsp';");
            out.println("</script>");
        }
    }

    private static boolean authenticate(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                System.out.println("đăng nhập thành công csdl");
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    try (ResultSet rs = stmt.executeQuery()) {
                        return rs.next();
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {

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
