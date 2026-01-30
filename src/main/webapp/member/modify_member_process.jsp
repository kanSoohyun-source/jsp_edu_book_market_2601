<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp" %>
<%
  // 넘어온 form 값을 변수 처리
  String memberId = request.getParameter("memberId");
  String passwd = request.getParameter("passwd");
  String memberName = request.getParameter("memberName");
  String gender = request.getParameter("gender");
  String birthYear = request.getParameter("birthYear");
  String birthMonth = request.getParameter("birthMonth");
  String birthDay = request.getParameter("birthDay");
  String email1 = request.getParameter("email1");
  String email2 = request.getParameter("email2");
  String phone = request.getParameter("phone");
  String zipCode = request.getParameter("zipCode");
  String address01 = request.getParameter("address01");
  String address02 = request.getParameter("address02");

  // 생년월일
  birthDay = birthYear + "-" + birthMonth + "-" + birthDay;
  // 이메일
  String email = email1 +"@"+ email2;

  // DB 저장
  PreparedStatement preparedStatement = null;
  String sql = "UPDATE member SET passwd = ?, member_name = ?, gender = ?, birthday = ?, email = ? " +
          ", phone = ?, zip_code = ?, address01 = ?, address02 = ? WHERE member_id = ?";

  try {
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, passwd);
    preparedStatement.setString(2, memberName);
    preparedStatement.setString(3, gender);
    preparedStatement.setString(4, birthDay);
    preparedStatement.setString(5, email);
    preparedStatement.setString(6, phone);
    preparedStatement.setString(7, zipCode);
    preparedStatement.setString(8, address01);
    preparedStatement.setString(9, address02);
    preparedStatement.setString(10, memberId);

    if (preparedStatement.executeUpdate() == 1) {
      response.sendRedirect("../member/modify_member.jsp");
    } else {
      response.sendRedirect("../main/welcome.jsp");
    }

  } catch (SQLException e) {

  }

%>
