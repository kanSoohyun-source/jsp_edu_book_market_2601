<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                상품 수정
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
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

                <form name="formAddProduct" action="../admin/modify_product_process.jsp" method="post" class="form-horizontal">
                    <input type="hidden" name="productId" id="productId" class="form-control" value="<%=product.getProductId()%>">

                    <div class="form-group row">
                        <label class="col-sm-2" for="productName">상품 이름</label>
                        <div class="col-sm-5">
                            <input type="text" name="productName" id="productName" class="form-control" value="<%=product.getProductName()%>" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="unitPrice">상품 가격</label>
                        <div class="col-sm-3">
                            <input type="text" name="unitPrice" id="unitPrice" class="form-control" value="<%=product.getUnitPrice()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="description">상품 설명</label>
                        <div class="col-sm-5">
                            <textarea cols="50" rows="3" name="description" id="description" class="form-control" ><%=product.getDescription()%></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="manufacturer">제조사</label>
                        <div class="col-sm-5">
                            <input type="text" name="manufacturer" id="manufacturer" class="form-control" value="<%=product.getManufacturer()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="category">분류</label>
                        <div class="col-sm-3">
                            <input type="text" name="category" id="category" class="form-control" value="<%=product.getCategory()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="unitsInStock">재고 수</label>
                        <div class="col-sm-5">
                            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control" value="<%=product.getUnitsInStock()%>">
                        </div>
                    </div>
                    <div class= "form-group row">
                        <label class="col-sm-2">상태</label>
                        <div class="col-sm-3">
                            <label><input type="radio" name="condition" value="New"
                                <% if(product.getCondition().equals("New")) out.println("checked"); %>> 새상품</label>
                            <label><input type="radio" name="condition" value="Old"
                                <% if(product.getCondition().equals("Old")) out.println("checked"); %>> 중고</label>
                            <label><input type="radio" name="condition" value="Refurbished"
                                <% if(product.getCondition().equals("Refurbished")) out.println("checked"); %>> 재생품</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-primary" value="수정">
                        </div>
                    </div>



                </form>
            </div>

        </div>
        <hr>
    </div>
    <%@include file="../inc/footer.jsp"%>

</body>
</html>
