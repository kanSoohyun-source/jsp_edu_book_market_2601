<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
1. 넘어온 form 값을 변수 처리
2. DTO에 저장 (Product)
3. DAO에 저장(ProductRepasitory)
4. 목록으로 이동(/Product/product_list.jsp)
--%>

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

    // 가격, 재고 수는 int
    int price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
    int stock = unitsInStock.isEmpty() ? 0 : Integer.parseInt(unitsInStock);

    // DTO에 저장 (Product)
    Product product = new Product(productId, productName, price);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(stock);
    product.setCondition(condition);

    // DAO에 저장(ProductRepasitory)
    ProductRepository productRepository = ProductRepository.getInstance();
    productRepository.addProduct(product);

    // 목록으로 이동(/Product/product_list.jsp)
    response.sendRedirect("../Product/product_list.jsp");

%>