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
    private String b_pwd1;
    private String b_pwd2;
    private String b_email;
    private String b_phone;
    private String b_address;

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getB_pwd1() {
        return b_pwd1;
    }

    public void setB_pwd1(String b_pwd1) {
        this.b_pwd1 = b_pwd1;
    }

    public String getB_pwd2() {
        return b_pwd2;
    }

    public void setB_pwd2(String b_pwd2) {
        this.b_pwd2 = b_pwd2;
    }

    public String getB_email() {
        return b_email;
    }

    public void setB_email(String b_email) {
        this.b_email = b_email;
    }

    public String getB_phone() {
        return b_phone;
    }

    public void setB_phone(String b_phone) {
        this.b_phone = b_phone;
    }

    public String getB_address() {
        return b_address;
    }

    public void setB_address(String b_address) {
        this.b_address = b_address;
    }

    public char getAuth() {
        return auth;
    }

    public void setAuth(char auth) {
        this.auth = auth;
    }

    private char auth;
}

