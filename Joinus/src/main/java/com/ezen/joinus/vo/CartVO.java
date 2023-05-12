package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class CartVO {
    private int cno;
    private int pno;
    private String u_id;
    private Date w_date;
    private int quantity;
    private ProductVO product;

}
