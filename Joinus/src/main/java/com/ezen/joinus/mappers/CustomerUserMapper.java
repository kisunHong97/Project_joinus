package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CustomerUserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface CustomerUserMapper {

    int u_idCheck(String u_id);
    CustomerUserVO CustomerLogin(String u_id) throws Exception;
    CustomerUserVO getCustomerById(String b_id);
    void insertCustomer(CustomerUserVO vo);
    void updateCustomer(CustomerUserVO vo);
    void deleteCustomer(String u_id);
    void update(Map<String, Object> paramMap);

}