package org.example.jsp_edu_book_market_2601.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DTO.MemberDTO;
import org.example.jsp_edu_book_market_2601.service.MemberService;

import java.io.IOException;

@Log4j2
@WebServlet(name = "memberController", value = {"/member/loginProcess", "/member/addMemberProcess"
        ,"/member/logout", "/member/modifyMember"})

public class MemberController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp); // doPost로 넘기기
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberService memberService = MemberService.getInstance();
        String requestURI = req.getRequestURI(); // 요청 URI
        String contextPath = req.getContextPath(); // 컨텍스트 경로
        String command = requestURI.substring(contextPath.length()); // 요청 URI에서 컨텍스트 경로를 제거한 명령어

        log.info("requestURI: {}", requestURI);
        log.info("contextPath: {}", contextPath);
        log.info("command: {}", command); // 파일 경로에서 이름을 불러오기 위한 명령어

        // 세션에서 로그인 여부 가져오기 (login_process 참조)
        // session이 내장 객체가 아니기 때문에 type 선언 해야 함
        HttpSession session = req.getSession();

        switch (command) {
            case "/member/loginProcess" -> { // 로그인 처리
                String memberId = req.getParameter("memberId");
                String passwd = req.getParameter("passwd");

                if (memberService.isAuth(memberId, passwd)) { // 인증 성공 -> 사용자가 입력한 아이디와 비번이 데이터 베이스에 저장된 정보와 동일
                    session.setAttribute("isAuth", true);
                    session.setAttribute("sessionMemberId", memberId);

                    MemberDTO memberDTO = memberService.getMember(memberId);
                    session.setAttribute("sessionName", memberDTO.getMemberName());

                    // 로그인 성공
                    resp.sendRedirect("result_member.jsp?msg=2");
                } else {
                    resp.sendRedirect("login.jsp?error=1");
                }
            }
            case "/member/addMemberProcess" -> {
                log.info("addMemberProcess");

                // 넘어온 값 변수 처리
                String memberId = req.getParameter("memberId");
                String passwd = req.getParameter("passwd");
                String memberName = req.getParameter("memberName");
                String gender = req.getParameter("gender");
                String birthYear = req.getParameter("birthYear");
                String birthMonth = req.getParameter("birthMonth");
                String birthDay = req.getParameter("birthDay");
                String email1 = req.getParameter("email1");
                String email2 = req.getParameter("email2");
                String phone = req.getParameter("phone");
                String zipCode = req.getParameter("zipCode");
                String address01 = req.getParameter("address01");
                String address02 = req.getParameter("address02");

                // 생년월일
                birthDay = birthYear + "-" + birthMonth + "-" + birthDay;
                // 이메일
                String email = email1 +"@"+ email2;

                MemberDTO memberDTO = new MemberDTO();
                memberDTO.setMemberId(memberId);
                memberDTO.setPasswd(passwd);
                memberDTO.setMemberName(memberName);
                memberDTO.setGender(gender);
                memberDTO.setBirthday(birthDay);
                memberDTO.setEmail(email);
                memberDTO.setPhone(phone);
                memberDTO.setZipCode(zipCode);
                memberDTO.setAddress01(address01);
                memberDTO.setAddress02(address02);

                memberService.addMember(memberDTO);

                resp.sendRedirect("/member/result_member.jsp?msg=1");
            }
            case "/member/logout" -> {
                session.invalidate();
                resp.sendRedirect("/");
            }
            case "/member/modifyMember" -> {
                log.info("modifyMember");

                // 넘어온 값 변수 처리
                String memberId = req.getParameter("memberId");
                String passwd = req.getParameter("passwd");
                String memberName = req.getParameter("memberName");
                String gender = req.getParameter("gender");
                String birthYear = req.getParameter("birthYear");
                String birthMonth = req.getParameter("birthMonth");
                String birthDay = req.getParameter("birthDay");
                String email1 = req.getParameter("email1");
                String email2 = req.getParameter("email2");
                String phone = req.getParameter("phone");
                String zipCode = req.getParameter("zipCode");
                String address01 = req.getParameter("address01");
                String address02 = req.getParameter("address02");

                // 생년월일
                birthDay = birthYear + "-" + birthMonth + "-" + birthDay;
                // 이메일
                String email = email1 +"@"+ email2;

                MemberDTO memberDTO = new MemberDTO();
                memberDTO.setMemberId(memberId);
                memberDTO.setPasswd(passwd);
                memberDTO.setMemberName(memberName);
                memberDTO.setGender(gender);
                memberDTO.setBirthday(birthDay);
                memberDTO.setEmail(email);
                memberDTO.setPhone(phone);
                memberDTO.setZipCode(zipCode);
                memberDTO.setAddress01(address01);
                memberDTO.setAddress02(address02);

                memberService.modifyMember(memberDTO);
                resp.sendRedirect("/member/modify_member.jsp");
            }
        }

    }
}
