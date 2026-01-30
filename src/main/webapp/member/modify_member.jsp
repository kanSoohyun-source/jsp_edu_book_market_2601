<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 정보 수정</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">
      회원 정보 수정
    </h1>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-8">
      <%@include file="../inc/dbconn.jsp" %>
      <%
        String memberId = (String) session.getAttribute("sessionMemberId");
        // 인증 처리
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean isAuth = false;
        Member member = null;

        String sql = "SELECT * FROM member WHERE member_id = ?";
        try {
          preparedStatement = connection.prepareStatement(sql);
          preparedStatement.setString(1, memberId);
          resultSet = preparedStatement.executeQuery();

          if (resultSet.next()) {
              member = Member.builder()
                      .memberId(resultSet.getString("member_id"))
                      .passwd(resultSet.getString("passwd"))
                      .memberName(resultSet.getString("member_name"))
                      .gender(resultSet.getString("gender"))
                      .birthday(resultSet.getString("birthday"))
                      .email(resultSet.getString("email"))
                      .phone(resultSet.getString("phone"))
                      .zipCode(resultSet.getString("zip_code"))
                      .address01(resultSet.getString("address01"))
                      .address02(resultSet.getString("address02"))
                      .addDate(resultSet.getString("add_date")).build();
          } else {

          }

        } catch (SQLException e) {

        }
      %>
      <form name="formAddMember" action="modify_member_process.jsp" method="post" class="form-horizontal">
        <div class="form-group row">
          <label class="col-sm-2" for="memberId">아이디</label>
          <div class="col-sm-5">
            <input type="text" name="memberId" id="memberId" class="form-control" value="<%=member.getMemberId()%>" readonly >
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2" for="passwd">비밀번호</label>
          <div class="col-sm-5">
            <input type="password" name="passwd" id="passwd" class="form-control" value="<%=member.getPasswd()%>">
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
            <input type="text" name="memberName" id="memberName" class="form-control" value="<%=member.getMemberName()%>">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">성별</label>
          <div class="col-sm-3">
            <label><input type="radio" name="gender" value="Male"
              <%if(member.getGender().equals("Male")) out.println("checked");%>> 남</label>
            <label><input type="radio" name="gender" value="Female"
              <% if(member.getGender().equals("Female")) out.println("checked"); %>> 여</label>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">생년월일</label>
          <div class="col-sm-6">
            <input type="text" name="birthYear" maxlength="4" placeholder="년(Year)" size="6" value="<%=member.getBirthday().split("-")[0]%>">
            <select name="birthMonth">
              <option value="">월</option>
              <option value="01"
                      <%if(member.getBirthday().split("-")[1].equals("01")) out.println("selected"); %>>1</option>
              <option value="02"
                      <%if(member.getBirthday().split("-")[1].equals("02")) out.println("selected"); %>>2</option>
              <option value="03"
                      <%if(member.getBirthday().split("-")[1].equals("03")) out.println("selected"); %>>3</option>
              <option value="04"
                      <%if(member.getBirthday().split("-")[1].equals("04")) out.println("selected"); %>>4</option>
              <option value="05"
                      <%if(member.getBirthday().split("-")[1].equals("05")) out.println("selected"); %>>5</option>
              <option value="06"
                      <%if(member.getBirthday().split("-")[1].equals("06")) out.println("selected"); %>>6</option>
              <option value="07"
                      <%if(member.getBirthday().split("-")[1].equals("07")) out.println("selected"); %>>7</option>
              <option value="08"
                      <%if(member.getBirthday().split("-")[1].equals("08")) out.println("selected"); %>>8</option>
              <option value="09"
                      <%if(member.getBirthday().split("-")[1].equals("09")) out.println("selected"); %>>9</option>
              <option value="10"
                      <%if(member.getBirthday().split("-")[1].equals("10")) out.println("selected"); %>>10</option>
              <option value="11"
                      <%if(member.getBirthday().split("-")[1].equals("11")) out.println("selected"); %>>11</option>
              <option value="12"
                      <%if(member.getBirthday().split("-")[1].equals("12")) out.println("selected"); %>>12</option>
            </select>
            <input type="text" name="birthDay" maxlength="2" placeholder="일(day)" size="4" value="<%=member.getBirthday().split("-")[2]%>">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2">이메일</label>
          <div class="col-sm-7">
            <input type="text" name="email1" maxlength="50" size="20" value="<%=member.getEmail().split("@")[0]%>">@
            <select name="email2">
              <option value="naver.com"
                      <%if(member.getEmail().split("@")[1].equals("naver.com")) out.println("selected"); %>>naver.com</option>
              <option value="gmail.com"
                      <%if(member.getEmail().split("@")[1].equals("gmail.com")) out.println("selected"); %>>gmail.com</option>
              <option value="nate.com"
                      <%if(member.getEmail().split("@")[1].equals("nate.com")) out.println("selected"); %>>nate.com</option>
            </select>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2" for="phone">연락처</label>
          <div class="col-sm-5">
            <input type="text" name="phone" id="phone" class="form-control" value="<%=member.getPhone()%>">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2" for="zipCode">우편번호</label>
          <div class="col-sm-5">
            <input type="text" name="zipCode" id="zipCode" class="form-control" value="<%=member.getZipCode()%>">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2" for="address01">주소 01</label>
          <div class="col-sm-5">
            <input type="text" name="address01" id="address01" class="form-control" value="<%=member.getAddress01()%>">
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2" for="address02">주소 02</label>
          <div class="col-sm-5">
            <input type="text" name="address02" id="address02" class="form-control" value="<%=member.getAddress02()%>">
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
<jsp:include page="../inc/footer.jsp"/>
