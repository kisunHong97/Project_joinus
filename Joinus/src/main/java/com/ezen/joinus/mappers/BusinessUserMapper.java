package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessUserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessUserMapper {


    int b_idCheck(String b_id);
    BusinessUserVO MemberLogin(String b_id) throws Exception;
    int getMaxBno();
    BusinessUserVO getBusinessById(String b_id);
    void insertBusiness(BusinessUserVO vo);
    void upadteBusiness(BusinessUserVO vo);//사업자 정보 수정

    void deleteBusiness(String b_id);//사업자회원 탈퇴

}
