package org.example.jsp_edu_book_market_2601.DAO;

import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.vo.MemberVO;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2

class MemberDAOTest {
    private MemberDAO memberDAO = MemberDAO.getInstance();

    @Test
    public void getMember() {
        String memberId = "test";
        MemberVO memberVO = memberDAO.selectMember(memberId);
        log.info(memberVO);
    }

    @Test
    public void insertMember() {
        MemberVO memberVO = MemberVO.builder()
                .memberId("tester")
                .passwd("1234")
                .memberName("insertTest")
                .gender("Male")
                .birthday("1999-01-01")
                .email("3456@gmail.com")
                .phone("010-2345-3456")
                .zipCode("23456")
                .address01("어쩌구저쩌구")
                .address02("블라블라").build();
        memberDAO.insertMember(memberVO);
    }

    @Test
    public void updateMember() {
        MemberVO memberVO = MemberVO.builder()
                .memberId("tester")
                .passwd("1234")
                .memberName("modifyTest")
                .gender("Male")
                .birthday("1999-01-01")
                .email("3456@gmail.com")
                .phone("010-2345-3456")
                .zipCode("23456")
                .address01("어쩌구저쩌구")
                .address02("블라블라").build();
        memberDAO.updateMember(memberVO);
    }
}