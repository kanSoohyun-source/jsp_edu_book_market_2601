<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // session.invalidate(); - 로그인 정보까지 삭제된 위험이 있음
    session.removeAttribute("carts");
    response.sendRedirect("../order/cart.jsp");
%>
