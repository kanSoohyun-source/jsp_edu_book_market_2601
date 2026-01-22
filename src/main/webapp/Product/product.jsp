<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                상품 정보
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <%
                ProductRepository productDao = ProductRepository.getInstance();

                String productId = request.getParameter("productId");
                Product product = productDao.getProductByID(productId);
            %>
            <h3><%=product.getProductName()%></h3>
            <p><%=product.getDescription()%></p>
            <p><b>상품 코드</b> : <span class="badge-danger"><%=product.getProductId()%></span></p>
            <p><b>제조사</b> : <%=product.getManufacturer()%></p>
            <p><b>분류</b> : <%=product.getCategory()%></p>
            <p><b>재고 수</b> : <%=product.getUnitsInStock()%></p>
            <h4><%=product.getUnitPrice()%>원</h4>
            <p><a href="#" class="btn btn-info">상품 주문 &raquo;</a>
                <a href="./product_list.jsp" class="bnt bnt-secondary">상품 목록 &raquo;</a>
            </p>
        </div>
        <hr>
    </div>
    <jsp:include page="../inc/footer.jsp"/>

</body>
</html>
