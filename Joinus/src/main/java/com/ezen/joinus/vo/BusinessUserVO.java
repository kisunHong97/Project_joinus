package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class BusinessUserVO {//business_table
    private int bno;
    private String b_name;
    private String b_id;
    private String b_pwd;
    private String b_email;
    private String b_phone;
    private String b_addresscode;
    private String b_addressStreet;
    private String b_addressDetail;
    private char auth;
}

