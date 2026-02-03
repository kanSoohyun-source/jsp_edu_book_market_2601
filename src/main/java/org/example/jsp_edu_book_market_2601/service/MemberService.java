package org.example.jsp_edu_book_market_2601.service;

import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DAO.BoardDAO;
import org.example.jsp_edu_book_market_2601.DAO.MemberDAO;
import org.example.jsp_edu_book_market_2601.DTO.MemberDTO;
import org.example.jsp_edu_book_market_2601.util.MapperUtil;
import org.example.jsp_edu_book_market_2601.vo.MemberVO;
import org.modelmapper.ModelMapper;

@Log4j2

public class MemberService {
    private final MemberDAO memberDAO = MemberDAO.getInstance();
    private final ModelMapper modelMapper = MapperUtil.INSTANCE.getInstance();

    private static MemberService instance;
    private MemberService() {}
    public static MemberService getInstance() {
        if (instance == null) {
            instance = new MemberService();
        }
        return instance;
    }

    // 로그인 처리 - 인증 여부
    public boolean isAuth(String memberId, String passwd) {
        boolean isAuth = false;
        MemberVO memberVO = memberDAO.selectMember(memberId);
        if(memberVO != null && memberVO.getPasswd().equals(passwd)) { // 아이디가 있고 비밀번호가 맞을 때
            isAuth = true;
        }
        return isAuth;
    }

    public MemberDTO getMember(String memberId) {
        MemberVO memberVO = memberDAO.selectMember(memberId);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        log.info("memberDTO: " + memberDTO);
        return memberDTO;
    }

    public void addMember(MemberDTO memberDTO) {
        log.info("addMember.memberDTO: " + memberDTO);
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        memberDAO.insertMember(memberVO);
    }

    public void modifyMember(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        memberDAO.updateMember(memberVO);
    }
}
