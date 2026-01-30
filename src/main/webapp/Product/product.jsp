<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../exception/exception_no_product.jsp" %>
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
        <%@include file="../inc/dbconn.jsp" %>
        <%
            String productId = request.getParameter("productId");
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            Product product = null;
            String sql = "SELECT * FROM product WHERE product_id = ? ";

            try {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, productId);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    product = Product.builder().
                            productId(resultSet.getString("product_id")).
                            productName(resultSet.getString("product_name")).
                            description(resultSet.getString("description")).
                            unitPrice(Integer.parseInt(resultSet.getString("unit_price"))).
                            manufacturer(resultSet.getString("manufacturer")).
                            category(resultSet.getString("category")).
                            unitsInStock(Integer.parseInt(resultSet.getString("unitsIn_stock"))).
                            condition(resultSet.getString("condition"))
                            .build();
                }
            } catch (SQLException e) {

            }

        %>
        <h3><%=product.getProductName()%>
        </h3>
        <p><%=product.getDescription()%>
        </p>
        <p><b>상품 코드</b> : <span class="badge-danger"><%=product.getProductId()%></span></p>
        <p><b>제조사</b> : <%=product.getManufacturer()%>
        </p>
        <p><b>분류</b> : <%=product.getCategory()%>
        </p>
        <p><b>재고 수</b> : <%=product.getUnitsInStock()%>
        </p>
        <h4><%=product.getUnitPrice()%>원</h4>
        <p><a href="#" class="btn btn-info" id="btnAddCart">장바구니 담기 &raquo;</a>
            <a href="../order/cart.jsp" class="btn btn-info">장바구니 가기 &raquo;</a>
            <a href="./product_list.jsp" class="bnt bnt-secondary">상품 목록 &raquo;</a>
        </p>
        <form name="frmAddCart" action="../order/add_cart_process.jsp" method="get">
            <input type="hidden" name="productId" value=<%=productId%>>
        </form>
    </div>
    <hr>
</div>
<%@include file="/inc/footer.jsp"%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const frm = document.querySelector('form[name=frmAddCart]')
        document.querySelector('#btnAddCart').addEventListener('click', function (event) {
            event.preventDefault()
            frm.submit()
        })
    })
</script>

</body>
</html>
