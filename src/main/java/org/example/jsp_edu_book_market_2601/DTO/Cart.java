package org.example.jsp_edu_book_market_2601.DTO;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Cart {
    private String productId; // 상품 아이디
    private int cartCnt; // 장바구니에 담은 갯수

}
