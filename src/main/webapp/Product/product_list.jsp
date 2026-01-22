<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                상품 목록
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row text-center">
            <%
                ProductRepository productDao = ProductRepository.getInstance();

                // getter를 사용해서 상품 목록 불러오기
                List<Product> products = productDao.getProducts();
                // 반복문을 사용해서 목록 출력
                for (Product product : products) {
            %>
                    <div class="col-md-4">
                    <h3><%=product.getProductName()%></h3>
                    <p><%=product.getDescription()%></p>
                    <p><%=product.getUnitPrice()%></p>
                    <p><a href="./product.jsp?productId=<%=product.getProductId()%>"
                          class="btn btn-secondary" role="button">상세 정보 보기</a></p>
                    </div>
            <%
                }
            %>

        </div>
        <hr>
    </div>
    <jsp:include page="../inc/footer.jsp"/>

</body>
</html>
