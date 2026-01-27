<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.MemberRepository" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Member" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                회원 정보
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <%
                /* 회원 가입, 정보 수정, 로그인, 탈퇴 결과 페이지 */

                String msg = request.getParameter("msg");

                if (msg != null) {
                    if (msg.equals("0")) {
                        out.println("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
                    } else if (msg.equals("1")) {
                        out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
                    } else if (msg.equals("2")) {
                        String loginName = (String) session.getAttribute("sessionName");
                        out.println("<h2 class='alert alert-danger'>" + loginName + "님 환영합니다.</h2>");
                    }
                } else {
                    out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
                }

                MemberRepository memberDao = MemberRepository.getInstance();

            %>

        <hr>
    </div>
    <jsp:include page="../inc/footer.jsp"/>

</body>
</html>
