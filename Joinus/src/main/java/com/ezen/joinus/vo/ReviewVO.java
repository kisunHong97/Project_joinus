package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class ReviewVO {
    private int rno;
    private int pno;
    private String u_id;
    private String u_name;
    private String review;
    private String sys_date;
    private int rating;
    private String p_name;


}
