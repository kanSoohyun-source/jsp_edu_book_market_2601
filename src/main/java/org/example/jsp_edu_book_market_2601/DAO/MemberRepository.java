package org.example.jsp_edu_book_market_2601.DAO;

import lombok.Getter;
import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DTO.Member;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Getter

public class MemberRepository {
    /* DB 도입 전까지 임시로 사용. 싱글턴 패턴 */

    private static MemberRepository instance = null;
    private final List<Member> members = new ArrayList<>();

    public static MemberRepository getInstance() {
        if (instance == null) {
            instance = new MemberRepository();
        }
        if (instance.members.isEmpty()) {
            instance.members.add(
                    Member.builder().memberId("test")
                            .passwd("1111")
                            .memberName("테스터").build()
            );
        }
        return instance;
    }

    private MemberRepository() {
    }

    public Member getMemberById(String memberId) {
        /* 회원 아이디로 회원 검색 후 반환 */
        for (Member member : members) {
            if (member.getMemberId().equals(memberId)) {
                return member;
            }
        }
        return null;
    }

    public void addMember(Member member) {
        log.info("Adding member " + member);
        /* 회원 가입 시 사용 */
        members.add(member);
    }
}
