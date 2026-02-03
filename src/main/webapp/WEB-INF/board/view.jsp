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
    <title>보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="/inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                보기
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2">이름</label>
                    <div class="col-sm-3">
                        <%=board.getName()%>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">제목</label>
                    <div class="col-sm-5">
                        <%=board.getSubject()%>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">조회수</label>
                    <div class="col-sm-5">
                        <%=board.getHit()%>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">작성일</label>
                    <div class="col-sm-5">
                        <%=board.getAddDate()%>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">내용</label>
                    <div class="col-sm-5">
                        <%=board.getContent()%>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <%
                            if (board.getMemberId().equals(sessionMemberId)) {
                        %>
                        <a href="./boardDelete.do?bno=<%=board.getBno()%>&pageNum=<%=pageNum%>" class="btn btn-danger">삭제</a>
                        <a href="./boardModifyForm.do?bno=<%=board.getBno()%>&pageNum=<%=pageNum%>" class="btn btn-danger">수정</a>
                        <%
                            }
                        %>
                        <a href="./boardList.do?pageNum=<%=pageNum%>" class="btn btn-primary">목록</a>
                    </div>
                </div>
            </div>

        </div>
        <hr>
    </div>
    <%@include file="/inc/footer.jsp"%>

</body>
</html>
