<%@ page import="org.example.jsp_edu_book_market_2601.DAO.MemberRepository" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // form 태그로 전달받은 값 저장
  String memberId = request.getParameter("memberId");
  String passwd = request.getParameter("passwd");
  // 인증 처리
  MemberRepository memberRepository = MemberRepository.getInstance();
  Member member = memberRepository.getMemberById(memberId);

  boolean isAuth = false; // 인증 처리 결과

  if (member != null && passwd.equals(member.getPasswd())) {
    isAuth = true;
  }



  // 인증 처리에 따른 페이지 이동
  if (isAuth) { // 인증 성공 -> 사용자가 입력한 아이디와 비번이 데이터 베이스에 저장된 정보와 동일
    session.setAttribute("isAuth", true);
    session.setAttribute("sessionMemberId", memberId);
    session.setAttribute("sessionName", member.getMemberName());

    // 로그인 성공
    response.sendRedirect("result_member.jsp?msg=2");
  } else {
    response.sendRedirect("login.jsp?error=1");
  }
%>
