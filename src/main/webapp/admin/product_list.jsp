<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            <%@include file="../inc/dbconn.jsp"%>
            <%
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
                List<Product> products = new ArrayList();
                String sql = "SELECT * FROM product";

                try {
                    preparedStatement = connection.prepareStatement(sql);
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        // 1. Product(DTO) 입력 2. List에 추가
                        Product product = Product.builder().
                                productId(resultSet.getString("product_id")).
                                productName(resultSet.getString("product_name")).
                                description(resultSet.getString("description")).
                                unitPrice(Integer.parseInt(resultSet.getString("unit_price")))
                                .build();
                        products.add(product);
                    }

                } catch (SQLException e) {

                }

                // getter를 사용해서 상품 목록 불러오기
                // 반복문을 사용해서 목록 출력
                for (Product product : products) {
            %>
                    <div class="col-md-4">
                        <h3><%=product.getProductName()%></h3>
                        <p><%=product.getDescription()%></p>
                        <p><%=product.getUnitPrice()%></p>
                        <p>
                            <a href="./modify_product.jsp?productId=<%=product.getProductId()%>"
                              class="btn btn-secondary" role="button">수정</a>
                            <a href="./remove_product_process.jsp?productId=<%=product.getProductId()%>"
                              class="btn btn-danger" role="button">삭제</a>
                        </p>
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
