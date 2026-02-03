
<%@ page import="java.util.List" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
    int pageNum = (int) request.getAttribute("pageNum");
    int totalCount = (int) request.getAttribute("totalCount");
    int totalPage = (int) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/inc/menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            목록
        </h1>
    </div>
</div>
<div class="container">
    <div>
        <div class="text-right">
            <span class="badge badge-success">전체 <%=totalCount%>건 </span>
        </div>
    </div>
    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회</th>
                <th>글쓴이</th>
            </tr>
            <%
                for (BoardDTO boardDTO : boardList) {
            %>
            <tr>
                <td><%=boardDTO.getBno()%>
                </td>
                <td><a href="./boardView.do?bno=<%=boardDTO.getBno()%>&pageNum=<%=pageNum%>"><%=boardDTO.getSubject()%>
                </a></td>
                <td><%=boardDTO.getAddDate()%>
                </td>
                <td><%=boardDTO.getHit()%>
                </td>
                <td><%=boardDTO.getName()%>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <!-- 페이지 목록 -->
        <div align="center">
            <%
                for (int i = 1; i <= totalPage; i++) {
            %>
            <a href="./boardList.do?pageNum=<%=i%>">
                <%
                    if (pageNum == i) {
                %>
                <font color='4C5317'><b> [<%= i %>] </b></font>
                <%
                } else {
                %>
                <font color='4C5317'> [<%= i %>] </font>
                <%
                    }
                %>
            </a>
            <%
                }
            %>
        </div>
    </div>
    <!-- 검색 -->
    <div align="left">
        <form action="" method="get">
            <table>
                <tr>
                    <td width="100%" align="left">&nbsp;&nbsp;
                        <select name="items" class="txt">
                            <option value="subject">제목에서</option>
                            <option value="content">본문에서</option>
                            <option value="name">글쓴이에서</option>
                        </select>
                        <input name="keyword" type="text"/>
                        <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 "/>
                        <a class="btn btn-danger" href="/board/boardList.do">취소</a>
                    </td>
                    <td width="100%" align="right">
                        <a href="./boardAddForm.do" class="btn btn-primary"> &laquo; 글쓰기</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <hr>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
