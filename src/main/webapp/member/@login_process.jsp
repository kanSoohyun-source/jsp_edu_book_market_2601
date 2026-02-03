<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../inc/dbconn.jsp" %>
<%
  // form 태그로 전달받은 값 저장
  String memberId = request.getParameter("memberId");
  String passwd = request.getParameter("passwd");
  String guestId = session.getId();

  String memberName = null;
  // 인증 처리
  PreparedStatement preparedStatement = null;
  ResultSet resultSet = null;
  boolean isAuth = false;

  String sql = "SELECT * FROM member WHERE member_id = ?";
  try {
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, memberId);
    resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
      if (resultSet.getString("passwd").equals(passwd)) {
        memberName = resultSet.getString("member_name");
        isAuth = true;
      }
    } else {

    }

  } catch (SQLException e) {

  }

  // 인증 처리에 따른 페이지 이동
  if (isAuth) { // 인증 성공 -> 사용자가 입력한 아이디와 비번이 데이터 베이스에 저장된 정보와 동일
    session.setAttribute("isAuth", true);
    session.setAttribute("sessionMemberId", memberId);
    session.setAttribute("sessionName", memberName);

        sql = "UPDATE cart SET member_id = ? WHERE guest_id = ?";
        try {
          preparedStatement = connection.prepareStatement(sql);
          preparedStatement.setString(1,memberId);
          preparedStatement.setString(2, guestId);
          preparedStatement.executeUpdate();

        } catch (SQLException e) {

        }



    // 로그인 성공
    response.sendRedirect("result_member.jsp?msg=2");
  } else {
    response.sendRedirect("login.jsp?error=1");
  }
%>
