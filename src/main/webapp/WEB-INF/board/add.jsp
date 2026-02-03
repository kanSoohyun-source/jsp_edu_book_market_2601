<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="/inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                등록
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form name="formAddProduct" action="/board/boardAdd.do" method="post" class="form-horizontal">
                    <div class="form-group row">
                        <label class="col-sm-2" for="name">이름</label>
                        <div class="col-sm-3">
                            <input type="text" name="name" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="subject">제목</label>
                        <div class="col-sm-5">
                            <input type="text" name="subject" id="subject" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="content">내용</label>
                        <div class="col-sm-5">
                            <textarea cols="50" rows="3" name="content" id="content" class="form-control">
                            </textarea>
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
    <%@include file="/inc/footer.jsp"%>

</body>
</html>
