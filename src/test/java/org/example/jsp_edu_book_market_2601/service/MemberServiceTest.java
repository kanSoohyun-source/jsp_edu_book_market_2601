package org.example.jsp_edu_book_market_2601.service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2

class MemberServiceTest {
    private final MemberService memberService = MemberService.getInstance();

    @Test
    public void testLogin() {
        // 1. 정보가 맞는 경우
        String memberId = "test1";
        String passwd = "1234";

        if (memberService.isAuth(memberId, passwd)) {
            log.info("Login successful");
        }

        // 2. 아이디는 맞고 비밀번호가 틀린 경우
        passwd = "7894";
        if (!memberService.isAuth(memberId, passwd)) {
            log.info("passwd incorrect");
        }

        // 3. 아이디가 틀린 경우
        memberId = "tester";
        if (!memberService.isAuth(memberId, passwd)) {
            log.info("memberId incorrect");
        }
    }
}