<%@ page import="org.example.jsp_edu_book_market_2601.DTO.Member" %>
<%@ page import="org.example.jsp_edu_book_market_2601.DAO.MemberRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
1. 넘어온 form 값을 변수 처리
2. DTO에 저장 (Member)
3. DAO에 저장(MemberRepasitory)
4. 목록으로 이동(/member/result_list.jsp)
--%>
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
  String address = request.getParameter("address");

  // 생년월일
  String birthday = birthYear + "-" + birthMonth + "-" + birthDay;
  // 이메일
  String email = email1 +"@"+ email2;

  // 2. DTO에 저장 (Member)
  Member member = Member.builder().memberId(memberId).passwd(passwd).memberName(memberName)
          .gender(gender).birthday(birthday).email(email).phone(phone).address(address).build();

  // 3. DAO에 저장(MemberRepasitory)
  MemberRepository memberRepository = MemberRepository.getInstance();
  memberRepository.addMember(member);

  // 4. 목록으로 이동(/member/result_list.jsp)
  response.sendRedirect("/member/result_member.jsp?msg=1");

%>