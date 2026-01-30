<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Connection connection = null;
  String url = "jdbc:mariadb://localhost:3306/jsp_ed_book_market";
  String user = "root";
  String pass = "6800";

  try {
    Class.forName("org.mariadb.jdbc.Driver");
    connection = DriverManager.getConnection(url, user, pass);
  } catch (ClassNotFoundException e) {
    throw new RuntimeException(e);
  } catch (SQLException e) {
    out.println("DB 연결 실패 <br>");
    out.println("SQLException : " + e.getMessage());
  }

%>

