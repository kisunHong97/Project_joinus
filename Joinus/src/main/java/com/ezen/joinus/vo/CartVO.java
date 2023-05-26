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
    private int c_price;
    private String c_startDate;
    private String c_endDate;
    private Date w_date;
    private ProductVO product;

}
