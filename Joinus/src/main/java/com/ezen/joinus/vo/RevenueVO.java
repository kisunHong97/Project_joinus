package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class RevenueVO {//store_table

    private int sno;
    private String revenue_date;
    private int revenue_amount;
}
