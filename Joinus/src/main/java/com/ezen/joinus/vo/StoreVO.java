package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class StoreVO {//store_table

    private int sno;
    private  String  storename ;
    private  String  storeaddresscode ;
    private  String  storeaddressStreet ;
    private  String  storeaddressDetail ;
    private  String  storeinst ;
    private  String  storeurl ;
    private  String  storeimages ;
    private  String  storenumber;
    private int bno;


}
