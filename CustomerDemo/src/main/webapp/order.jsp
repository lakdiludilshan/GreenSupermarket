<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/supermarket";
    String user = "root";
    String pass = "1234";

    Connection con = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);

        String productTitle = request.getParameter("productTitle");
        String productDescription = request.getParameter("productDescription");
        String productPrice = request.getParameter("productPrice");
        String stockb = request.getParameter("stockb");

        String query = "INSERT INTO `order` (title, description, price, stockb) VALUES (?, ?, ?, ?)";
        stmt = con.prepareStatement(query);
        stmt.setString(1, productTitle);
        stmt.setString(2, productDescription);
        stmt.setString(3, productPrice);
        stmt.setString(4, stockb);

        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Order inserted successfully!");
        } else {
            out.println("Failed to insert order.");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
