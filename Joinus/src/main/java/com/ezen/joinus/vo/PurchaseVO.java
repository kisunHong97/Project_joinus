package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class PurchaseVO {
    private int sno;
    private String u_id;
    private int pno;
    private String p_name;
    private int p_price;
    private String memo;
    private String startDate;
    private String endDate;
}
