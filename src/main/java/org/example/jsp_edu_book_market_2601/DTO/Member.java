package org.example.jsp_edu_book_market_2601.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor

public class Member {
    private String memberId; // 아이디
    private String passwd; // 비밀번호
    private String memberName; // 이름
    private String gender; // 성별
    private String birthday; // 생일 예) 2000-10-01
    private String email;; // 이메일 예) abc@abc.com
    private String phone; // 전화번호
    private String address; // 주소
}
