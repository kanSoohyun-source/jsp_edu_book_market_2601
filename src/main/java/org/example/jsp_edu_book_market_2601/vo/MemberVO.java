package org.example.jsp_edu_book_market_2601.vo;

import lombok.*;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class MemberVO {
    private String memberId; // 아이디
    private String passwd; // 비밀번호
    private String memberName; // 이름
    private String gender; // 성별
    private String birthday; // 생일 예) 2000-10-01
    private String email;; // 이메일 예) abc@abc.com
    private String phone; // 전화번호
    private String zipCode; // 우편 번호
    private String address01; // 자동으로 완성되는 주소
    private String address02; // 사용자가 입력하는 주소
    private String addDate; // 회원 가입일 (시간 포함)
}
