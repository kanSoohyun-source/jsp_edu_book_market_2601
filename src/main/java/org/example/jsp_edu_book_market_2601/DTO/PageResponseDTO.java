package org.example.jsp_edu_book_market_2601.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class PageResponseDTO {
    private List<BoardDTO> boardList;
    private int pageNum;
    private int totalCount;
    private int totalPage;
}
