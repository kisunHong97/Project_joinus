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
    private int sno;
    private String p_name;
    private String u_name;
    private String u_inquiry;
    private Date inquiry_date;
    private String response;
    private String status;


}
