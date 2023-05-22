package com.ezen.joinus.vo;

import com.ezen.joinus.dto.AttachFileDTO;
import lombok.*;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class ProductCartVO {
    private ProductVO productVO;
    private CartVO cartVO;

}
