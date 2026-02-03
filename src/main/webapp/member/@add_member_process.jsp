<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
1. 넘어온 form 값을 변수 처리
2. DTO에 저장 (Member)
4. 목록으로 이동(/member/result_list.jsp)
--%>
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
  String sql = "INSERT INTO member " +
          "(member_id, passwd, member_name, gender, birthday, email, phone, zip_code, address01, address02, add_date) " +
          "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ";

  try {
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, memberId);
    preparedStatement.setString(2, passwd);
    preparedStatement.setString(3, memberName);
    preparedStatement.setString(4, gender);
    preparedStatement.setString(5, birthDay);
    preparedStatement.setString(6, email);
    preparedStatement.setString(7, phone);
    preparedStatement.setString(8, zipCode);
    preparedStatement.setString(9, address01);
    preparedStatement.setString(10, address02);

    if (preparedStatement.executeUpdate() == 1) {
      response.sendRedirect("../member/result_member.jsp?msg=1");
    } else {
      response.sendRedirect("../member/add_member.jsp");
    }

  } catch (SQLException e) {

  }

%>