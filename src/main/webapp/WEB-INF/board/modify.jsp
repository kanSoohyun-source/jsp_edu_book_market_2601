<%@ page import="org.example.jsp_edu_book_market_2601.DTO.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
    String pageNum = request.getParameter("pageNum");
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="/inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                수정
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form name="formAddProduct" action="/board/boardModify.do" method="post" class="form-horizontal">
                    <input type="hidden" name="bno" id="bno" class="form-control" value="<%=board.getBno()%>">
                    <div class="form-group row">
                        <label class="col-sm-2" for="subject">제목</label>
                        <div class="col-sm-5">
                            <input type="text" name="subject" id="subject" class="form-control" value="<%=board.getSubject()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="content">내용</label>
                        <div class="col-sm-5">
                            <textarea cols="50" rows="3" name="content" id="content" class="form-control"><%=board.getContent()%></textarea>
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
    <%@include file="/inc/footer.jsp"%>

</body>
</html>
