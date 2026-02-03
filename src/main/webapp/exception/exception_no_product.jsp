<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 아이디 오류</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3 alert-danger">
                해당 상품이 존재하지 않습니다.
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <div><%=request.getRequestURL()%></div>
            <div><a href="../Product/product_list.jsp" class="btn btn-secondary">상품목록 >> </a></div>
        </div>
        <hr>
    </div>
    <%@include file="../inc/footer.jsp"%>

</body>
</html>
