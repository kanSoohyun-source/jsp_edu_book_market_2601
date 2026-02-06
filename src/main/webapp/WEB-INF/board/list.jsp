<%@ page import="java.util.List" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.BoardDTO" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.PageResponseDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PageResponseDTO pageResponseDTO = (PageResponseDTO) request.getAttribute("pageResponseDTO");
    List<BoardDTO> boardList = pageResponseDTO.getBoardList();
    int pageNum = pageResponseDTO.getPageNum(); // 현재 페이지 번호
    int totalCount =  pageResponseDTO.getTotalCount(); // 현재 게시글 갯수
    int totalPage = pageResponseDTO.getTotalPage(); // 전체 페이지 수
    // 게시글 번호 일련번호로 변경 - 게시글이 한 페이지에 5개씩 나옴
    int n = totalCount - 5 * (pageNum - 1);

    // http://localhost:8080/board/boardList.do?items=subject&keyword=9&pageNum=2
    // 검색 결과 화면에서 페이지 이동 시 검색 결과 화면 유지
    String items = request.getParameter("items") != null ? request.getParameter("items") : "";
    String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";

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
                <td><%=n--%>
                </td>
                <td><a href="./boardView.do?bno=<%=boardDTO.getBno()%>&pageNum=<%=pageNum%>&items=<%=items%>&keyword=<%=keyword%>"><%=boardDTO.getSubject()%>
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
                // 한 블럭에 나올 페이지 수
                int pagePerBlock = 5; //
                // 전체 블럭의 수
                int totalBlock = totalPage % pagePerBlock == 0 ?
                        totalPage / pagePerBlock : (totalPage / pagePerBlock) + 1;
                // 현재 블럭
                int thisBlock = ((pageNum - 1) / pagePerBlock) + 1;

                // 현재 블럭의 첫 페이지 ex) 3block -> 11, 6block -> 26
                int firstPage = (thisBlock - 1) * pagePerBlock + 1;

                // 현재 블럭의 마지막 페이지
                int lastPage = thisBlock * pagePerBlock; // firstPage + pagePerBlock;

                // 마지막 블럭의 마지막 페이지
                // lastPage = (lastPage > totalPage) ? totalPage : lastPage
                // 둘이 같은 말임
                lastPage = Math.min(lastPage, totalPage);
            %>
            <%
                if (firstPage != 1) {
            %>
            <a href="./boardList.do?pageNum=<%=firstPage - 1%>&items=<%=items%>&keyword=<%=keyword%>">[ 이전 ]</a>
            <%
                }
            %>

            <%
                for (int i = firstPage; i <= lastPage; i++) {
            %>
            <!-- // 검색 결과 화면에서 페이지 이동 시 검색 결과 화면 유지 -->
            <a href="./boardList.do?pageNum=<%=i%>&items=<%=items%>&keyword=<%=keyword%>">
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
            <%
                if (lastPage != totalPage) {
            %>
            <a href="./boardList.do?pageNum=<%=lastPage + 1%>&items=<%=items%>&keyword=<%=keyword%>">[ 다음 ]</a>
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
                            <option value="subject"
                                    <% if (items.equals("subject")) {out.println("selected");} %>>제목에서</option>
                            <option value="content"
                                    <% if (items.equals("content")) {out.println("selected");} %>>본문에서</option>
                            <option value="name"
                                    <% if (items.equals("name")) {out.println("selected");} %>>글쓴이에서</option>
                        </select>
                        <input name="keyword" type="text" value="<%=keyword%>"/>
                        <input type="submit" id="btnAdd" class= "btn btn-primary" value="검색"/>
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
