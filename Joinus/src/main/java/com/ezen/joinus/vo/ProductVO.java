package com.ezen.joinus.vo;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class ProductVO {
    private int sno;
    private int pno;
    private String p_name;
    private String p_subtitle;
    private String p_content;
    private int p_price;
    private String p_image;
    private String p_period;
    private String p_category;

//    private List<AttachFileDTO> listAttach;

//    찜 목록 테이블 생성 후 주석 해제
//    private int wish_count;
//    private String wish_product;
}
