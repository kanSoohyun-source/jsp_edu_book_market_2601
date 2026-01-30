<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Cart" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1. get 방식으로 전달된 데이터를 변수에 저장
    String productId = request.getParameter("productId");

    // 2. 유효성 검사
    if (productId == null || productId.trim().isEmpty()) { // null 이거나, 빈 문자열이 들어온 경우
        response.sendRedirect("../Product/product_list.jsp");
        return;
    }

    // 3. 장바구니에서 productId에 해당하는 상품을 삭제
    // 1) 장바구니 목록 가져오기
    List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");

    // 2) 반복문을 돌면서 삭제
    carts.removeIf(cart -> cart.getProductId().equals(productId));

    // 4. 장바구니로 이동
    response.sendRedirect("../order/cart.jsp");
%>
