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
    <%@include file="/inc/menu.jsp"%>
    <%!
        String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
        String tagline = "Welcome to Web Market";
    %>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                <%=greeting%>
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <h3>
                <%=tagline%>
            </h3>
            
            <%
                response.setIntHeader("Refresh", 5); // 페이지 새로고침 설정
                // 1. 현재 시각 가져오기
                LocalDateTime now = LocalDateTime.now();
                // 2. 원하는 포멧 정의(hh -> 12시간제, HH -> 24시간제, a -> 오전/오후 표시)
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm:ss a");
                //3. 포멧 적용 및 출력
                String currentTime = now.format(formatter);
                out.println("현재 접속 시각: " + currentTime);
            %>
        </div>
        <hr>
    </div>
    <%@include file="/inc/footer.jsp"%>

</body>
</html>
