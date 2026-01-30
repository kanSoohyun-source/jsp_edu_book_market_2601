package org.example.jsp_edu_book_market_2601.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor

public class Product {
    private String productId; // 상품 아이디
    private String productName; // 상품명
    private int unitPrice; // 상품 가격
    private String description; // 상품 설명
    private String manufacturer; // 제조사
    private String category; // 분류
    private int unitsInStock; // 재고 수
    private String condition; // 신상 / 중고 / 재생품

    public Product() {

    }

    public Product(String productId, String productName, int unitPrice) {
        this.productId = productId;
        this.productName = productName;
        this.unitPrice = unitPrice;
    }
}
