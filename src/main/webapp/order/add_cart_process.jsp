<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp"%>
<%!
    String getCookie(Cookie[] cookies, String name) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("guestId")) {
                return cookie.getValue();
            }
        }
        return null;
    }
%>

<%
    String productId = request.getParameter("productId");

    // productId 존재 여부 -> product 테이블에서 확인
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String sql = "SELECT * FROM product WHERE product_id = ?"; // 상품 아이디 유효성

    try {
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, productId);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) { // 올바른 상품 아이디

        } else { // 올바르지 않은 상품 아이디
             response.sendRedirect("../exception/exception_no_product.jsp");
             return;
        }
    } catch (SQLException e) {

    }
    String memberId = (String) session.getAttribute("sessionMemberId");
    String guestId = getCookie(request.getCookies(), "guestId");

    // 장바구니에 추가
    // 로그인한 사용자의 데이터에 productId 상품이 있는지
    boolean isflag = false;
    int cno = -1;
    sql = "SELECT * FROM cart WHERE product_id = ? AND (member_id = ? OR guest_id = ?)"; // cart 테이블에 상품이 있는지 확인

    try {
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, productId);
        preparedStatement.setString(2, memberId);
        preparedStatement.setString(3, guestId);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            isflag = true;
            cno = resultSet.getInt("cno");
        } else {

        }

    } catch (SQLException e) {

    }

    if (isflag) {
        // 상품이 있으면 갯수 추가
        sql = "UPDATE cart SET cart_cnt = cart_cnt + 1 WHERE cno = ?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cno);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {

        }
    } else {
        // 상품이 없으면 상품 추가
        if (memberId != null) { // 로그인 상태
            sql = "INSERT INTO cart (member_id, product_id, cart_cnt) VALUES (?, ?, 1)";
        } else { // 비로그인
            sql = "INSERT INTO cart (guest_id, product_id, cart_cnt) VALUES (?, ?, 1)";
        }
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, (memberId != null ? memberId : guestId));
            preparedStatement.setString(2, productId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {

        }

    }

     // 상품 상세 페이지로 이동
     response.sendRedirect("../Product/product.jsp?productId=" + productId);

%>