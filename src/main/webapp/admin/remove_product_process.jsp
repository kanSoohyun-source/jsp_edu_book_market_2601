<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../inc/dbconn.jsp" %>

<%
  String productId = request.getParameter("productId");

  PreparedStatement preparedStatement = null;
  String sql = "DELETE FROM product WHERE product_id = ?";

  try {
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, productId);
    preparedStatement.executeUpdate();
  } catch (SQLException e) {

  }
  // 목록으로 이동(/Product/product_list.jsp)
  response.sendRedirect("../Product/product_list.jsp");
%>
