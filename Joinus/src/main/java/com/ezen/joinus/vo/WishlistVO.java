package com.ezen.joinus.vo;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class WishlistVO {
    private int wno;
    private int pno;
    private String u_id;
    private Date w_date;

}
