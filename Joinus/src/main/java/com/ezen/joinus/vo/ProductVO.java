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
public class ProductVO {
    private int pno;
    private int sno;
    private String p_name;
    private String p_inst;
    private String p_category;
    private String p_type;
    private Date p_startDate;
    private Date p_endDate;
    private int p_price;
    private List<AttachFileDTO> thumbnailList;
    private AttachFileDTO detail;

}
