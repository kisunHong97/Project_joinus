package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class BusinessStore {//store_table

    private Long sno;
    private  String  storename ;
    private  String  storeaddresscode ;
    private  String  storeaddressStreet ;
    private  String  storeaddressDetail ;
    private  String  storeinst ;
    private  String  storeurl ;
    private  String  storeimages ;
    private  String  storenumber;
    private Long bno;


}
