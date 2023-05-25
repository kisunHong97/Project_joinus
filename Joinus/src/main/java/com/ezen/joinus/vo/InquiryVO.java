package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class InquiryVO {
    private int ino;
    private int pno;
    private int sno;
    private String u_id;
    private String p_name;
    private String u_name;
    private String i_title;
    private String u_inquiry;
    private String inquiry_date;
    private String status;


}
