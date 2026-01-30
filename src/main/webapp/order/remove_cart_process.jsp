<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp"%>
<%
    // 1. get 방식으로 전달된 데이터를 변수에 저장
    String productId = request.getParameter("productId");
    String memberId = (String) session.getAttribute("sessionMemberId");
    String guestId = session.getId();
    String sql = null;

    // productId 존재 여부 -> product 테이블에서 확인
    PreparedStatement preparedStatement = null;

    if (memberId != null) {
        sql = "DELETE FROM cart WHERE product_id = ? AND member_id = ?";
    } else {
        sql = "DELETE FROM cart WHERE product_id = ? AND guest_id = ?";
    }

    try {
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, productId);
        preparedStatement.setString(2,(memberId != null ? memberId : guestId));
        preparedStatement.executeUpdate();

    } catch (SQLException e) {
        throw new RuntimeException();
    }

    // 4. 장바구니로 이동
    response.sendRedirect("../order/cart.jsp");
%>
