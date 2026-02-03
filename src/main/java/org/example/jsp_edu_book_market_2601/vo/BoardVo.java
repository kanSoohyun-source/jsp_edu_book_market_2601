package org.example.jsp_edu_book_market_2601.vo;

import lombok.*;
import org.example.jsp_edu_book_market_2601.DTO.BoardDTO;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class BoardVo {
    /*
    DB 와 구조 유사, DB에 저장할 데이터나 DB 에서 가져온 데이터를 담는 용도
     */
    private  Integer bno;
    private String memberId;
    private String name;
    private String subject;
    private String content;
    private Integer hit;
    private String ip;
    private String addDate;

    public BoardDTO toDTO() {
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setBno(bno);
        boardDTO.setMemberId(memberId);
        boardDTO.setName(name);
        boardDTO.setSubject(subject);
        boardDTO.setContent(content);
        boardDTO.setHit(hit);
        boardDTO.setIp(ip);
        boardDTO.setAddDate(addDate);

        return boardDTO;
    }
}
