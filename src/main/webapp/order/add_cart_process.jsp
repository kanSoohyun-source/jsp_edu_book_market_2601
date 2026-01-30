<%@ page import="org.example.jsp_edu_book_market_2601.DAO.ProductRepository" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String productId = request.getParameter("productId");
    // productId 유효성 검사
    if (productId == null || productId.trim().isEmpty()) { // null 이거나, 빈 문자열이 들어온 경우
        response.sendRedirect("../Product/product_list.jsp");
        return;
    }

    // productId 존재 여부
    ProductRepository productRepository = ProductRepository.getInstance();
    Product product = productRepository.getProductByID(productId);

    if (product == null) { // productId가 없는 경우
        response.sendRedirect("../exception/exception_no_product.jsp");
        return;
    }

    // 장바구니에 추가
    // 장바구니를 session으로 구현
    List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    if (carts == null) { // 생성된 목록이 없는 경우, 목록 생성 후 세션에 저장
        carts = new ArrayList<>();
        session.setAttribute("carts",carts);
    }

    boolean isFlag = false;
    for (Cart cart : carts) {
        if (cart.getProductId().equals(productId)) {
            // 장바구니에 담긴 상품 - update
            cart.setCartCnt(cart.getCartCnt() + 1);
            isFlag = true;
        }
    }

    if (!isFlag) {
        // 장바구니에 안 담긴 상품 - insert
        carts.add(new Cart(productId, 1));
    }




     // 상품 상세 페이지로 이동
     response.sendRedirect("../Product/product.jsp?productId=" + productId);



%>