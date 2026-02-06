<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@include file="../inc/menu.jsp"%>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                로그인
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <%
                    String error = request.getParameter("error");
                    if(error != null) {
                        out.println("<div>아이디 또는 비밀번호가 틀렸습니다.</div>");
                    }
                %>
                <form name="frmLogin" action="/member/loginProcess" method="post" class="form-horizontal">
                    <div class="form-group row">
                        <label class="col-sm-2" for="memberId">아이디</label>
                        <div class="col-sm-5">
                            <input type="text" name="memberId" id="memberId" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="passwd">비밀번호</label>
                        <div class="col-sm-5">
                            <input type="password" name="passwd" id="passwd" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-primary" value="로그인">
                            <input type="reset" class="btn btn-danger" value="취소">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <hr>
    </div>
    <%@include file="../inc/footer.jsp"%>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const frm = document.querySelector('form[name=frmLogin]') // form 태그 호출
            frm.querySelector('input[type=submit]').addEventListener('click', function (event) {
                event.preventDefault(); // 페이지 이동 방지
                if (frm.querySelector('input[name=memberId]').value.trim() === '') {
                    alert('아이디를 입력해주세요')
                    frm.querySelector('input[name=memberId]').focus()
                    return;
                }
                if (frm.querySelector('input[name=passwd]').value.trim() === '') {
                    alert('비밀번호를 입력해주세요')
                    frm.querySelector('input[name=passwd]').focus()
                    return;
                }
                frm.submit()  // 페이지 이동 실행
            })
        })
    </script>

</body>
</html>
