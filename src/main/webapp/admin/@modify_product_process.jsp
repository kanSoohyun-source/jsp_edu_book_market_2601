<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp" %>
<%
  // 넘어온 form 값을 변수 처리
  String productId = request.getParameter("productId"); // 상품 아이디
  String productName = request.getParameter("productName"); // 상품명
  String unitPrice = request.getParameter("unitPrice"); // 상품 가격
  String description = request.getParameter("description"); // 상품 설명
  String manufacturer = request.getParameter("manufacturer"); // 제조사
  String category = request.getParameter("category"); // 분류
  String unitsInStock = request.getParameter("unitsInStock"); // 재고 수
  String condition = request.getParameter("condition"); // 신상 / 중고 / 재생품

  // DB에 저장
  PreparedStatement preparedStatement = null;
  String sql = "UPDATE product SET `product_name` = ?, `unit_price` = ?, `description` = ?," +
          " `manufacturer` = ?, `category` = ?, `unitsIn_stock` = ?, `condition` = ? WHERE `product_id` = ?";
  try {
    preparedStatement = connection.prepareStatement(sql);;
    preparedStatement.setString(1, productName);
    preparedStatement.setInt(2, Integer.parseInt(unitPrice));
    preparedStatement.setString(3, description);
    preparedStatement.setString(4, manufacturer);
    preparedStatement.setString(5, category);
    preparedStatement.setInt(6, Integer.parseInt(unitsInStock));
    preparedStatement.setString(7, condition);
    preparedStatement.setString(8, productId);
    preparedStatement.executeUpdate();
  } catch (SQLException e) {

  }

  // 목록으로 이동(/Product/product_list.jsp)
  response.sendRedirect("../Product/product_list.jsp");

%>