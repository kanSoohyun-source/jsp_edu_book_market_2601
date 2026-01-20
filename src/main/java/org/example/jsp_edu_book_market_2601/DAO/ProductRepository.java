package org.example.jsp_edu_book_market_2601.DAO;

import lombok.Getter;
import org.example.jsp_edu_book_market_2601.DTO.Product;

import java.util.ArrayList;
import java.util.List;

@Getter

public class ProductRepository {
    private List<Product> products = new ArrayList<>();

    public ProductRepository() {
        Product phone = new Product("P1234", "iPhone 15 Pro", 1600000);
        phone.setDescription("6.1-inch, 2556x1179 Super Retina XDR display, 48-megapixel main camera, A17 Pro chip");
        phone.setCategory("Smart Phone");
        phone.setManufacturer("Apple");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        products.add(phone);

        Product notebook = new Product("P1235", "LG Gram 16", 2200000);
        notebook.setDescription("16-inch, WQXGA IPS display, 13th Gen Intel Core i7 processor, ultra-lightweight design");
        notebook.setCategory("Notebook");
        notebook.setManufacturer("LG");
        notebook.setUnitsInStock(1000);
        notebook.setCondition("Refurbished");
        products.add(notebook);

        Product tablet = new Product("P1236", "Galaxy Tab S9 Ultra", 1400000);
        tablet.setDescription("14.6-inch, Dynamic AMOLED 2X display, Snapdragon 8 Gen 2 processor, S Pen support");
        tablet.setCategory("Tablet");
        tablet.setManufacturer("Samsung");
        tablet.setUnitsInStock(1000);
        tablet.setCondition("Old");
        products.add(tablet);
    }

    public Product getProductByID(String productID) {
        // 반복문을 사용해서 매개변수로 받은 아이디의 상품이면 반환하도록
        for (Product product : products) {
            if (product.getProductId().equals(productID)) {
                return product;
            }
        }
        return null;
    }

}
