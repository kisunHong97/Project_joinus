package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessUserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessUserMapper {

    void insert(BusinessUserVO vo);
    int b_idCheck(String b_id);
    BusinessUserVO MemberLogin(String b_id) throws Exception;
    Long getMaxBno();





}
