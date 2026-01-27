<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                회원 가입
            </h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <form name="formAddMember" action="add_member_process.jsp" method="post" class="form-horizontal">
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
                        <label class="col-sm-2" for="passwdConfirm">비밀번호 확인</label>
                        <div class="col-sm-5">
                            <input type="password" name="passwdConfirm" id="passwdConfirm" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="memberName">이름</label>
                        <div class="col-sm-5">
                            <input type="text" name="memberName" id="memberName" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2">성별</label>
                        <div class="col-sm-3">
                            <label><input type="radio" name="gender" value="Male" checked> 남</label>
                            <label><input type="radio" name="gender" value="Female"> 여</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2">생년월일</label>
                        <div class="col-sm-6">
                            <input type="text" name="birthYear" maxlength="4" placeholder="년(Year)" size="6">
                            <select name="birthMonth">
                                <option value="">월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <input type="text" name="birthDay" maxlength="2" placeholder="일(day)" size="4">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2">이메일</label>
                        <div class="col-sm-7">
                            <input type="text" name="email1" maxlength="50" size="20">@
                            <select name="email2">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="phone">연락처</label>
                        <div class="col-sm-5">
                            <input type="text" name="phone" id="phone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2" for="address">주소</label>
                        <div class="col-sm-5">
                            <input type="text" name="address" id="address" class="form-control">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-primary" value="가입">
                        </div>
                    </div>

                </form>
            </div>

        </div>
        <hr>
    </div>
    <jsp:include page="../inc/footer.jsp"/>

</body>
</html>
