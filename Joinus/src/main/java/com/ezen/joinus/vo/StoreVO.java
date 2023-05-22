package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class StoreVO {//store_table

    private int sno;
    private int bno;
    private String s_name ;
    private String s_addrCode ;
    private String s_addrStreet ;
    private String s_addrDetail ;
    private String s_inst ;
    private String s_email;
    private String s_URL ;
    private String s_phone;
    private int s_revenue;

}
