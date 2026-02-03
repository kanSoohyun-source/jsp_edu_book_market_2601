package org.example.jsp_edu_book_market_2601.DTO;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private  Integer bno;
    private String memberId;
    private String name;
    private String subject;
    private String content;
    private Integer hit;
    private String ip;
    private String addDate;

    public BoardVo toVO() {
        BoardVo boardVo = BoardVo.builder()
                .bno(bno).memberId(memberId).name(name)
                .subject(subject).content(content)
                .hit(hit).ip(ip).addDate(addDate).build();
        return boardVo;
    }
}
