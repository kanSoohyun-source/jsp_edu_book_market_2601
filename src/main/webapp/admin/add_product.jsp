<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                상품 등록
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form name="formAddProduct" action="add_product_process.jsp" method="post" class="form-horizontal">
                    <div class="form-group row">
                        <label class="col-sm-2" for="productId">상품 코드</label>
                        <div class="col-sm-3">
                            <input type="text" name="productId" id="productId" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="productName">상품 이름</label>
                        <div class="col-sm-5">
                            <input type="text" name="productName" id="productName" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="unitPrice">상품 가격</label>
                        <div class="col-sm-3">
                            <input type="text" name="unitPrice" id="unitPrice" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="description">상품 설명</label>
                        <div class="col-sm-5">
                            <textarea cols="50" rows="3" name="description" id="description" class="form-control">
                            </textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="manufacturer">제조사</label>
                        <div class="col-sm-5">
                            <input type="text" name="manufacturer" id="manufacturer" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="category">분류</label>
                        <div class="col-sm-3">
                            <input type="text" name="category" id="category" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="unitsInStock">재고 수</label>
                        <div class="col-sm-5">
                            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2">상태</label>
                        <div class="col-sm-3">
                            <label><input type="radio" name="condition" value="New" checked> 새상품</label>
                            <label><input type="radio" name="condition" value="Old"> 중고</label>
                            <label><input type="radio" name="condition" value="Refurbished"> 재생품</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-primary" value="등록">
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
