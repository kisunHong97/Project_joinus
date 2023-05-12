package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CustomerUserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerUserMapper {
    void insert(CustomerUserVO vo);
    int u_idCheck(String u_id);
    CustomerUserVO CustomerLogin(String u_id) throws Exception;
    CustomerUserVO getCustomerById(String b_id);
}
