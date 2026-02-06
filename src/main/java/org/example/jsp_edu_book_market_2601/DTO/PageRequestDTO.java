package org.example.jsp_edu_book_market_2601.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class PageRequestDTO {
    private String items;
    private String keyword;
    private int pageNum;
}
