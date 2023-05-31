package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CustomerUserMapper {

    int u_idCheck(String u_id);
    CustomerUserVO CustomerLogin(String u_id) throws Exception;
    CustomerUserVO getCustomerById(String b_id);
    void insertCustomer(CustomerUserVO vo);
    void modifyCustomer(CustomerUserVO vo);
    void deleteCustomer(String u_id);
    void update(Map<String, Object> paramMap);
    void insertreview(ReviewVO vo);
    List<ReviewVO> getreview(int pno);
    List<ReviewVO> customerreview(String u_id);

}