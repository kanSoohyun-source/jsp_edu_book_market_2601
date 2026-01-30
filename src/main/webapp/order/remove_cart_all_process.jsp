<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp"%>
<%
    // session.invalidate(); - 로그인 정보까지 삭제된 위험이 있음
    String memberId = (String) session.getAttribute("sessionMemberId");
    String guestId = session.getId();
    String sql = null;
    PreparedStatement preparedStatement = null;

    if (memberId != null) {
        sql = "DELETE FROM cart WHERE member_id = ?";
    } else {
        sql = "DELETE FROM cart WHERE guest_id = ?";
    }

    try {
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, (memberId != null ? memberId : guestId));
        preparedStatement.executeUpdate();

    } catch (SQLException e) {

    }
    response.sendRedirect("../order/cart.jsp");
%>
