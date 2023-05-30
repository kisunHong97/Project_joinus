package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class CustomerUserVO {
    private int uno;
    private String u_id;
    private String u_name;
    private String u_pwd;
    private String u_email;
    private String u_phone;
    private String u_addrcode;
    private String u_addrStreet;
    private String u_addrDetail;
    private int buypoint;
    private char auth;
    private int paypoint;
    private int wish_cnt;
    private int cart_cnt;
}



